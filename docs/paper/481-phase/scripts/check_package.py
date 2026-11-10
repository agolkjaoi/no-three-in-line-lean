"""Verify every distributed file against MANIFEST.sha256 (no mathematics)."""
from pathlib import Path, PurePosixPath
import hashlib

def main():
    root=Path(__file__).resolve().parent.parent
    seen=set()
    for line in (root/'MANIFEST.sha256').read_text().splitlines():
        expected,rel=line.split('  ',1)
        path=PurePosixPath(rel)
        if path.is_absolute() or '..' in path.parts or ':' in rel or '\\' in rel or rel in seen:
            raise ValueError('Invalid manifest entry')
        resolved=(root/rel).resolve()
        if root not in resolved.parents:
            raise ValueError('Manifest path escaped package')
        actual=hashlib.sha256(resolved.read_bytes()).hexdigest()
        if actual!=expected:
            raise AssertionError('File hash mismatch: '+rel)
        seen.add(rel)
    print(f'PASS: {len(seen)} distributed file hashes match. This checks identity, not mathematical correctness.')

if __name__=='__main__':
    main()
