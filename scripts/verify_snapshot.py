"""Check distribution identity and recorded evidence, not mathematical validity.

Python 3.11+, standard library only. This command does not modify the snapshot.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
import sys
from urllib.parse import unquote

ROOT = Path(__file__).resolve().parents[1]
IGNORED = {".git", ".lake", ".build", "__pycache__"}


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def published_files():
    return sorted(p for p in ROOT.rglob("*") if p.is_file()
                  and not any(x in IGNORED for x in p.relative_to(ROOT).parts))


def lean_code(text: str) -> str:
    """Remove nested block/line comments and string literals for marker checks."""
    out, i = [], 0
    token = re.compile(r'/\-|--|"')
    while match := token.search(text, i):
        out.append(text[i:match.start()])
        start, i = match.start(), match.end()
        if match.group() == '/-':
            depth = 1
            block = re.compile(r'/\-|\-/')
            while depth:
                end = block.search(text, i)
                if end is None:
                    raise ValueError("unterminated Lean comment")
                depth += 1 if end.group() == '/-' else -1
                i = end.end()
        elif match.group() == '--':
            i = text.find('\n', i)
            if i == -1:
                i = len(text)
        else:
            while i < len(text):
                if text[i] == '\\':
                    i += 2
                elif text[i] == '"':
                    i += 1
                    break
                else:
                    i += 1
        out.append(' ' + '\n' * text[start:i].count('\n'))
    out.append(text[i:])
    return ''.join(out)


def local_imports(code: str) -> list[str]:
    imports = []
    for line in code.splitlines():
        match = re.match(r'^\s*(?:(?:public|private)\s+)?import\s+(.+?)\s*$', line)
        if match:
            imports.extend(x for x in match[1].split() if x.startswith('NoThreeLine.'))
    return imports


def verify(require_manifest=False):
    errors = []

    def check(condition, message):
        if not condition:
            errors.append(message)

    meta = json.loads((ROOT / 'snapshot.json').read_text(encoding='utf-8'))
    records = json.loads((ROOT / 'evidence/compilation.json').read_text(encoding='utf-8'))['modules']
    rows = {r['module']: r for r in records}
    check(len(rows) == len(records) == meta['included_modules'], 'module count mismatch')
    check(meta['final_target_proved'] is False, 'unexpected final target claim')
    actual = {p.relative_to(ROOT).as_posix() for p in (ROOT / 'NoThreeLine').rglob('*.lean')}
    check(actual == {r['source'] for r in records}, 'source inventory mismatch')
    source_bytes = source_lines = legacy = 0
    marker = re.compile(r'\b(?:sorry|admit|native_decide|sorryAx|Lean\.trustCompiler|Lean\.ofReduceBool)\b|^\s*(?:private\s+)?axiom\s', re.M)
    for name, row in rows.items():
        src = ROOT / row['source']
        if not src.is_file():
            check(False, f'missing source: {name}')
            continue
        raw = src.read_bytes()
        source_bytes += len(raw)
        source_lines += len(raw.decode('utf-8').splitlines())
        check(digest(raw) == row['source_sha256'], f'source hash: {name}')
        check(len(raw) == row['source_bytes'], f'source size: {name}')
        code = lean_code(raw.decode('utf-8'))
        check(not marker.search(code), f'forbidden proof marker: {name}')
        imports = local_imports(code)
        check(imports == row['imports'], f'import inventory: {name}')
        deps = {d['module']: d for d in row['local_imports']}
        for dep in imports:
            check(dep in rows and dep in deps, f'absent dependency: {name} -> {dep}')
            if dep in rows and dep in deps:
                check(deps[dep]['source_sha256'] == rows[dep]['source_sha256'], f'dependency source: {name} -> {dep}')
                check(deps[dep]['olean_sha256'] == rows[dep]['recorded_olean_sha256'], f'dependency artifact record: {name} -> {dep}')
        check(row['status'] == 'RECORDED_KERNEL_COMPILE_PASS', f'compile status: {name}')
        check(row['source_stable_during_original_compile'] is True, f'source stability: {name}')
        kind = row['import_evidence']
        if kind == 'legacy_saved_hash_and_import_timestamp_audit':
            legacy += 1
        elif imports:
            check(kind == 'compile_time_direct_import_hashes' and row['imports_stable_during_original_compile'] is True, f'import stability: {name}')
        else:
            check(kind == 'no_local_imports', f'import evidence: {name}')
        log = ROOT / row['log']
        if log.is_file():
            log_raw = log.read_bytes()
            check(digest(log_raw) == row['public_log_sha256'], f'log hash: {name}')
            check(not any(x in log_raw for x in (b'sorryAx', b'error:', b'Lean.trustCompiler', b'Lean.ofReduceBool')), f'log error/trust marker: {name}')
        else:
            check(False, f'missing log: {name}')
    check(source_bytes == meta['included_source_bytes'], 'total source size mismatch')
    check(source_lines == meta['included_source_lines'], 'total source lines mismatch')
    check(legacy == meta['legacy_dependency_audit_modules'], 'legacy evidence count mismatch')

    visiting, visited = set(), set()

    def visit(name):
        if name in visited or name not in rows:
            return
        if name in visiting:
            check(False, f'dependency cycle: {name}')
            return
        visiting.add(name)
        for dep in rows[name]['imports']:
            visit(dep)
        visiting.remove(name)
        visited.add(name)
    for name in rows:
        visit(name)

    root_code = lean_code((ROOT / 'NoThreeLine.lean').read_text(encoding='utf-8'))
    check(not marker.search(root_code), 'forbidden proof marker: entry module')
    check(all(x in rows for x in local_imports(root_code)), 'entry module dependency missing')
    notes = json.loads((ROOT / 'evidence/research-notes.json').read_text(encoding='utf-8'))['documents']
    for row in notes:
        check(digest((ROOT / row['path']).read_bytes()) == row['public_sha256'], f'research note hash: {row["path"]}')

    files = published_files()
    private_path = re.compile(r'[A-Za-z]:[\\/]+Users[\\/]+|/home/[^ /\s]+/|/Users/[^ /\s]+/')
    private_key = re.compile(r'-----BEGIN (?:RSA |OPENSSH |EC )?PRIVATE KEY-----|\bgh[pousr]_[A-Za-z0-9]{30,}\b|\bgithub_pat_[A-Za-z0-9_]{30,}\b')
    for path in files:
        rel = path.relative_to(ROOT).as_posix()
        if path.suffix in {'.olean', '.ilean', '.ir', '.pyc'}:
            check(False, f'build artifact distributed: {rel}')
        text = path.read_text(encoding='utf-8')
        check(not private_path.search(text), f'personal machine path: {rel}')
        check(not private_key.search(text), f'credential-shaped text: {rel}')
        if path.suffix == '.md':
            for link in re.findall(r'\]\(([^)]+)\)', text):
                link = link.strip().strip('<>')
                if re.match(r'^[a-zA-Z][a-zA-Z0-9+.-]*:', link) or link.startswith('#'):
                    continue
                destination = unquote(link.split('#', 1)[0])
                check((path.parent / destination).exists(), f'broken local link: {rel} -> {destination}')

    manifest = ROOT / 'MANIFEST.json'
    if manifest.is_file():
        listed = json.loads(manifest.read_text(encoding='utf-8'))['files']
        lookup = {r['path']: r for r in listed}
        actual_files = {p.relative_to(ROOT).as_posix(): p for p in files if p != manifest}
        check(set(actual_files) == set(lookup), 'manifest inventory mismatch')
        for rel, path in actual_files.items():
            if rel in lookup:
                raw = path.read_bytes()
                check(digest(raw) == lookup[rel]['sha256'] and len(raw) == lookup[rel]['bytes'], f'manifest mismatch: {rel}')
    else:
        check(not require_manifest, 'MANIFEST.json required but missing')
    return {
        'status': 'PASS' if not errors else 'FAIL',
        'modules': len(rows), 'source_lines': source_lines, 'source_bytes': source_bytes,
        'legacy_import_audits': legacy, 'public_files': len(files),
        'manifest_checked': manifest.is_file(), 'full_fresh_rebuild': False,
        'scope': 'Distribution integrity and recorded evidence, not a new proof check.',
        'errors': errors,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--require-manifest', action='store_true')
    args = parser.parse_args()
    try:
        result = verify(args.require_manifest)
    except (OSError, ValueError, KeyError) as exc:
        result = {'status': 'FAIL', 'errors': [str(exc)]}
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0 if result['status'] == 'PASS' else 1


if __name__ == '__main__':
    sys.exit(main())
