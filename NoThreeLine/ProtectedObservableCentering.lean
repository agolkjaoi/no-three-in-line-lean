import NoThreeLine.ProtectedWholeGenerator

/-! Exact centering of arbitrary fixed-state observables under the actual
killed mark/label update. No measurability or sign of the observable is assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

theorem protectedForbiddenMarkObservable_centered_mean {n : ℕ} (L : LineIndex n)
    (e : ExtendedState n) (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (F : ExtendedState n→(Grid n→ℝ)→ℝ) (a : ℝ)
    (hB : 0<B) (hm : ∀q,0≤mask q ∧ mask q≤1) (hw : e.Valid B)
    (q : Grid n) (positive : Grid n→Bool) :
    (∫z,protectedForbiddenMarkObservable L e saved Γ mask B (fun v b=>(F v b-a)^2) q positive z ∂markMeasure)=
      (∫z,protectedForbiddenMarkObservable L e saved Γ mask B (fun v b=>(F v b)^2) q positive z ∂markMeasure)-
        2*a*(∫z,protectedForbiddenMarkObservable L e saved Γ mask B F q positive z ∂markMeasure)+
        a^2*(∫z,protectedForbiddenMarkObservable L e saved Γ mask B (fun _ _=>1) q positive z ∂markMeasure) := by
  simp_rw [protectedForbiddenMarkObservable_mean L e saved Γ mask B _ hB hm hw]
  by_cases hq : q∈L.val <;> simp only [hq,if_true,if_false] <;> ring

theorem protectedObservableCandidateMean_centered {n : ℕ} (L : LineIndex n)
    (e : ExtendedState n) (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (positive : Grid n→Grid n→Bool) (F : ExtendedState n→(Grid n→ℝ)→ℝ) (a : ℝ)
    (hB : 0<B) (hm : ∀q,0≤mask q ∧ mask q≤1) (hw : e.Valid B) :
    protectedObservableCandidateMean L e saved Γ mask B positive (fun v b=>(F v b-a)^2)=
      protectedObservableCandidateMean L e saved Γ mask B positive (fun v b=>(F v b)^2)-
        2*a*protectedObservableCandidateMean L e saved Γ mask B positive F+
        a^2*protectedObservableCandidateMean L e saved Γ mask B positive (fun _ _=>1) := by
  unfold protectedObservableCandidateMean
  simp_rw [protectedForbiddenMarkObservable_centered_mean L e saved Γ mask B F a hB hm hw]
  simp only [Finset.sum_add_distrib,Finset.sum_sub_distrib,←Finset.mul_sum]
  ring

theorem protectedObservableCandidateMean_one {n : ℕ} (L : LineIndex n)
    (e : ExtendedState n) (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (positive : Grid n→Grid n→Bool) (hn : 0<n) (hB : 0<B)
    (hm : ∀q,0≤mask q ∧ mask q≤1) (hw : e.Valid B) :
    protectedObservableCandidateMean L e saved Γ mask B positive (fun _ _=>1)=
      1-lineIntensity e.process mask e.coordinates L/((n:ℝ)*B) := by
  have h := protectedObservableCandidateMean_generator L e saved Γ mask B hn hB hm hw positive
    (fun _ _=>1)
  have hz : protectedObservableExternalRate e saved Γ mask positive L (fun _ _=>1)=0 := by
    simp [protectedObservableExternalRate]
  rw [hz,mul_one,zero_sub] at h
  have hn0 : (n:ℝ)≠0 := by exact_mod_cast Nat.ne_of_gt hn
  have hr : (n:ℝ)*B≠0 := mul_ne_zero hn0 hB.ne'
  apply mul_left_cancel₀ hr
  calc
    (n:ℝ)*B*protectedObservableCandidateMean L e saved Γ mask B positive (fun _ _=>1)=
        (n:ℝ)*B-lineIntensity e.process mask e.coordinates L := by linarith only [h]
    _ = ((n:ℝ)*B)*(1-lineIntensity e.process mask e.coordinates L/((n:ℝ)*B)) := by
      field_simp
      <;> ring

theorem protectedObservableExternalRate_centered_square {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ)
    (positive : Grid n→Grid n→Bool) (L : LineIndex n)
    (F : ExtendedState n→(Grid n→ℝ)→ℝ) (a : ℝ) :
    protectedObservableExternalRate e saved Γ mask positive L (fun v b=>(F v b-a)^2)=
      2*(F e saved-a)*protectedObservableExternalRate e saved Γ mask positive L F+
        protectedObservableJumpSquareRate e saved Γ mask positive L F := by
  unfold protectedObservableExternalRate protectedObservableJumpSquareRate protectedExternalEventRate
  rw [Finset.mul_sum,←Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro q _
  split_ifs <;> ring

end NoThreeLine

#print axioms NoThreeLine.protectedForbiddenMarkObservable_centered_mean
#print axioms NoThreeLine.protectedObservableCandidateMean_centered
#print axioms NoThreeLine.protectedObservableCandidateMean_one
#print axioms NoThreeLine.protectedObservableExternalRate_centered_square
