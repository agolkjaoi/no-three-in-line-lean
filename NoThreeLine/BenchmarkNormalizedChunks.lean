import NoThreeLine.BenchmarkNormalizedBlock

/-! Exact interval normalization is checked once per block. Each block uses
the existing branch checker and rounded branch integrals, and its actual
returned endpoint must be the next block's start. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped Interval

namespace NoThreeLine.AutoEnvelope

structure NormalizedBlock where
  last : ℚ
  cuts : List (ℚ × AutoTrace)

def checkNormalizedPartition (e : Expr) (S : ℕ) (r : ℚ) :
    List NormalizedBlock → Option ℚ
  | [] => if r=1 then some 0 else none
  | b::bs =>
      (checkUpperBlock (e.intervalNormalize r b.last).atomNormalize S r b.cuts).bind fun v =>
        if v.1=b.last then
          (checkNormalizedPartition e S b.last bs).bind fun t => some (v.2+t)
        else none

theorem checkNormalizedPartition_cons (e small : Expr) (S : ℕ) (r last B T : ℚ)
    (cuts : List (ℚ × AutoTrace)) (bs : List NormalizedBlock)
    (hn : (e.intervalNormalize r last).atomNormalize=small)
    (hc : checkUpperBlock small S r cuts=some (last,B))
    (ht : checkNormalizedPartition e S last bs=some T) :
    checkNormalizedPartition e S r (⟨last,cuts⟩::bs)=some (B+T) := by
  simp only [checkNormalizedPartition,hn,hc,Option.bind_some,ite_true,ht]

theorem checkNormalizedPartition_le_one (e : Expr) (S : ℕ) (r : ℚ)
    (bs : List NormalizedBlock) (B : ℚ)
    (hc : checkNormalizedPartition e S r bs=some B) : r≤1 := by
  induction bs generalizing r B with
  | nil =>
      simp only [checkNormalizedPartition] at hc
      split_ifs at hc with hr
      exact hr.le
  | cons b bs ih =>
      simp only [checkNormalizedPartition,Option.bind_eq_some_iff] at hc
      obtain ⟨v,hv,hc⟩ := hc
      split_ifs at hc with he
      simp only [Option.bind_eq_some_iff] at hc
      obtain ⟨t,ht,_⟩ := hc
      have hrl := checkUpperBlock_order _ S r b.cuts v.1 v.2 (by simpa only [Prod.mk.eta] using hv)
      exact (hrl.trans he.le).trans (ih b.last t ht)

theorem checkNormalizedPartition_sound (e : Expr) (S : ℕ) (r : ℚ)
    (bs : List NormalizedBlock) (B : ℚ) (G : ℝ→ℝ)
    (hS : 0<S) (hr : 0≤r) (hc : checkNormalizedPartition e S r bs=some B)
    (hI : IntervalIntegrable (fun u=>(G u)^2) volume 0 1)
    (hG : ∀u∈Ioo (0:ℝ) 1,0≤G u ∧ G u≤e.eval u) :
    (∫u in (r:ℝ)..1,(G u)^2)≤(B:ℝ) := by
  induction bs generalizing r B with
  | nil =>
      simp only [checkNormalizedPartition] at hc
      split_ifs at hc with hr1
      have hB := Option.some.inj hc
      subst r
      subst B
      simp
  | cons b bs ih =>
      simp only [checkNormalizedPartition,Option.bind_eq_some_iff] at hc
      obtain ⟨v,hv,hc⟩ := hc
      split_ifs at hc with he
      simp only [Option.bind_eq_some_iff] at hc
      obtain ⟨t,ht,hB⟩ := hc
      have hB' := Option.some.inj hB
      have hv' : checkUpperBlock (e.intervalNormalize r b.last).atomNormalize S r b.cuts=
          some (b.last,v.2) := by
        simpa only [←he,Prod.mk.eta] using hv
      have hrl := checkUpperBlock_order _ S r b.cuts b.last v.2 hv'
      have hl1 := checkNormalizedPartition_le_one e S b.last bs t ht
      have hr0 : (0:ℝ)≤r := by exact_mod_cast hr
      have hrl' : (r:ℝ)≤b.last := by exact_mod_cast hrl
      have hl1' : (b.last:ℝ)≤1 := by exact_mod_cast hl1
      have hi₁ : IntervalIntegrable (fun u=>(G u)^2) volume r b.last := by
        apply hI.mono_set
        rw [uIcc_of_le hrl',uIcc_of_le (by norm_num : (0:ℝ)≤1)]
        exact Icc_subset_Icc hr0 hl1'
      have hi₂ : IntervalIntegrable (fun u=>(G u)^2) volume b.last 1 := by
        apply hI.mono_set
        rw [uIcc_of_le hl1',uIcc_of_le (by norm_num : (0:ℝ)≤1)]
        exact Icc_subset_Icc (hr0.trans hrl') le_rfl
      have hb := normalizedUpperBlock_integral_le e _ S r b.last b.cuts v.2 G hS hr rfl hv' hi₁
        (fun u hu=>hG u ⟨hr0.trans_lt hu.1,hu.2.trans_le hl1'⟩)
      have ht' := ih b.last t (hr.trans hrl) ht
      rw [←intervalIntegral.integral_add_adjacent_intervals hi₁ hi₂,←hB']
      exact_mod_cast add_le_add hb ht'

def checkNormalizedUnitIntegral (e : Expr) (S : ℕ) (bs : List NormalizedBlock) : Option ℚ :=
  if 0<S then checkNormalizedPartition e S 0 bs else none

theorem checkNormalizedUnitIntegral_sound (e : Expr) (S : ℕ) (bs : List NormalizedBlock)
    (B : ℚ) (G : ℝ→ℝ) (hc : checkNormalizedUnitIntegral e S bs=some B)
    (hI : IntervalIntegrable (fun u=>(G u)^2) volume 0 1)
    (hG : ∀u∈Ioo (0:ℝ) 1,0≤G u ∧ G u≤e.eval u) :
    (∫u in (0:ℝ)..1,(G u)^2)≤(B:ℝ) := by
  unfold checkNormalizedUnitIntegral at hc
  split_ifs at hc with hS
  simpa only [Rat.cast_zero] using checkNormalizedPartition_sound e S 0 bs B G hS (le_refl 0) hc hI hG

example : checkNormalizedUnitIntegral (.atom ⟨2,0⟩) 100
    [⟨1/2,[(1/2,.auto)]⟩,⟨1,[(1,.auto)]⟩]=some 4 := by decide +kernel

example : checkNormalizedUnitIntegral (.atom ⟨2,0⟩) 100
    [⟨1/2,[(1/3,.auto)]⟩,⟨1,[(1,.auto)]⟩]=none := by decide +kernel

example : checkNormalizedUnitIntegral (.atom ⟨2,0⟩) 100
    [⟨1/2,[(1/2,.auto)]⟩]=none := by decide +kernel

end NoThreeLine.AutoEnvelope

#print axioms NoThreeLine.AutoEnvelope.checkNormalizedPartition_sound
#print axioms NoThreeLine.AutoEnvelope.checkNormalizedUnitIntegral_sound
