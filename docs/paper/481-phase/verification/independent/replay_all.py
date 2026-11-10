#!/usr/bin/env python3
"""Full independent geometric replay; exact division, all four families, UBSan.
Attempts a rigorous tube bound, with a complete Farey-angle fallback.
No prior reported risk values are used in acceptance.
"""
from __future__ import annotations
import argparse,csv,hashlib,json,os,struct,subprocess,time
from fractions import Fraction
from pathlib import Path
ROOT=Path(__file__).resolve().parent.parent

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--threads',type=int,default=4)
    ap.add_argument('--start',type=int,default=0)
    ap.add_argument('--end',type=int,default=481)
    args=ap.parse_args()
    if not (1<=args.threads<=64 and 0<=args.start<args.end<=481):raise ValueError('Invalid options')
    out=ROOT/'evidence';out.mkdir(exist_ok=True)
    if any(out.glob('accepted_*.json')) or any(out.glob('phase_*.csv')):
        raise RuntimeError('Use a fresh output directory; cached phase results are not accepted.')
    data=ROOT/'data';exe=ROOT/'independent'/'check_phase'
    env=dict(os.environ,OMP_NUM_THREADS=str(args.threads))
    ranks=struct.unpack('<262144i',(data/'full_rank.bin').read_bytes())
    positive=sum(v>=0 for v in ranks)
    allrows=[];started=time.monotonic()
    for j in range(args.start,args.end):
        accepted=out/f'accepted_{j:03d}.json'
        t0=time.monotonic();row=None
        for mode in (['global',''] if j==480 else ['', 'farey']):
            tag='tube_global' if mode=='global' else mode or 'tube'
            stem=out/f'phase_{j:03d}_{tag}'
            cmd=[str(exe),str(data),str(j),'2048',str(stem.with_suffix('.csv'))]
            if mode:cmd.append(mode)
            with stem.with_suffix('.json').open('w') as fout,stem.with_suffix('.log').open('w') as ferr:
                run=subprocess.run(cmd,stdout=fout,stderr=ferr,env=env)
            if run.returncode not in (0,1):raise RuntimeError(f'Checker error phase {j}; inspect {stem}.log')
            result=json.loads(stem.with_suffix('.json').read_text())
            rows=list(csv.DictReader(stem.with_suffix('.csv').open()))
            actual={(int(r['type'])*256+int(r['x']))*256+int(r['y']) for r in rows}
            expected={k for k,v in enumerate(ranks) if v==j}
            if actual!=expected or len(rows)!=len(expected):raise ValueError('Missing or duplicate boxes')
            failures=sum(Fraction(19*int(r['risk_integer_units']),750*10**12)>Fraction(9999,10000) for r in rows)
            if failures!=result['failures']:raise ValueError('Failure counter mismatch')
            if failures:
                print(f'phase={j} {tag}: {failures} upper bounds too coarse; trying fallback',flush=True)
                continue
            val=Fraction(int(result['risk_numerator']),int(result['risk_denominator']))
            assert val<=Fraction(9999,10000)
            row={**result,'method':tag,'seconds':time.monotonic()-t0,'risk_exact':str(val),
                 'csv':stem.with_suffix('.csv').name,
                 'csv_sha256':hashlib.sha256(stem.with_suffix('.csv').read_bytes()).hexdigest()}
            accepted.write_text(json.dumps(row,indent=2)+'\n');break
        if row is None:raise RuntimeError(f'No successful certificate for phase {j}')
        allrows.append(row)
        print(f'ACCEPT phase={j} method={row["method"]} cells={row["cells"]} upper={float(Fraction(row["risk_exact"])):.15f} seconds={row["seconds"]:.3f}',flush=True)
    summary={'scope':'Independent deterministic geometric replay, not stochastic-proof certification.',
             'start':args.start,'end':args.end,'phases_checked':len(allrows),
             'type_cells_checked':sum(r['cells'] for r in allrows),'positive_type_cells':positive,
             'all_four_direction_families_evaluated_directly':True,'symmetry_assumptions_used':False,
             'original_checker_headers_imported':False,'undefined_behavior_sanitizer':True,
             'integer_division':'ordinary division; signed 128-bit intermediates',
             'point_samples_used_as_acceptance_test':False,
             'max_risk_exact':str(max(Fraction(r['risk_exact']) for r in allrows)),
             'rank_sha256':hashlib.sha256((data/'full_rank.bin').read_bytes()).hexdigest(),
             'field_sha256':hashlib.sha256((data/'field_units.txt').read_bytes()).hexdigest(),
             'elapsed_seconds':time.monotonic()-started,'cases':allrows}
    if args.start==0 and args.end==481:
        assert summary['phases_checked']==481 and summary['type_cells_checked']==positive==242176
        summary['status']='ALL 481 PHASES ACCEPTED BY THE INDEPENDENT IMPLEMENTATION'
    (out/f'REPLAY_{args.start}_{args.end}.json').write_text(json.dumps(summary,indent=2)+'\n')
    print(json.dumps({k:v for k,v in summary.items() if k!='cases'},indent=2),flush=True)
if __name__=='__main__':main()
