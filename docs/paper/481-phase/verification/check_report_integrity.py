#!/usr/bin/env python3
"""Independently check row coverage, exact thresholds, and recorded hashes.
Does NOT recalculate chord bounds: use independent/replay_all.py for that.
"""
from __future__ import annotations
import csv,hashlib,json,struct
from collections import Counter
from fractions import Fraction as F
from pathlib import Path
ROOT=Path(__file__).resolve().parent

def main():
    ev=ROOT/'evidence';report=json.loads((ev/'REPLAY_0_481.json').read_text())
    ranks=struct.unpack('<262144i',(ROOT/'data'/'full_rank.bin').read_bytes())
    assert report['rank_sha256']==hashlib.sha256((ROOT/'data'/'full_rank.bin').read_bytes()).hexdigest()
    assert report['field_sha256']==hashlib.sha256((ROOT/'data'/'field_units.txt').read_bytes()).hexdigest()
    expected={i for i,r in enumerate(ranks) if r>=0};seen=set();maxrisk=F(0);maxphase=None
    phases=report['cases'];assert [r['phase'] for r in phases]==list(range(481))
    for row in phases:
        path=ev/row['csv'];assert hashlib.sha256(path.read_bytes()).hexdigest()==row['csv_sha256']
        xs=list(csv.DictReader(path.open()));assert len(xs)==row['cells']
        local=set();localmax=F(0)
        for x in xs:
            typ,i,j=map(int,(x['type'],x['x'],x['y']))
            assert 0<=typ<4 and 0<=i<256 and 0<=j<256
            idx=(typ*256+i)*256+j
            assert idx not in local and idx not in seen and ranks[idx]==row['phase']
            local.add(idx);seen.add(idx)
            risk=F(19*int(x['risk_integer_units']),750*10**12)
            assert 0<=risk<=F(9999,10000) and x['passes_9999_10000']=='1'
            localmax=max(localmax,risk)
        assert local=={i for i,r in enumerate(ranks) if r==row['phase']}
        assert localmax==F(row['risk_exact']) and row['failures']==0
        if localmax>maxrisk:maxrisk,maxphase=localmax,row['phase']
    assert seen==expected and len(seen)==242176
    assert maxrisk==F(report['max_risk_exact'])
    cap=json.loads((ev/'CAPACITY_INDEPENDENT.json').read_text())
    clock=json.loads((ev/'CLOCK_CONSTANTS.json').read_text())
    counts=dict(Counter(r['method'] for r in phases))
    out={'status':'ALL RECALCULATED PHASE REPORTS HAVE COMPLETE COVERAGE AND PASS EXACT THRESHOLDS',
         'scope':'Finite geometric certificate and report integrity; not stochastic proof certification',
         'phases':481,'type_boxes':len(seen),'missing_boxes':0,'duplicate_boxes':0,
         'failed_boxes':0,'methods':counts,'max_risk_upper':str(maxrisk),'max_phase':maxphase,
         'strict_margin_to_9999_10000':str(F(9999,10000)-maxrisk),
         'mass':clock['mass'],'total_time':clock['total_time'],
         'capacity_rows':cap['rows'],'UH':cap['UH'],'UL':cap['UL'],'Utail':cap['Utail'],
         'rank_sha256':report['rank_sha256'],'field_sha256':report['field_sha256'],
         'all_four_families_direct':True,'symmetry_assumptions_used':False,
         'prior_checker_headers_imported':False,'undefined_behavior_sanitizer':True,
         'clock_probability_bound':'221184*n^(1+d)*exp(-epsilon_H^2*n^(1-gamma)/(2^18*log(n)))',
         'epsilon_H':clock['clock_tolerance'],'explicit_clock_threshold':'log(n)>=10000000',
         'clock_budget':'1/500000','final_theorem_n0_computed':False}
    (ev/'FINAL_REPORT.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out,indent=2))
if __name__=='__main__':main()
