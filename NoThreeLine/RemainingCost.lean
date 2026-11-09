import NoThreeLine.FiniteSchedule
import NoThreeLine.BirthObservation

/-! A deterministic future integral, extended to every real birth time by
clipping to the time horizon. Its normalized value is an actual Retention. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def clippedBirthTime (T u : ℝ) : ℝ := max 0 (min u T)

theorem clippedBirthTime_bounds (T u : ℝ) (hT : 0≤T) :
    0≤clippedBirthTime T u ∧ clippedBirthTime T u≤T :=
  ⟨le_max_left _ _,max_le hT (min_le_right _ _)⟩

theorem clippedBirthTime_eq (T u : ℝ) (hu : u∈Icc (0:ℝ) T) :
    clippedBirthTime T u=u := by simp only [clippedBirthTime,min_eq_left hu.2,max_eq_right hu.1]

theorem clippedBirthTime_continuous (T : ℝ) : Continuous (clippedBirthTime T) :=
  continuous_const.max (continuous_id.min continuous_const)

def remainingIntegral (f : ℝ→ℝ) (T u : ℝ) : ℝ :=
  ∫t in clippedBirthTime T u..T,f t

theorem remainingIntegral_eq (f : ℝ→ℝ) (T u : ℝ) (hu : u∈Icc (0:ℝ) T) :
    remainingIntegral f T u=∫t in u..T,f t := by rw [remainingIntegral,clippedBirthTime_eq T u hu]

theorem remainingIntegral_continuous (f : ℝ→ℝ) (hf : Integrable f) (T : ℝ) :
    Continuous (remainingIntegral f T) := by
  have hh := ((hf.continuous_primitive T).comp (clippedBirthTime_continuous T)).neg
  convert hh using 1
  funext u
  exact intervalIntegral.integral_symm _ _

theorem remainingIntegral_bounds (f : ℝ→ℝ) (hf : Integrable f) (T C u : ℝ)
    (hT : 0≤T) (hC : 0≤C) (hb : ∀t,0≤f t ∧ f t≤C) :
    0≤remainingIntegral f T u ∧ remainingIntegral f T u≤T*C := by
  have hu := clippedBirthTime_bounds T u hT
  constructor
  · exact intervalIntegral.integral_nonneg_of_forall hu.2 (fun t=>(hb t).1)
  · have hh := intervalIntegral.integral_mono_on hu.2 hf.intervalIntegrable
      (intervalIntegrable_const : IntervalIntegrable (fun _ : ℝ=>C) volume (clippedBirthTime T u) T)
      (fun t _=>(hb t).2)
    have he : (∫t in clippedBirthTime T u..T,C)=(T-clippedBirthTime T u)*C := by simp
    rw [he] at hh
    exact hh.trans (mul_le_mul_of_nonneg_right (sub_le_self T hu.1) hC)

theorem remainingIntegral_zero_after (f : ℝ→ℝ) (T u : ℝ) (hT : 0≤T) (hu : T≤u) :
    remainingIntegral f T u=0 := by
  simp only [remainingIntegral,clippedBirthTime,min_eq_right hu,max_eq_right hT,intervalIntegral.integral_same]

def normalizedCostRetention {n : ℕ} (cost : Grid n→ℝ→ℝ) (weight : Grid n→ℝ)
    (hc : ∀q,Measurable (cost q)) (hb : ∀q t,0≤cost q t ∧ cost q t≤weight q) : Retention n where
  value q t := cost q t/weight q
  measurable_value q := (hc q).div_const (weight q)
  bounds q t := by
    have hW : 0≤weight q := (hb q t).1.trans (hb q t).2
    refine ⟨div_nonneg (hb q t).1 hW,?_⟩
    by_cases hw : weight q=0
    · simp only [hw,div_zero,zero_le_one]
    · exact (div_le_one (lt_of_le_of_ne hW (fun hh=>hw hh.symm))).mpr (hb q t).2

theorem normalizedCostRetention_weight_value {n : ℕ} (cost : Grid n→ℝ→ℝ) (weight : Grid n→ℝ)
    (hc : ∀q,Measurable (cost q)) (hb : ∀q t,0≤cost q t ∧ cost q t≤weight q) (q : Grid n) (t : ℝ) :
    weight q*(normalizedCostRetention cost weight hc hb).value q t=cost q t := by
  change weight q*(cost q t/weight q)=cost q t
  by_cases hw : weight q=0
  · have he : cost q t=0 := le_antisymm (by simpa only [hw] using (hb q t).2) (hb q t).1
    simp only [hw,he,zero_div,zero_mul]
  · field_simp

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.remainingIntegral_bounds
#print axioms NoThreeLine.BirthWitness.normalizedCostRetention_weight_value
