import NoThreeLine.RootLeafCredit
import NoThreeLine.CutPointLaw
import NoThreeLine.CutEtaFloor
import NoThreeLine.SourceObservedJoint

/-! Physical leaves at an actual same-board cut. The density is the actual
saved root credit; the leaf observable retains every active indicator and
connection factor. Finite density mass needs no normalization assumption. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped NNReal

namespace NoThreeLine.BirthWitness

def cutRootLeaf {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (x : ℝ≥0×BoardClockPath n) : ℝ :=
  rootLeafWitness cfg.directions C D p
    (observedWitness cfg e (sourceCutTerminal cfg ε M start x.1 x.1.coe_nonneg hn s x.2))

def cutCorrectedRootLeaf {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (x : ℝ≥0×BoardClockPath n) : ℝ :=
  correctedRootLeafWitness cfg.directions C D L p
    (observedWitness cfg e (sourceCutTerminal cfg ε M start x.1 x.1.coe_nonneg hn s x.2))

theorem cutRootLeaf_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (cutRootLeaf cfg ε M start e C D p hn s) :=
  (rootLeafWitness_measurable cfg.directions C D p).comp
    ((observedWitness_measurable cfg e).comp (sourceCutTerminal_joint_measurable cfg ε M start hn s))

theorem cutCorrectedRootLeaf_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (cutCorrectedRootLeaf cfg ε M start e C D L p hn s) :=
  (correctedRootLeafWitness_measurable cfg.directions C D L p).comp
    ((observedWitness_measurable cfg e).comp (sourceCutTerminal_joint_measurable cfg ε M start hn s))

theorem cutRootLeaf_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (x : ℝ≥0×BoardClockPath n) :
    0≤cutRootLeaf cfg ε M start e C D p hn s x ∧
      cutRootLeaf cfg ε M start e C D p hn s x≤rootLeafCap C p cfg.B :=
  rootLeafWitness_bounds cfg.directions C D p _ cfg.B (observedWitness_valid cfg e _
    (sourceCutTerminal_consistent cfg ε M start x.1 x.1.coe_nonneg hn s x.2))

theorem cutCorrectedRootLeaf_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (x : ℝ≥0×BoardClockPath n) :
    0≤cutCorrectedRootLeaf cfg ε M start e C D L p hn s x ∧
      cutCorrectedRootLeaf cfg ε M start e C D L p hn s x≤rootLeafCap C p cfg.B :=
  correctedRootLeafWitness_bounds cfg.directions C D L p _ cfg.B (observedWitness_valid cfg e _
    (sourceCutTerminal_consistent cfg ε M start x.1 x.1.coe_nonneg hn s x.2))

theorem cutPointMeasure_finite {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (s : GoodObservation cfg) (p : Grid n) (δ : ℝ≥0) :
    IsFiniteMeasure (cutPointMeasure cfg ε M start hn s p δ) := by
  apply isFiniteMeasure_withDensity
  rw [←ofReal_integral_eq_lintegral_ofReal (cutCredit_integrable cfg ε M start hn hB s p δ)
    (ae_of_all _ (fun ω=>(sourceCutCredit_bounds cfg ε M start δ δ.coe_nonneg hn s p ω).1))]
  exact ENNReal.ofReal_ne_top

theorem cutPoint_correctedRootLeaf_test {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (p : Grid n) (hp : p∈C)
    (hn : 0<n) (s : GoodObservation cfg) (δ : ℝ≥0) (g : BoardClockPath n→ℝ) :
    (∫ω,cutCorrectedRootLeaf cfg ε M start e C D L p hn s (δ,ω)*g ω
      ∂cutPointMeasure cfg ε M start hn s p δ)=
      ∫ω,mixed cfg.directions C D L
        (observedWitness cfg e (sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω))*g ω
        ∂boardClockMeasure n (cfg.B/n) := by
  unfold cutPointMeasure
  have hZ : Measurable (fun ω=>((cutProcess cfg ε M start hn s (δ,ω)).accounts p).credit) :=
    (sourceCutCredit_joint_measurable cfg ε M start hn s p).comp (measurable_const.prodMk measurable_id)
  rw [savedCreditMeasure_integral _ _ hZ
    (fun ω=>(sourceCutCredit_bounds cfg ε M start δ δ.coe_nonneg hn s p ω).1)]
  apply integral_congr_ae
  exact ae_of_all _ (fun ω=>by
    dsimp only
    rw [mixed_rootLeaf_credit cfg.directions C D L p hp]
    exact (mul_assoc _ _ _).symm)

theorem cutRootLeaf_eta_floor {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (hε : ε≤1) (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (x : ℝ≥0×BoardClockPath n) :
    (1-ε)^L.card.choose 2*cutRootLeaf cfg ε M start e C D p hn s x≤
      cutCorrectedRootLeaf cfg ε M start e C D L p hn s x :=
  rootLeafWitness_eta_floor cfg.directions C D L p _ cfg.B ε
    (observedWitness_valid cfg e _ (sourceCutTerminal_consistent cfg ε M start x.1 x.1.coe_nonneg hn s x.2))
    hε (fun a ha b hb hab=>sourceCutTerminal_eta_lower cfg ε M start hn s x.1 a b hab
      (hinit a ha b hb hab) x.2)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.cutPointMeasure_finite
#print axioms NoThreeLine.BirthWitness.cutPoint_correctedRootLeaf_test
#print axioms NoThreeLine.BirthWitness.cutRootLeaf_eta_floor
