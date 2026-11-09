"""Build selected snapshot modules, or all modules, in dependency order.

Default: invoke Lake. Offline mode: --packages DIR --lean EXECUTABLE.
Artifact reuse is opt-in; directly requested targets are always compiled in
offline mode. Reports and artifacts are written only below .build/.
"""
from __future__ import annotations

import argparse
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[1]
BUILD = ROOT / '.build'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')


def git_head(directory):
    """Read revision without invoking Git or updating a dependency checkout."""
    gitdir = directory / '.git'
    if gitdir.is_file():
        content = gitdir.read_text(encoding='utf-8').strip()
        if not content.startswith('gitdir: '):
            raise ValueError('unrecognized git directory pointer')
        gitdir = (directory / content[8:]).resolve()
    head = (gitdir / 'HEAD').read_text(encoding='utf-8').strip()
    if re.fullmatch(r'[0-9a-f]{40}', head):
        return head
    if not head.startswith('ref: '):
        raise ValueError('unrecognized Git HEAD')
    ref = head[5:]
    ref_file = gitdir / ref
    if ref_file.is_file():
        return ref_file.read_text(encoding='utf-8').strip()
    packed = gitdir / 'packed-refs'
    if packed.is_file():
        for line in packed.read_text(encoding='utf-8').splitlines():
            parts = line.split()
            if len(parts) == 2 and parts[1] == ref:
                return parts[0]
    raise ValueError('cannot resolve mathlib Git revision')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('modules', nargs='*', default=[])
    parser.add_argument('--all', action='store_true', help='build every included module')
    parser.add_argument('--packages', type=Path, help='read-only compiled dependency packages')
    parser.add_argument('--lean', help='Lean executable for offline mode')
    parser.add_argument('--artifact-cache', type=Path, help='optional prior local .olean root')
    parser.add_argument('--dependency-artifacts', type=Path, help='optional Lean importArts JSON')
    args = parser.parse_args()
    if args.all and args.modules:
        parser.error('choose --all or named modules')
    if not args.packages and any((args.lean, args.artifact_cache, args.dependency_artifacts)):
        parser.error('--lean, --artifact-cache and --dependency-artifacts require --packages')
    if args.packages and not args.lean:
        parser.error('--packages requires --lean')
    metadata = json.loads((ROOT / 'snapshot.json').read_text(encoding='utf-8'))
    records = json.loads((ROOT / 'evidence/compilation.json').read_text(encoding='utf-8'))['modules']
    rows = {r['module']: r for r in records}
    entry = ROOT / 'NoThreeLine.lean'
    rows['NoThreeLine'] = {'source': 'NoThreeLine.lean', 'source_sha256': sha(entry),
                          'imports': ['NoThreeLine.Target', 'NoThreeLine.AffineBranch', 'NoThreeLine.Concrete']}
    targets = sorted(rows) if args.all else (args.modules or ['NoThreeLine'])
    for name in targets:
        if name not in rows:
            parser.error(f'unknown snapshot module: {name}')
    order, visited, active = [], set(), set()

    def visit(name):
        if name in active:
            raise ValueError(f'import cycle: {name}')
        if name in visited:
            return
        active.add(name)
        for dep in rows[name]['imports']:
            visit(dep)
        active.remove(name)
        visited.add(name)
        order.append(name)
    for name in targets:
        visit(name)
    for name in order:
        if sha(ROOT / rows[name]['source']) != rows[name]['source_sha256']:
            raise ValueError(f'snapshot source changed: {name}')

    BUILD.mkdir(exist_ok=True)
    report = {'started_utc': datetime.now(timezone.utc).isoformat(),
              'mode': 'direct_lean_offline' if args.packages else 'lake',
              'targets': targets, 'dependency_closure_size': len(order),
              'all_requested': args.all, 'status': 'RUNNING', 'modules': []}
    write_json(BUILD / 'BUILD_REPORT.json', report)
    env = os.environ.copy()
    overlay = {}
    if args.packages:
        packages = args.packages.resolve()
        revision = git_head(packages / 'mathlib')
        version = subprocess.check_output([args.lean, '--version'], text=True).strip()
        if revision != metadata['mathlib_commit']:
            raise ValueError(f'mathlib revision mismatch: {revision}')
        expected_version = metadata['lean_toolchain'].split(':v', 1)[1]
        if not re.search(r'\bversion ' + re.escape(expected_version) + r'\b', version):
            raise ValueError(f'Lean version mismatch: {version}')
        report.update(lean_version=version, mathlib_commit=revision)
        package_paths = sorted(p / '.lake/build/lib/lean' for p in packages.iterdir()
                               if p.is_dir() and (p / '.lake/build/lib/lean').is_dir())
        if not (packages / 'mathlib/.lake/build/lib/lean').is_dir():
            raise ValueError('compiled mathlib directory missing')
        env['LEAN_PATH'] = os.pathsep.join(map(str, [BUILD / 'lib/lean'] + package_paths))
        if args.dependency_artifacts:
            incoming = json.loads(args.dependency_artifacts.read_text(encoding='utf-8'))
            for name, files in incoming.items():
                if name.startswith('NoThreeLine'):
                    raise ValueError('overlay cannot replace project modules')
                if not isinstance(files, list):
                    raise ValueError('importArts entries must be arrays of paths')
                overlay[name] = [str(Path(p).resolve()) for p in files]
            report['dependency_overlay'] = {
                name: [{'suffix': ''.join(Path(p).suffixes), 'sha256': sha(Path(p))} for p in files]
                for name, files in overlay.items()}
    else:
        if shutil.which('lake') is None:
            raise ValueError('lake is not on PATH; install the pinned toolchain first')

    try:
        for index, name in enumerate(order, 1):
            row = rows[name]
            source = ROOT / row['source']
            output = (BUILD / 'lib/lean' / Path(*name.split('.'))).with_suffix('.olean')
            output.parent.mkdir(parents=True, exist_ok=True)
            info = {'module': name, 'source_sha256': sha(source)}
            if args.packages and args.artifact_cache and name not in targets:
                cached = (args.artifact_cache / Path(*name.split('.'))).with_suffix('.olean')
                if cached.is_file() and sha(cached) == row.get('recorded_olean_sha256'):
                    shutil.copyfile(cached, output)
                    if sha(output) != row['recorded_olean_sha256']:
                        raise ValueError(f'artifact changed while copied: {name}')
                    info.update(status='REUSED_HISTORICAL_ARTIFACT', olean_sha256=sha(output))
                    report['modules'].append(info)
                    print(f'[{index}/{len(order)}] {name}: reused hash-matched artifact', flush=True)
                    continue
            if args.packages:
                setup = BUILD / 'setups' / (name + '.json')
                write_json(setup, {'name': name, 'package': None, 'isModule': False,
                                   'imports': None, 'importArts': overlay,
                                   'dynlibs': [], 'plugins': [], 'options': {}})
                command = [args.lean, f'--setup={setup}', '-o', str(output), row['source']]
            else:
                command = ['lake', 'build', name]
            print(f'[{index}/{len(order)}] {name}: compiling', flush=True)
            start = time.monotonic()
            result = subprocess.run(command, cwd=ROOT, env=env, capture_output=True)
            log_raw = result.stdout + result.stderr
            log = BUILD / 'logs' / (name + '.txt')
            log.parent.mkdir(parents=True, exist_ok=True)
            log.write_bytes(log_raw)
            text = log_raw.decode('utf-8', errors='replace')
            bad = any(x in text for x in ('sorryAx', 'error:', 'Lean.trustCompiler', 'Lean.ofReduceBool'))
            changed = sha(source) != info['source_sha256']
            passed = result.returncode == 0 and not bad and not changed
            if args.packages:
                passed = passed and output.is_file()
            info.update(status=('FRESH_COMPILE_PASS' if args.packages else 'LAKE_BUILD_PASS') if passed else 'FAIL',
                        exit_code=result.returncode, seconds=round(time.monotonic()-start, 3),
                        log=log.relative_to(ROOT).as_posix(), log_sha256=sha(log),
                        source_stable=not changed)
            if args.packages and output.is_file():
                info['olean_sha256'] = sha(output)
                info['direct_local_artifacts'] = {
                    dep: sha((BUILD / 'lib/lean' / Path(*dep.split('.'))).with_suffix('.olean'))
                    for dep in row['imports']}
            report['modules'].append(info)
            write_json(BUILD / 'BUILD_REPORT.json', report)
            if not passed:
                print(text[-6000:], flush=True)
                raise RuntimeError(f'build failed: {name}; see {log.relative_to(ROOT)}')
        report['status'] = 'PASS'
        return 0
    except (OSError, ValueError, RuntimeError) as exc:
        report['status'] = 'FAIL'
        report['error'] = str(exc)
        print(str(exc), file=sys.stderr)
        return 1
    finally:
        report['finished_utc'] = datetime.now(timezone.utc).isoformat()
        report['fresh_compiles'] = sum(r['status'] == 'FRESH_COMPILE_PASS' for r in report['modules'])
        report['reused_artifacts'] = sum(r['status'] == 'REUSED_HISTORICAL_ARTIFACT' for r in report['modules'])
        write_json(BUILD / 'BUILD_REPORT.json', report)
        print(json.dumps({k: v for k, v in report.items() if k not in ('modules', 'dependency_overlay')}, ensure_ascii=False), flush=True)


if __name__ == '__main__':
    try:
        sys.exit(main())
    except (OSError, ValueError, subprocess.CalledProcessError) as exc:
        print(str(exc), file=sys.stderr)
        sys.exit(1)
