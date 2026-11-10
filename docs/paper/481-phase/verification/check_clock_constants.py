#!/usr/bin/env python3
"""Exact finite checks for the explicit protected-line argument.
This does not prove stochastic inequalities by running a simulation.
"""
from fractions import Fraction as F
from pathlib import Path
from math import gcd,isqrt,prod
import json,struct
ROOT=Path(__file__).resolve().parent

def main():
    u=list(map(int,(ROOT/'data'/'field_units.txt').read_text().split()))
    ranks=struct.unpack('<262144i',(ROOT/'data'/'full_rank.bin').read_bytes())
    scale=F(249,250*10**8);G=256
    A=scale*F(sum(u),4*16**2)
    byphase=[0]*481
    positive=0
    for r in range(4):
        for i in range(G):
            for j in range(G):
                k=(r*G+i)*G+j;value=u[r*256+(i//16)*16+j//16];rank=ranks[k]
                assert (value>0)==(rank>=0) and -1<=rank<481
                if rank>=0:byphase[rank]=max(byphase[rank],value);positive+=1
    assert positive==242176 and min(byphase)>0
    T=scale*sum(byphase)
    assert A==F(3842853135627,2560000000000)
    assert T==F(30088384743729,25000000000)
    assert scale*max(u)<7
    cap=json.loads((ROOT/'evidence'/'CAPACITY_INDEPENDENT.json').read_text())
    kappa=F(255,128)-F(cap['UH'])
    Cline=4*G
    epsilon=kappa/(8*Cline*T)
    assert epsilon>F(1,2**34) and epsilon<1
    assert T<2**11 and kappa>F(1,2**11)
    Ecap=4*G**2*7
    assert Ecap<2**21
    assert 2*epsilon*T*Cline==kappa/4
    assert 3*T/epsilon<2**47 and 30*T<2**16
    assert 4*Ecap/kappa<2**34
    directions=[(a,b) for a in range(4) for b in range(-3,4)
                if (a>0 or b>0) and gcd(a,abs(b))==1]
    assert len(directions)==16 and sum(abs(a)+abs(b) for a,b in directions)==54
    prefactor=4*54*Cline
    assert prefactor==221184 and prefactor<2**18
    # Quadratic variation constants and the two exponential denominators.
    assert 4*(1+2*16)==132
    assert 4*132==528
    assert 2*(528+11)==1078
    assert 8*F(1067,2)==4268
    assert 4268*32==136576<2**18
    assert 18+2*34==86
    s0=10**7
    assert F(s0,40000)==250 and F(s0,20000)==500
    assert s0**2<2**47 and 250-47>88
    assert s0>80000
    assert 2*s0-18>20 and F(1,2**20)<F(2,10**6)
    ps=[x for x in range(3,1050,2) if all(x%d for d in range(2,isqrt(x)+1))]
    assert len(ps)==175 and ps[-1]==1049
    DP=F(3,4)*prod(F(p*p-1,p*p) for p in ps)
    assert DP<F(76,125)
    report={'status':'ALL FINITE ARITHMETIC CHECKS PASSED',
        'scope':'Arithmetic and input checks, not probabilistic-proof certification',
        'mass':str(A),'total_time':str(T),'positive_type_cells':positive,
        'field_max':str(scale*max(u)),'designated_directions':len(directions),
        'direction_width_sum':54,'kappa_H':str(kappa),'clock_tolerance':str(epsilon),
        'clock_tolerance_lower_bound':'1/17179869184','line_piece_cap':Cline,
        'discrete_capacity_error':Ecap,'point_law_prefactor':prefactor,
        'explicit_clock_threshold':'log(n) >= 10000000',
        'clock_probability_budget':'1/500000',
        'final_n0_claimed':False,'finite_sieve_factors':ps,
        'finite_sieve_coefficient':str(DP)}
    (ROOT/'evidence'/'CLOCK_CONSTANTS.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k not in ('finite_sieve_factors','finite_sieve_coefficient')},indent=2))
if __name__=='__main__':main()
