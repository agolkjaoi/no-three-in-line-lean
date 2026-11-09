import NoThreeLine.ProtectedWholeSquareRunningMean
import NoThreeLine.ProtectedRunningHistory

/-! Separate the continuous cross term from the actual whole-event
jump energy. These are real elapsed integrals, not a postulated bracket. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

def protectedCreditEnergyRate {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) : ℝ :=
  protectedExternalEventRate e mask L (fun q=>(protectedExternalDeletion e Γ L E q)^2)

def protectedEntropyEnergyRate {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ) : ℝ :=
  protectedExternalEventRate e mask L (fun q=>(protectedEntropyDeletion e Γ L E q B)^2)

def protectedWholeCostRate {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) : ℝ :=
  protectedExternalEventRate e mask L (fun q=>protectedEventCost e Γ L E q)

def protectedCreditCrossRate {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) : ℝ :=
  2*protectedCreditTotal L E e saved*protectedCreditTotalSource e mask L E

def protectedEntropyCrossRate {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ) : ℝ :=
  2*protectedEntropyTotal L E B e saved*protectedEntropyTotalSource e saved Γ mask L E B

theorem protectedCreditEnergyRate_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) :
    Continuous (fun z : Coordinates n=>protectedCreditEnergyRate (e.withCoordinates z) Γ mask L E) :=
  protectedEventRate_withCoordinates_continuous e mask L (fun v q=>(protectedExternalDeletion v Γ L E q)^2)
    (fun q=>(protectedExternalDeletion_withCoordinates_continuous e Γ L E q).pow 2)

theorem protectedEntropyEnergyRate_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ) :
    Continuous (fun z : Coordinates n=>protectedEntropyEnergyRate (e.withCoordinates z) Γ mask L E B) :=
  protectedEventRate_withCoordinates_continuous e mask L (fun v q=>(protectedEntropyDeletion v Γ L E q B)^2)
    (fun q=>(protectedEntropyDeletion_withCoordinates_continuous e Γ L E q B).pow 2)

theorem protectedWholeCostRate_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) :
    Continuous (fun z : Coordinates n=>protectedWholeCostRate (e.withCoordinates z) Γ mask L E) := by
  unfold protectedWholeCostRate
  apply protectedEventRate_withCoordinates_continuous e mask L (fun v q=>protectedEventCost v Γ L E q)
  intro q
  change Continuous (fun z : Coordinates n=>∑p∈E.filter (fun p=>(e.process.accounts p).status=.active),
    specifiedLineWeight (e.withCoordinates z) L p*protectedEntropyCost (birthMultiplier Γ e.process.selected p q))
  exact continuous_finsetSum _ (fun p _=>(specifiedLineWeight_withCoordinates_continuous e L p).mul_const _)

theorem protectedCreditCrossRate_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) :
    Continuous (fun z : Coordinates n=>protectedCreditCrossRate (e.withCoordinates z) saved mask L E) :=
  ((protectedCreditTotal_withCoordinates_continuous e L E saved).const_mul 2).mul
    (continuous_finsetSum _ (fun p _=>protectedLinePositiveDrift_withCoordinates_continuous e mask L p))

theorem protectedEntropyCrossRate_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n))
    (B : ℝ) (hB : 0<B) :
    Continuous (fun z : Coordinates n=>protectedEntropyCrossRate (e.withCoordinates z) saved Γ mask L E B) :=
  ((protectedEntropyTotal_withCoordinates_continuous e L E saved B).const_mul 2).mul
    (continuous_finsetSum _ (fun p _=>protectedEntropySource_withCoordinates_continuous e saved Γ mask L p B hB))

theorem protectedRunningScalarSource_eq_elapsed {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (S : ℝ→ℝ) (z : CandidateData n) :
    protectedRunningScalarSource cfg ε M s S z=∫t in (0:ℝ)..birthElapsed cfg ε M (s,z),S t := by
  by_cases hd : birthDone cfg s
  · simp only [protectedRunningScalarSource,birthElapsed,birthDone] at hd ⊢
    simp only [if_pos hd,intervalIntegral.integral_same]
  · simp only [protectedRunningScalarSource,birthElapsed,birthDone] at hd ⊢
    simp only [if_neg hd]

theorem protectedRunningScalarSource_add {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (F G : ℝ→ℝ) (hF : Continuous F) (hG : Continuous G) (z : CandidateData n) :
    protectedRunningScalarSource cfg ε M s (fun t=>F t+G t) z=
      protectedRunningScalarSource cfg ε M s F z+protectedRunningScalarSource cfg ε M s G z := by
  simp only [protectedRunningScalarSource_eq_elapsed]
  exact intervalIntegral.integral_add (hF.intervalIntegrable _ _) (hG.intervalIntegrable _ _)

theorem protectedRunningScalarSource_scaled_mono {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (F G : ℝ→ℝ) (hF : Continuous F) (hG : Continuous G)
    (a b : ℝ) (z : CandidateData n)
    (hle : ∀t∈Icc (0:ℝ) (birthElapsed cfg ε M (s,z)),a*F t≤b*G t) :
    a*protectedRunningScalarSource cfg ε M s F z≤b*protectedRunningScalarSource cfg ε M s G z := by
  simp only [protectedRunningScalarSource_eq_elapsed,←intervalIntegral.integral_const_mul]
  exact intervalIntegral.integral_mono_on (birthElapsed_mem cfg ε M (s,z)).1
    ((hF.const_mul a).intervalIntegrable _ _) ((hG.const_mul b).intervalIntegrable _ _) hle

end NoThreeLine
#print axioms NoThreeLine.protectedRunningScalarSource_add
#print axioms NoThreeLine.protectedRunningScalarSource_scaled_mono
