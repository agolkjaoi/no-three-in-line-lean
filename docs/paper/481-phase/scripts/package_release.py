"""Package the completed paper, fixed input and fresh replay; exclude build scratch."""
from pathlib import Path
import hashlib
import json
import zipfile

def main():
    root=Path(__file__).resolve().parent.parent
    ev=root/'evidence'
    check=json.loads((root/'verification/evidence/EXECUTION_PROVENANCE.json').read_text())
    assert check['status'].startswith('PASS:')
    for rel,digest in check['input_and_source_sha256'].items():
        assert hashlib.sha256((root/'verification'/rel).read_bytes()).hexdigest()==digest, rel
    assert hashlib.sha256((root/'verification/reproduce.py').read_bytes()).hexdigest()==check['driver_sha256']
    assert json.loads((ev/'replay_comparison.json').read_text())['byte_identical_accepted_csvs']==481
    assert json.loads((ev/'arithmetic.json').read_text())['geometric_report']['arithmetic_consistency']=='PASS'
    qa=json.loads((ev/'pdf_qa.json').read_text())
    visual=json.loads((ev/'visual_review.json').read_text())
    assert not qa['pending_execution_status']
    assert visual['status']=='PASS' and visual['pdf_sha256']==qa['sha256']
    assert 'REPLAY_STATUS_PENDING' not in (root/'sections/06_application.tex').read_text()
    selected=set()
    for name in ['main.tex','README.txt','LICENSE','SOURCE_MAP.json','output/pdf/no_three_in_line_481_en.pdf']:
        selected.add(root/name)
    for sub,patterns in {
        'sections':['*.tex'], 'data':['*.json'], 'scripts':['*.py','*.ps1'],
        'evidence':['*.json','*.txt'], 'verification':['*.py','*.txt'],
        'verification/data':['*.txt','*.bin'],
        'verification/independent':['*.cpp','*.inc','*.py','*.sh'],
        'verification/evidence':['*.json','*.csv','*.log','*.txt'],
    }.items():
        for pattern in patterns:
            selected.update((root/sub).glob(pattern))
    paths=sorted(selected,key=lambda p:p.relative_to(root).as_posix())
    lines=[]
    for p in paths:
        assert p.is_file()
        lines.append(hashlib.sha256(p.read_bytes()).hexdigest()+'  '+p.relative_to(root).as_posix())
    manifest=root/'MANIFEST.sha256'
    manifest.write_text('\n'.join(lines)+'\n',encoding='utf-8')
    paths.append(manifest)
    archive=root.parent/'no_three_line_481_complete_en_20261110.zip'
    with zipfile.ZipFile(archive,'w',compression=zipfile.ZIP_DEFLATED,compresslevel=9) as z:
        for p in paths:
            z.write(p,root.name+'/'+p.relative_to(root).as_posix())
    with zipfile.ZipFile(archive) as z:
        assert z.testzip() is None
        assert len(z.infolist())==len(paths)
        for line in lines:
            expected,rel=line.split('  ',1)
            assert hashlib.sha256(z.read(root.name+'/'+rel)).hexdigest()==expected
    print(json.dumps({'archive':archive.name,'files':len(paths),'bytes':archive.stat().st_size,
                      'sha256':hashlib.sha256(archive.read_bytes()).hexdigest()},indent=2))

if __name__=='__main__':
    main()
