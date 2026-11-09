import NoThreeLine.TimePairSymmetry
import NoThreeLine.RemainingCost

/-! The same one-half time identity for deterministic future costs.
Both coordinates use one common deadline; the main coefficient is unchanged. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.FinitePhase
open BirthWitness

theorem remaining_rate_eq_sub {J : Type*} (P : Finset J) (lo hi c : J→ℝ)
    (T u : ℝ) (hu : u∈Icc (0:ℝ) T) :
    remainingIntegral (rate P lo hi c) T u=cumulative P lo hi c T-cumulative P lo hi c u := by
  rw [remainingIntegral_eq _ _ _ hu]
  have hh := intervalIntegral.integral_add_adjacent_intervals (a:=0) (b:=u) (c:=T)
    (rate_integrable P lo hi c).intervalIntegrable (rate_integrable P lo hi c).intervalIntegrable
  change (∫t in (0:ℝ)..u,rate P lo hi c t)+(∫t in u..T,rate P lo hi c t)=
    (∫t in (0:ℝ)..T,rate P lo hi c t) at hh
  unfold cumulative
  linarith

theorem pairForm_sub_right {X : Type*} [Fintype X] (E : X→X→Prop) [DecidableRel E]
    (a b c : X→ℝ) : pairForm E a (fun q=>b q-c q)=pairForm E a b-pairForm E a c := by
  unfold pairForm
  simp_rw [←Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro q _
  apply Finset.sum_congr rfl
  intro r _
  split_ifs <;> ring

private theorem intervalIntegrable_sum {X : Type*} (S : Finset X) (f : X→ℝ→ℝ) (a b : ℝ)
    (hf : ∀x∈S,IntervalIntegrable (f x) volume a b) :
    IntervalIntegrable (fun t=>∑x∈S,f x t) volume a b :=
  ⟨integrable_finsetSum S (fun x hx=>(hf x hx).1),integrable_finsetSum S (fun x hx=>(hf x hx).2)⟩

theorem pairForm_rate_const_integrable {J X : Type*} [Fintype X]
    (P : Finset J) (lo hi : J→ℝ) (c : J→X→ℝ) (E : X→X→Prop) [DecidableRel E]
    (d : X→ℝ) (a b : ℝ) :
    IntervalIntegrable (fun t=>pairForm E (fun q=>rate P lo hi (fun j=>c j q) t) d) volume a b := by
  unfold pairForm
  apply intervalIntegrable_sum
  intro q _
  apply intervalIntegrable_sum
  intro r _
  by_cases h : E q r
  · simp only [if_pos h]
    exact (rate_integrable P lo hi (fun j=>c j q)).intervalIntegrable.mul_const (d r)
  · simp only [if_neg h]
    exact intervalIntegrable_const

theorem pairForm_rate_const_integral {J X : Type*} [Fintype X]
    (P : Finset J) (lo hi : J→ℝ) (c : J→X→ℝ) (E : X→X→Prop) [DecidableRel E]
    (d : X→ℝ) (T : ℝ) :
    (∫t in (0:ℝ)..T,pairForm E (fun q=>rate P lo hi (fun j=>c j q) t) d)=
      pairForm E (fun q=>cumulative P lo hi (fun j=>c j q) T) d := by
  have hterm (q r : X) : IntervalIntegrable
      (fun t=>if E q r then rate P lo hi (fun j=>c j q) t*d r else 0) volume 0 T := by
    by_cases h : E q r
    · simp only [if_pos h]
      exact (rate_integrable P lo hi (fun j=>c j q)).intervalIntegrable.mul_const (d r)
    · simp only [if_neg h]
      exact intervalIntegrable_const
  unfold pairForm
  rw [intervalIntegral.integral_finsetSum (fun q _=>intervalIntegrable_sum _ _ _ _ (fun r _=>hterm q r))]
  apply Finset.sum_congr rfl
  intro q _
  rw [intervalIntegral.integral_finsetSum (fun r _=>hterm q r)]
  apply Finset.sum_congr rfl
  intro r _
  by_cases h : E q r
  · simp only [if_pos h,intervalIntegral.integral_mul_const,cumulative]
  · simp only [if_neg h,intervalIntegral.integral_zero]

theorem pairForm_future_time_identity {J X : Type*} [Fintype X]
    (P : Finset J) (lo hi : J→ℝ) (c : J→X→ℝ)
    (E : X→X→Prop) [DecidableRel E] (hsym : ∀q r,E q r↔E r q) (T : ℝ) (hT : 0≤T) :
    (∫t in (0:ℝ)..T,pairForm E (fun q=>rate P lo hi (fun j=>c j q) t)
      (fun q=>remainingIntegral (rate P lo hi (fun j=>c j q)) T t))=
      (1/2:ℝ)*pairForm E (fun q=>cumulative P lo hi (fun j=>c j q) T)
        (fun q=>cumulative P lo hi (fun j=>c j q) T) := by
  have he : (∫t in (0:ℝ)..T,pairForm E (fun q=>rate P lo hi (fun j=>c j q) t)
      (fun q=>remainingIntegral (rate P lo hi (fun j=>c j q)) T t))=
      ∫t in (0:ℝ)..T,pairForm E (fun q=>rate P lo hi (fun j=>c j q) t)
        (fun q=>cumulative P lo hi (fun j=>c j q) T)-
        pairForm E (fun q=>rate P lo hi (fun j=>c j q) t)
          (fun q=>cumulative P lo hi (fun j=>c j q) t) := by
    apply intervalIntegral.integral_congr
    intro t ht
    have ht' : t∈Icc (0:ℝ) T := by simpa only [uIcc_of_le hT] using ht
    simp_rw [remaining_rate_eq_sub P lo hi _ T t ht']
    exact pairForm_sub_right E _ _ _
  rw [he,intervalIntegral.integral_sub
    (pairForm_rate_const_integrable P lo hi c E _ 0 T) (pairForm_phase_intervalIntegrable P lo hi c E 0 T),
    pairForm_rate_const_integral,pairForm_time_identity P lo hi c E hsym T]
  ring

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.pairForm_future_time_identity
