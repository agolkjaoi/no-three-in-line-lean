#!/usr/bin/env python3
"""Direct rectangle clipping; no imports from earlier capacity checkers.
All 144 finite direction/type-pair rows, axes, and the height>=8 tail.
"""
from __future__ import annotations
from fractions import Fraction as F
from pathlib import Path
from math import gcd
import csv,hashlib,json,time
ROOT=Path(__file__).resolve().parent

def main():
    start=time.monotonic();path=ROOT/'data'/'field_units.txt'
    u=list(map(int,path.read_text().split()));assert len(u)==1024 and min(u)>=0
    scale=F(249,250*10**8);K=F(255,128);lam=F(4,5)
    rows=[]
    directions=[(a,b) for a in range(8) for b in range(-7,8)
                if (a>0 or b>0) and gcd(a,abs(b))==1]
    assert len(directions)==72
    for dx,dy in directions:
        h=max(abs(dx),abs(dy));shift=(dx%2)+2*(dy%2)
        for r in range(4):
            s=r^shift
            if r>=s:continue
            field=[[u[r*256+i*16+j]+u[s*256+i*16+j] for j in range(16)] for i in range(16)]
            a,b=dx,dy
            if abs(b)>abs(a):
                a,b=b,a;field=[list(z) for z in zip(*field)]
            if a<0:a,b=-a,-b
            assert a==h
            if b==0:
                numerator=max(sum(field[i][j] for i in range(16)) for j in range(16))
                cap=scale*F(numerator,32*h);intercept=None
            else:
                bb=abs(b);sgn=1 if b>0 else -1
                ks=sorted({a*j-b*i for i in range(17) for j in range(17)})
                largest=-1;intercept=None
                for k in ks:
                    total=0
                    for j in range(16):
                        c=sgn*(a*j-k);d=sgn*(a*(j+1)-k);lo=min(c,d);hi=max(c,d)
                        for i in range(16):
                            length=max(0,min(bb*(i+1),hi)-max(bb*i,lo))
                            total+=field[i][j]*length
                    if total>largest:largest,intercept=total,k
                cap=scale*F(largest,32*bb*h)
            assert cap<(K if h<=3 else lam)
            rows.append({'dx':dx,'dy':dy,'height':h,'type_r':r,'type_s':s,
                         'capacity':str(cap),'designated':h<=3,'maximizing_transformed_intercept':intercept})
    tails=[]
    for r in range(4):
        for s in range(r+1,4):
            val=scale*F(max(u[r*256+i]+u[s*256+i] for i in range(256)),16)
            assert val<lam;tails.append({'r':r,'s':s,'upper':str(val)})
    UH=max(F(r['capacity']) for r in rows if r['designated'])
    UL=max(F(r['capacity']) for r in rows if not r['designated'])
    UT=max(F(r['upper']) for r in tails)
    report={'method':'direct integer clipping of each rectangle', 'rows':len(rows),
            'designated_rows':sum(r['designated'] for r in rows),'UH':str(UH),'UL':str(UL),'Utail':str(UT),
            'K':str(K),'lambda':str(lam),'K_margin':str(K-UH),'lambda_margin':str(lam-max(UL,UT)),
            'all_rows_pass':True,'field_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),
            'elapsed_seconds':time.monotonic()-start,'tail_pairs':tails}
    out=ROOT/'evidence';out.mkdir(exist_ok=True)
    with (out/'capacity_independent_rows.csv').open('w') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
    (out/'CAPACITY_INDEPENDENT.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))
if __name__=='__main__':main()
