#!/usr/bin/env python3
"""Build and fully replay the 481-phase input in a new directory.

Requires Python 3.10+, g++ with OpenMP and UBSan (Linux/WSL).
Example: python3 verification/reproduce.py --output replay-481 --threads 4
Existing directories are refused. No cached phase result is accepted.
"""
from pathlib import Path
import argparse
import datetime
import hashlib
import json
import os
import platform
import shutil
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parent

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--threads', type=int, default=4)
    parser.add_argument('--cxx', default='g++')
    args = parser.parse_args()
    if not 1 <= args.threads <= 64:
        parser.error('threads must be between 1 and 64')
    dest = args.output.resolve()
    if dest.exists():
        parser.error('output must be a new directory')
    if ROOT == dest or ROOT in dest.parents:
        parser.error('output must be outside the packaged verification directory')
    files = [
        'data/field_units.txt', 'data/full_rank.bin', 'data/SOURCE_LICENSE.txt',
        'independent/check_phase.cpp', 'independent/farey_independent.inc',
        'independent/replay_all.py', 'independent/build.sh',
        'check_capacity_independent.py', 'check_clock_constants.py',
        'check_report_integrity.py',
    ]
    compiler = shutil.which(args.cxx)
    if compiler is None:
        parser.error('C++ compiler not found: ' + args.cxx)
    # Identify the exact reviewed mathematical input before executing any checker.
    expected_inputs = {
        'data/field_units.txt': '7cc7337012ace9346b19622c74e9fe05c270372dcb34951a53359a8ccf82ec92',
        'data/full_rank.bin': 'a0b1ccc5ad66694b6aca433e804c0ccf3e2d784c8b42c58c31734bc8e052bb89',
    }
    for rel, expected in expected_inputs.items():
        if sha(ROOT / rel) != expected:
            raise ValueError('Unexpected input: ' + rel)
    dest.mkdir(parents=True)
    for rel in files:
        target = dest / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(ROOT / rel, target)
    ev = dest / 'evidence'
    ev.mkdir()
    started = time.monotonic()
    meta = {
        'status': 'RUNNING',
        'scope': 'Fresh deterministic geometric execution; not formal certification of the stochastic proof.',
        'started_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'platform': platform.system() + ' ' + platform.release(),
        'python': platform.python_version(),
        'threads': args.threads,
        'cached_phase_records_reused': 0,
        'input_and_source_sha256': {rel: sha(dest / rel) for rel in files},
        'driver_sha256': sha(Path(__file__)),
        'commands': [],
    }
    def save():
        (ev / 'EXECUTION_PROVENANCE.json').write_text(json.dumps(meta, indent=2) + '\n')
    env = dict(os.environ, OMP_NUM_THREADS=str(args.threads),
               UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
    def run(cmd, cwd=dest, logname='driver.log'):
        record = {'command': cmd, 'working_directory': str(cwd.relative_to(dest))}
        meta['commands'].append(record)
        save()
        t0 = time.monotonic()
        with (ev / logname).open('w', encoding='utf-8') as log:
            child = subprocess.Popen(cmd, cwd=cwd, env=env, stdout=subprocess.PIPE,
                                     stderr=subprocess.STDOUT, text=True)
            for line in child.stdout:
                log.write(line)
                log.flush()
                print(line, end='', flush=True)
            code = child.wait()
        record.update(exit_code=code, elapsed_seconds=time.monotonic()-t0)
        save()
        if code:
            raise RuntimeError('Command failed; inspect ' + logname)
    try:
        version = subprocess.check_output([compiler, '--version'], text=True)
        meta['compiler_version'] = version
        (ev/'COMPILER_VERSION.txt').write_text(version)
        flags = ['-O3', '-g', '-std=c++17', '-fopenmp', '-fsanitize=undefined', '-fno-sanitize-recover=all']
        meta['build_flags'] = flags
        run([compiler, *flags, 'check_phase.cpp', '-o', 'check_phase'],
            cwd=dest/'independent', logname='BUILD.log')
        binary = dest/'independent'/'check_phase'
        meta['executable_sha256'] = sha(binary)
        run([sys.executable, 'check_capacity_independent.py'], logname='CAPACITY_RUN.log')
        run([sys.executable, 'check_clock_constants.py'], logname='CLOCK_RUN.log')
        run([sys.executable, 'independent/replay_all.py', '--threads', str(args.threads)],
            logname='REPLAY_RUN.log')
        run([sys.executable, 'check_report_integrity.py'], logname='INTEGRITY_RUN.log')
        if sha(binary) != meta['executable_sha256']:
            raise AssertionError('Executable changed during replay')
        if any(sha(dest/rel) != digest for rel,digest in meta['input_and_source_sha256'].items()):
            raise AssertionError('Input or source changed during replay')
        meta['status'] = 'PASS: fresh build, 481 phases, capacities, clock constants, and report integrity'
        meta['final_report_sha256'] = sha(ev/'FINAL_REPORT.json')
        meta['replay_summary_sha256'] = sha(ev/'REPLAY_0_481.json')
    except BaseException as exc:
        meta['status'] = 'FAIL'
        meta['error'] = str(exc)
        raise
    finally:
        meta['finished_utc'] = datetime.datetime.now(datetime.timezone.utc).isoformat()
        meta['elapsed_seconds'] = time.monotonic()-started
        save()
    print(meta['status'], flush=True)

if __name__ == '__main__':
    main()
