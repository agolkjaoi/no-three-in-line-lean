#!/usr/bin/env python3
"""Exact 481-phase input and fixed-budget arithmetic; not an angular replay.

Only --output is written. --require-replay additionally requires consistent
geometric reports, but never substitutes for rebuilding/running their checker.
"""
import argparse
import hashlib
import json
import struct
from decimal import Decimal, localcontext
from fractions import Fraction as F
from itertools import combinations
from math import gcd, isqrt, prod
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path)
    parser.add_argument('--require-replay', action='store_true')
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    raw = (root/'data/parameters.json').read_bytes()
    data = json.loads(raw)
    p = {k:F(v) for k,v in data['rational_parameters'].items()}
    integers = data['integer_parameters']
    checks = []

    def check(name, condition):
        checks.append({'name':name,'passed':bool(condition)})
        if not condition:
            raise ValueError('Check failed: '+name)

    def exact(v):
        with localcontext() as ctx:
            ctx.prec = 60
            dec = str(Decimal(v.numerator)/Decimal(v.denominator))
        return {'fraction':str(v),'decimal_display':dec}

    # Build the masks from the actual data, not their summary or saved hashes.
    input_dir = root/'verification/data'
    blobs = {name:(input_dir/name).read_bytes() for name in data['input_sha256']}
    for name,expected in data['input_sha256'].items():
        check('input SHA256: '+name,hashlib.sha256(blobs[name]).hexdigest()==expected)
    units = list(map(int,blobs['field_units.txt'].split()))
    G = integers['spatial_grid']
    coarse = integers['coarse_grid']
    phases = integers['phase_count']
    check('field size and sign',len(units)==4*coarse**2 and min(units)>=0)
    check('rank byte length',len(blobs['full_rank.bin'])==4*4*G**2)
    ranks = struct.unpack('<'+str(4*G**2)+'i',blobs['full_rank.bin'])
    check('coarse-to-fine grid ratio',G==256 and coarse==16 and G%coarse==0)
    scale = p['time_scale']/integers['field_unit_denominator']
    maxima = [0]*phases
    phase_mass_units = [0]*phases
    phase_counts = [0]*phases
    valid = True
    total_units = 0
    positive = 0
    for typ in range(4):
        for i in range(G):
            for j in range(G):
                idx = (typ*G+i)*G+j
                v = units[typ*coarse**2+(i//16)*coarse+j//16]
                k = ranks[idx]
                if not (-1<=k<phases and ((v>0)==(k>=0))):
                    valid = False
                    continue
                total_units += v
                if k>=0:
                    maxima[k] = max(maxima[k],v)
                    phase_mass_units[k] += v
                    phase_counts[k] += 1
                    positive += 1
    check('positive field iff assigned valid rank',valid)
    check('all 481 phases nonempty',phases==481 and min(phase_counts)>0)
    check('all positive type/cells included once',positive==integers['positive_type_cells']==242176)
    check('coarse-to-fine mass identity',total_units==(G//coarse)**2*sum(units))
    check('phase partition mass identity',sum(phase_mass_units)==total_units)
    A = scale*F(total_units,4*G**2)
    T = scale*sum(maxima)
    check('actual field input mass',A==p['input_mass'])
    check('actual reverse schedule total time',T==p['total_time'])
    check('actual field maximum',scale*max(units)==p['field_max']<7)
    # Each cell has one rank and 0<v<=M_rank, so q=v/M_rank is in (0,1].
    # In forward order 480..0, tau*q=scale*v and the endpoint support is rank>=j.
    check('valid phase mask denominators',all(M>0 for M in maxima))
    c = p['target']
    Delta = A-c
    check('positive exact mass gap',Delta==p['mass_gap']>0)

    K,lam,rho = (p[x] for x in ('clock_cap','ordinary_cap','ordinary_floor'))
    rstar,recorded,a = (p[x] for x in ('continuum_risk_bound','recorded_max_risk','discrete_coefficient'))
    d,gamma,xi,zeta = (p[x] for x in ('d','gamma','xi','zeta'))
    check('clock cap',0<K<2)
    check('ordinary cap and credit floor',0<rho<1 and 0<=lam<1-rho)
    check('risk and exponent ordering',0<=recorded<rstar<a<d<gamma<1)
    check('recorded angular margin',rstar-recorded==F(50362733,93750000000000))
    check('continuum to discrete slack',a-rstar==F(1,320000))
    check('small positive exponents',0<xi<d and zeta>0)
    check('pair correction exponent margin',1-d-2*xi-zeta==F(47,10**6)>0)
    check('virtual exponent margin',gamma-d==F(1,40000))
    kappa = K-p['designated_bound']
    check('designated capacity margin',kappa==F(69405753,80000000000)>0)
    check('ordinary capacity margin',lam-p['ordinary_bound']==F(24358807047,3200000000000)>0)
    check('tail capacity bound',0<p['tail_bound']<lam)
    check('tag credit margin',1-rho-lam==F(3,40))

    factors = data['finite_sieve_factors']
    expected_primes = [x for x in range(3,1050,2)
                       if all(x%j for j in range(2,isqrt(x)+1))]
    check('175 specified odd primes',factors==expected_primes and len(factors)==175)
    check('pairwise coprime factors',all(gcd(q,r)==1 for q,r in combinations(factors,2)))
    DP = F(3,4)*prod((1-F(1,q*q) for q in factors),start=F(1))
    AP = prod((1+F(1,q*q) for q in factors),start=F(1))
    check('finite sieve density',0<DP<p['sieve_coefficient']==F(76,125))
    check('twelve-integral coefficient',p['sieve_coefficient']/24==F(19,750))
    check('sieve factor error sum',sum(q-1 for q in factors)==84164)
    CP = F(84184,3)
    CPactual = (5+F(sum(q-1 for q in factors),4))*AP
    check('finite sieve error coefficient',CPactual<CP)
    check('finite sieve modulus size',len(str(prod(factors)))==440)
    E0 = (4*G**2+1)*7
    Cgeom = 7**2+4*7*E0+2*E0**2+6*CP*(4*G**2+3)*7**2
    check('uniform geometric error constant',E0==1835015 and Cgeom==integers['geometric_error_constant']==8897332619623)
    check('explicit discrete comparison threshold',Cgeom<(a-rstar)*integers['discrete_log_threshold'])
    check('discrete threshold dominates log modulus bound',integers['discrete_log_threshold']>=sum(q-1 for q in factors))

    m = integers['guard_moment_order']
    eta_exponent = 4-m+2*m*xi+d*(m-1)+m*zeta+d
    virtual_exponent = 3-gamma*m+d*(m-1)+xi+d
    check('guard order fixed',m==2**18)
    check('pair-correction root-law exponent',eta_exponent==F('-8.320768')<0)
    check('virtual-deletion root-law exponent',virtual_exponent==F('-3.553599')<0)
    Cline = 4*G
    epsilon = kappa/(8*Cline*T)
    check('clock tolerance',epsilon==p['clock_tolerance']>F(1,2**34))
    check('clock finite input bounds',T<2**11 and kappa>F(1,2**11) and 4*G**2*7<2**21)
    check('clock capacity allowance',2*epsilon*T*Cline==kappa/4)
    check('clock intermediate bounds',3*T/epsilon<2**47 and 30*T<2**16 and 4*(4*G**2*7)/kappa<2**34)
    dirs = [(a0,b0) for a0 in range(4) for b0 in range(-3,4)
            if (a0>0 or b0>0) and gcd(a0,abs(b0))==1]
    check('designated direction count and widths',len(dirs)==integers['designated_direction_count']==16 and sum(abs(x)+abs(y) for x,y in dirs)==54)
    check('clock prefactor',4*54*Cline==221184<2**18)
    s0 = integers['clock_log_threshold']
    check('clock exponential threshold witnesses',s0==10**7 and F(s0,40000)==250 and s0**2<2**47 and 250-47>88 and s0>80000)

    h = (d-rstar)/4
    bcap = (d+rstar)/2
    qcap = (rstar+h/2)/(bcap-h)
    mcap = integers['cap_moment_order']
    check('cap hazard allowance',h==F(1,80000) and bcap==F(39997,40000))
    check('cap geometric ratio',qcap==F(159985,159986))
    check('cap fixed-order Bernoulli witness',26*159985<=mcap==2**22)
    check('cap probability budget',F(1,2**26)+F(1,10**6)<p['per_cause_budget'])
    check('cap product bound',F(2)/(2-K)==256 and (d-bcap)*integers['cap_log_threshold_strict']==128)

    e = (1-rho-lam)/(4*T*Cline)
    btag,ktag,mtag = (integers[k] for k in ('tag_block_length','tag_block_count','tag_moment_order'))
    tag_main = 16*Cline/(e*e)*F(1,2**ktag)
    check('tag cell allowance',e==p['tag_cell_allowance'])
    check('tag Bernoulli block witness',(btag-1)*e/2<1<=btag*e/2)
    check('tag fixed order',mtag==btag*ktag+3==11436859836 and ktag==87)
    check('tag repeated-leaf exponent',mtag>2 and 1-(1-d)*(mtag-1)<0)
    check('tag principal term',tag_main==F(100590099609629337889425049,219902325555200000000000000000000)<F(1,2000000))
    check('tag full budget',2*(tag_main+F(1,2000000))<p['per_cause_budget'])
    check('tag capacity allowance',Cline*T*e==F(3,160))

    eps = p['loss_budget']
    n0_grid = integers['mass_comparison_n']
    check('five-cause budget',5*p['per_cause_budget']==eps==F(1,100000))
    check('grid comparison threshold',n0_grid==2**24 and F(2*G,n0_grid)==F(1,2**15))
    final_margin = (1-eps)*A*(1-F(2*G,n0_grid))**2-c
    check('final exact positive comparison',final_margin==p['final_comparison_margin']>0)
    check('positive output probability witness',final_margin/(2-c)>F(1,64000))

    report_path = root/'verification/evidence/FINAL_REPORT.json'
    geometric_report = {'available':report_path.exists(),'freshness':'not certified by this arithmetic script'}
    if args.require_replay:
        check('required geometric report exists',report_path.exists())
    if report_path.exists():
        raw_report = report_path.read_bytes()
        report_data = json.loads(raw_report)
        check('geometric report input hashes',report_data['field_sha256']==data['input_sha256']['field_units.txt'] and report_data['rank_sha256']==data['input_sha256']['full_rank.bin'])
        check('geometric report mass and time',F(report_data['mass'])==A and F(report_data['total_time'])==T)
        check('geometric report complete counts',report_data['phases']==phases and report_data['type_boxes']==positive and report_data['missing_boxes']==report_data['duplicate_boxes']==report_data['failed_boxes']==0)
        check('geometric report risk bound',F(report_data['max_risk_upper'])==recorded)
        check('geometric report capacity bounds',report_data['capacity_rows']==144 and all(F(report_data[k])==p[v] for k,v in [('UH','designated_bound'),('UL','ordinary_bound'),('Utail','tail_bound')]))
        geometric_report['sha256'] = hashlib.sha256(raw_report).hexdigest()
        geometric_report['arithmetic_consistency'] = 'PASS'

    values = {'mass':A,'mass_gap':Delta,'total_time':T,'recorded_risk_margin':rstar-recorded,
              'discrete_coefficient':a,'geometric_error_constant':Cgeom,
              'finite_sieve_density':DP,'finite_sieve_error_coefficient':CP,
              'eta_root_law_exponent':eta_exponent,'virtual_root_law_exponent':virtual_exponent,
              'clock_tolerance':epsilon,'cap_hazard_ratio':qcap,'tag_cell_allowance':e,
              'tag_principal_term':tag_main,'final_comparison_margin':final_margin}
    report = {
        'edition_date':'2026-11-10','status':'PASS_EXACT_ARITHMETIC_AND_INPUT_RECONSTRUCTION',
        'scope':'Exact finite arithmetic, actual field/rank reconstruction, and optional geometric-report consistency.',
        'not_checked':['Fresh angular integration or capacity recomputation','Source/binary/build provenance of geometric execution','The stochastic lemmas as mathematical proofs','A complete Lean formalization','A numerical threshold for all five stochastic causes'],
        'parameters_sha256':hashlib.sha256(raw).hexdigest(),
        'input_sha256':data['input_sha256'],'phase_count':phases,'positive_type_cells':positive,
        'min_phase_type_cells':min(phase_counts),'max_phase_type_cells':max(phase_counts),
        'forward_order':'reverse ranks 480,479,...,0; q=w/max_phase and duration=scale*max_phase',
        'geometric_report':geometric_report,'passed_checks':len(checks),'checks':checks,
        'values':{k:exact(v) for k,v in values.items()}}
    rendered = json.dumps(report,indent=2)+'\n'
    if args.output:
        args.output.parent.mkdir(parents=True,exist_ok=True)
        args.output.write_text(rendered,encoding='utf-8')
        print(f'PASS: {len(checks)} exact checks; 481 phases and 242176 positive type/cells.')
    else:
        print(rendered,end='')


if __name__=='__main__':
    main()
