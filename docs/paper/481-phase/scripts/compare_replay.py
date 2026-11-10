"""Compare the fresh full run against the incoming dossier's per-phase hashes.

This is an additional equality check, not a replacement for recomputation.
"""
from pathlib import Path
import hashlib
import json

def main():
    root=Path(__file__).resolve().parent.parent
    prior=json.loads((root/'evidence/prior_csv_manifest.json').read_text())
    ev=root/'verification/evidence'
    fresh=json.loads((ev/'REPLAY_0_481.json').read_text())
    provenance=json.loads((ev/'EXECUTION_PROVENANCE.json').read_text())
    assert provenance['status'].startswith('PASS:'), 'Fresh driver did not complete'
    assert provenance['cached_phase_records_reused']==0
    assert fresh['phases_checked']==len(prior['phases'])==481
    assert fresh['type_cells_checked']==242176
    fields=('phase','method','cells','risk_exact','csv_sha256')
    for actual,expected in zip(fresh['cases'],prior['phases']):
        assert all(actual[k]==expected[k] for k in fields), actual['phase']
        assert hashlib.sha256((ev/actual['csv']).read_bytes()).hexdigest()==actual['csv_sha256']
    for name in ('check_phase.cpp','farey_independent.inc'):
        rel='independent/'+name
        actual=hashlib.sha256((root/'verification'/rel).read_bytes()).hexdigest()
        assert actual==prior['mathematical_checker_sha256'][rel]
        assert actual==provenance['input_and_source_sha256'][rel]
    sanitizer_logs=[]
    for path in ev.glob('*.log'):
        log=path.read_text(errors='replace')
        if any(word in log for word in ('runtime error:', 'UndefinedBehaviorSanitizer', 'Sanitizer:DEADLYSIGNAL')):
            sanitizer_logs.append(path.name)
    assert not sanitizer_logs, sanitizer_logs
    result={
        'status':'PASS: all accepted CSVs exactly match the prior full replay',
        'phases':481,'type_cells':242176,'byte_identical_accepted_csvs':481,
        'mathematical_cpp_source_unchanged':True,'fresh_compiler':provenance['compiler_version'].splitlines()[0],
        'fresh_replay_seconds':fresh['elapsed_seconds'],
        'fresh_driver_seconds':provenance['elapsed_seconds'],
        'max_risk_exact':fresh['max_risk_exact'],
        'sanitizer_error_logs':sanitizer_logs,
        'scope':'Equality of independently rerun deterministic outputs; not certification of stochastic mathematics.',
    }
    (root/'evidence/replay_comparison.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))

if __name__=='__main__':
    main()
