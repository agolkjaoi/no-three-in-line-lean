#!/usr/bin/env python3
"""Check the small exact arithmetic ledger, not the full geometric certificate."""
import argparse
import hashlib
import json
from decimal import Decimal, localcontext
from fractions import Fraction as F
from itertools import combinations
from math import gcd, prod
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, help="Optional JSON report path")
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    raw = (root / "data" / "parameters.json").read_bytes()
    data = json.loads(raw)
    p = {name: F(value) for name, value in data["rational_parameters"].items()}
    checks = []

    def check(name, condition):
        checks.append({"name": name, "passed": bool(condition)})
        if not condition:
            raise ValueError("Arithmetic check failed: " + name)

    def exact(value):
        with localcontext() as ctx:
            ctx.prec = 60
            dec = str(Decimal(value.numerator) / Decimal(value.denominator))
        return {"fraction": str(value), "decimal_display": dec}

    s, A, c = p["time_contraction"], p["scaled_mass"], p["target"]
    T, K, lam, rho = p["scaled_time"], p["clock_cap"], p["ordinary_cap"], p["ordinary_floor"]
    d, gamma, xi, zeta = (p[k] for k in ("d", "gamma", "xi", "zeta"))
    Delta = A - c
    check("time contraction in (0,1)", 0 < s < 1)
    check("mass scales linearly", A == s * p["original_mass"])
    check("time scales linearly", T == s * p["original_time"])
    check("positive mass gap", Delta == p["mass_gap"] > 0)
    check("clock cap in (0,2)", 0 < K < 2)
    check("ordinary margin", 0 <= lam < 1-rho and 0 < rho < 1)
    check("ordered exponents", 0 < d < gamma < 1 and 0 < xi < d and zeta > 0)
    check("exponent slack", 1-d-2*xi-zeta == F(1,250) > 0)
    check("virtual-weight exponent gap", gamma-d == F(7,2000))
    check("designated capacity margin",
          K-p["designated_bound"] == F(69405753,80000000000) > 0)
    check("ordinary capacity margin",
          lam-p["ordinary_bound"] == F(24358807047,3200000000000) > 0)
    check("tail fits ordinary cap", 0 < p["tail_bound"] < lam)
    check("tag credit margin", 1-rho-lam == F(3,40))

    Dold = 1/(sum((F(1,k*k) for k in range(1,257)), F(0))
              + F(1,257) + F(1,2*257*257))
    Dstar = p["sieve_coefficient"]
    rold = s*s*p["original_risk_threshold"]
    kappa = d-rold
    rnew = Dstar/Dold*rold
    bacc = d-kappa/2
    a = (bacc+d)/2
    check("old scaled risk", rold == p["old_scaled_risk"])
    check("old risk margin", kappa == F(3137001,3125000000) > 0)
    check("finite-sieve transfer margin", rnew < d-7*kappa/8)
    check("continuum acceptance bound", bacc == p["continuum_acceptance"])
    check("remaining rounding margin", bacc-rnew > 3*kappa/8)
    check("twelve-integral coefficient", Dstar*s*s/24 == F(392673,15625000))
    check("discrete coefficient", a == p["discrete_coefficient"])
    check("additive lattice error has strict slack",
          0 <= bacc < a < d and a-bacc == d-a == kappa/4)

    eps = p["loss_budget"]
    grid = Delta/4
    budget1 = (1-eps)*(A-grid)-c
    budget2 = (1-eps)*(A-grid-grid)-c
    check("loss budget in (0,1)", 0 < eps < 1)
    check("probability cost fits quarter gap", eps*A < grid)
    check("one-cost exact budget",
          budget1 == F("0.0000627445734908543514408171176910400390625") > 0)
    check("two-cost exact budget",
          budget2 == F("0.000036826382327236234293878078460693359375") > 0)

    m = data["integer_parameters"]["global_moment_order"]
    eta_exp = 4-m+2*m*xi+d*(m-1)+m*zeta
    virtual_exp = 3-d+xi-m*(gamma-d)
    check("eta union exponent", eta_exp == F(-13377,1000))
    check("virtual union exponent", virtual_exp == F(-1541,125))
    check("eta remains small after point-law transport", eta_exp+d < 0)
    check("virtual remains small after point-law transport", virtual_exp+d < 0)

    G = data["integer_parameters"]["spatial_grid"]
    Cline = 4*G
    e = (1-rho-lam)/(4*T*Cline)
    b = data["integer_parameters"]["tag_block_length"]
    k = data["integer_parameters"]["tag_block_count"]
    mtag = data["integer_parameters"]["tag_moment_order"]
    tag_budget = eps/3
    threshold = tag_budget*e*e/(64*Cline)
    check("linewise piece count", Cline == 131072)
    check("tag block length reaches Bernoulli doubling", b*(e/2) >= 1)
    check("tag block length is minimal integer witness", (b-1)*(e/2) < 1)
    check("tag geometric decay witness", F(1,2**k) <= threshold)
    check("tag order product", mtag == b*k+3 == 40402174724739)
    check("tag repeated-leaf exponent negative", 1-(1-d)*(mtag-1) < 0 and mtag > 2)
    check("moderate order suffices only for repeated-term vanishing",
          1-(1-d)*(144-1) < 0)
    check("tag capacity cost", Cline*T*e == F(3,160))

    factors = data["finite_sieve_factors"]
    check("finite sieve factor count", len(factors) == 175)
    check("finite sieve factors odd and greater than one",
          all(isinstance(q,int) and q > 1 and q % 2 == 1 for q in factors))
    pair_count = len(factors)*(len(factors)-1)//2
    check("all finite sieve pairs coprime", all(gcd(q,r) == 1 for q,r in combinations(factors,2)))
    DP = F(3,4)*prod((1-F(1,q*q) for q in factors), start=F(1))
    AP = prod((1+F(1,q*q) for q in factors), start=F(1))
    CPupper = (5+F(sum(q-1 for q in factors),4))*AP
    check("finite sieve density below stated coefficient", 0 < DP < Dstar)
    check("rational upper bound on finite-sieve error constant", CPupper < 25586)
    check("finite modulus decimal length", len(str(prod(factors))) == 440)

    # Two small exact examples also check the integral-majorant formulas
    # printed in the certificate section, without replaying any input leaf.
    def affine_integral(width, left, right):
        return width*(left*left+left*right+right*right)/3
    check("secant example for 1/u", affine_integral(F(1),F(1),F(1,2)) == F(7,12))
    check("tangent example for 2-1/u",
          affine_integral(F(1),F(10,9),F(14,9)) == F(436,243))
    report = {
        "edition_date": "2026-11-10",
        "status": "PASS_SMALL_EXACT_ARITHMETIC_ONLY",
        "scope": "Exact arithmetic in the English proof draft, including finite coprimality and product checks.",
        "not_checked": [
            "The mass of the actual accepted rectangle unions",
            "All 15348 phases and 155402 geometric leaf records",
            "Chronological matching or cumulative reference-prefix bounds",
            "The full stochastic argument or a Lean build",
            "An unconditional proof of the numerical target"
        ],
        "parameters_sha256": hashlib.sha256(raw).hexdigest(),
        "passed_checks": len(checks),
        "coprimality_pairs_checked": pair_count,
        "checks": checks,
        "values": {name: exact(value) for name,value in {
            "mass": A, "mass_gap": Delta, "old_risk_margin": kappa,
            "new_risk_bound": rnew, "continuum_acceptance": bacc,
            "discrete_coefficient": a, "discrete_error_slack": a-bacc,
            "one_cost_budget": budget1, "two_cost_budget": budget2,
            "eta_exponent": eta_exp, "virtual_exponent": virtual_exp,
            "tag_cell_allowance": e, "tag_geometric_threshold": threshold,
            "finite_sieve_density": DP, "finite_sieve_error_upper": CPupper
        }.items()}
    }
    rendered = json.dumps(report, indent=2, ensure_ascii=True) + "\n"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
        print(f"PASS: {len(checks)} exact checks; {pair_count} coprimality pairs.")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()
