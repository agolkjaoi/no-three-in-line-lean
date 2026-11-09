import NoThreeLine.BenchmarkIntervalNormalize
import NoThreeLine.BenchmarkAtomGather
import NoThreeLine.BenchmarkAutoChunks

/-! Semantic soundness of a block after exact interval simplification.
The branch checker, strict cuts, zero-adjacent coefficient condition and
each rounded branch integral are the existing definitions. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped Interval

namespace NoThreeLine.AutoEnvelope

theorem checkUpperBlock_order (e : Expr) (S : ℕ) (r : ℚ)
    (xs : List (ℚ × AutoTrace)) (last B : ℚ)
    (hc : checkUpperBlock e S r xs=some (last,B)) : r≤last := by
  induction xs generalizing r B with
  | nil =>
      simp only [checkUpperBlock,Option.some.injEq,Prod.mk.injEq] at hc
      exact hc.1.le
  | cons p xs ih =>
      obtain ⟨s,t⟩ := p
      simp only [checkUpperBlock,Option.bind_eq_some_iff] at hc
      obtain ⟨c,he,hc⟩ := hc
      split_ifs at hc with hv
      simp only [Option.bind_eq_some_iff] at hc
      obtain ⟨tail,ht,hb⟩ := hc
      have hl : tail.1=last := congrArg Prod.fst (Option.some.inj hb)
      have ht' : checkUpperBlock e S s xs=some (last,tail.2) := by
        simpa only [←hl,Prod.mk.eta] using ht
      exact hv.2.1.le.trans (ih s tail.2 ht')

theorem checkUpperBlock_integral_le (e : Expr) (S : ℕ) (r : ℚ)
    (xs : List (ℚ × AutoTrace)) (last B : ℚ) (G : ℝ→ℝ)
    (hS : 0<S) (hr : 0≤r)
    (hc : checkUpperBlock e S r xs=some (last,B))
    (hI : IntervalIntegrable (fun u=>(G u)^2) volume r last)
    (hG : ∀u∈Ioo (r:ℝ) last,0≤G u ∧ G u≤e.eval u) :
    (∫u in (r:ℝ)..(last:ℝ),(G u)^2)≤(B:ℝ) := by
  induction xs generalizing r B with
  | nil =>
      simp only [checkUpperBlock,Option.some.injEq,Prod.mk.injEq] at hc
      rcases hc with ⟨hl,hB⟩
      subst r
      subst B
      simp
  | cons p xs ih =>
      obtain ⟨s,t⟩ := p
      simp only [checkUpperBlock,Option.bind_eq_some_iff] at hc
      obtain ⟨c,he,hc⟩ := hc
      split_ifs at hc with hv
      simp only [Option.bind_eq_some_iff] at hc
      obtain ⟨tail,ht,hb⟩ := hc
      have hl : tail.1=last := congrArg Prod.fst (Option.some.inj hb)
      have hB : roundUp S (branchBound c.a c.b r s)+tail.2=B :=
        congrArg Prod.snd (Option.some.inj hb)
      have ht' : checkUpperBlock e S s xs=some (last,tail.2) := by
        simpa only [←hl,Prod.mk.eta] using ht
      have hsl := checkUpperBlock_order e S s xs last tail.2 ht'
      have hrs : (r:ℝ)≤s := by exact_mod_cast hv.2.1.le
      have hsl' : (s:ℝ)≤last := by exact_mod_cast hsl
      have hrl : (r:ℝ)≤last := hrs.trans hsl'
      have hi₁ : IntervalIntegrable (fun u=>(G u)^2) volume r s := by
        apply hI.mono_set
        rw [uIcc_of_le hrs,uIcc_of_le hrl]
        exact Icc_subset_Icc le_rfl hsl'
      have hi₂ : IntervalIntegrable (fun u=>(G u)^2) volume s last := by
        apply hI.mono_set
        rw [uIcc_of_le hsl',uIcc_of_le hrl]
        exact Icc_subset_Icc hrs le_rfl
      have hlocal := checked_upper_branch_integral e t S r s c G hS hv he hi₁
        (fun u hu=>hG u ⟨hu.1,hu.2.trans_le hsl'⟩)
      have htail := ih s tail.2 (hr.trans hv.2.1.le) ht' hi₂
        (fun u hu=>hG u ⟨hrs.trans_lt hu.1,hu.2⟩)
      rw [←intervalIntegral.integral_add_adjacent_intervals hi₁ hi₂,←hB]
      exact_mod_cast add_le_add hlocal htail

theorem normalizedUpperBlock_integral_le (e small : Expr) (S : ℕ)
    (r last : ℚ) (xs : List (ℚ × AutoTrace)) (B : ℚ) (G : ℝ→ℝ)
    (hS : 0<S) (hr : 0≤r)
    (hn : (e.intervalNormalize r last).atomNormalize=small)
    (hc : checkUpperBlock small S r xs=some (last,B))
    (hI : IntervalIntegrable (fun u=>(G u)^2) volume r last)
    (hG : ∀u∈Ioo (r:ℝ) last,0≤G u ∧ G u≤e.eval u) :
    (∫u in (r:ℝ)..(last:ℝ),(G u)^2)≤(B:ℝ) := by
  apply checkUpperBlock_integral_le small S r xs last B G hS hr hc hI
  intro u hu
  have hr' : (0:ℝ)≤r := by exact_mod_cast hr
  have hpos : 0<u := hr'.trans_lt hu.1
  rw [←hn,Expr.atomNormalize_eval,Expr.intervalNormalize_eval r last e u hu.1.le hu.2.le hpos]
  exact hG u hu

end NoThreeLine.AutoEnvelope

#print axioms NoThreeLine.AutoEnvelope.checkUpperBlock_integral_le
#print axioms NoThreeLine.AutoEnvelope.normalizedUpperBlock_integral_le
