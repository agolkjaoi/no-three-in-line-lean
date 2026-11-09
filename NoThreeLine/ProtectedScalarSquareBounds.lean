import NoThreeLine.ProtectedScalarSquareTimed
import NoThreeLine.ProtectedLedgerGlobalBounds

/-! Bounds for a scalar transform of the actual saved-credit total.
The real post-update saved values are bounded internally, including
births on the line, retirement, and stopped or zero-time inputs. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedScalarTotal_bounds {n : ℕ} (L : LineIndex n) (E : Finset (Grid n))
    (A : ℝ→ℝ) (B D : ℝ) (Γ : Finset PrimitiveLines.ZPoint) (hsp : specified Γ L)
    (hE : E⊆L.val) (e : ExtendedState n) (he : e.Valid B) (saved : Grid n→ℝ)
    (hsv : ∀p∈E,0≤saved p ∧ saved p≤2*B)
    (hA : ∀c∈Icc (0:ℝ) (2*B),0≤A c ∧ A c≤D) :
    0≤protectedScalarTotal L E A e saved ∧
      protectedScalarTotal L E A e saved≤(E.card:ℝ)*D := by
  have ha (p : Grid n) (hp : p∈E) :
      0≤A (protectedLineCredit L e saved p) ∧ A (protectedLineCredit L e saved p)≤D :=
    hA _ (protectedLineCredit_bounds_all L e saved Γ hsp p (hE hp) B he (hsv p hp))
  constructor
  · exact Finset.sum_nonneg (fun p hp=>(ha p hp).1)
  · have hu := Finset.sum_le_sum (fun p hp=>(ha p hp).2)
    simpa only [protectedScalarTotal,Finset.sum_const,nsmul_eq_mul] using hu

theorem protectedTimedWeightedScalarSquare_bounds {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (A : ℝ→ℝ) (D : ℝ)
    (hA : ∀c∈Icc (0:ℝ) (2*cfg.B),0≤A c ∧ A c≤D)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (z : CandidateData n) :
    0≤protectedTimedWeightedScalarSquare cfg ε M L E A s z ∧
      protectedTimedWeightedScalarSquare cfg ε M L E A s z≤
        (2/(2-K))^2*((E.card:ℝ)*D)^2 := by
  let v := protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z))
  have hv (p : Grid n) (hp : p∈E) : 0≤v.2 p ∧ v.2 p≤2*cfg.B :=
    protectedLineSave_timed_bounds_all cfg ε M L hsp p (hE hp) s (hsv p hp) z
  have hb := protectedScalarTotal_bounds L E A cfg.B D cfg.directions hsp hE
    v.1.val.1.physical v.1.property.1.1 v.2 hv hA
  have hl := augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk z
  have hsq : (protectedScalarTotal L E A v.1.val.1.physical v.2)^2≤((E.card:ℝ)*D)^2 :=
    pow_le_pow_left₀ hb.1 hb.2 2
  exact ⟨mul_nonneg hl.1 (sq_nonneg _),
    mul_le_mul hl.2 hsq (sq_nonneg _) (sq_nonneg _)⟩

end NoThreeLine

#print axioms NoThreeLine.protectedScalarTotal_bounds
#print axioms NoThreeLine.protectedTimedWeightedScalarSquare_bounds
