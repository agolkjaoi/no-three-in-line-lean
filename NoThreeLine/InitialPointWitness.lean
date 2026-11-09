import NoThreeLine.CutWitnessMoments
import NoThreeLine.SourceInitialProduct

/-! Supply all initial credit, eta, empty-selection and clock hypotheses
from the canonical deadline-retired initial process. The resulting moment
is for its actual single-phase cut, with its actual point probability law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem initialGoodObservation_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hB : 1≤cfg.B) (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) :
    augTimedCredit cfg p (initialGoodObservation cfg ε M hB deadline start).val.1=1 :=
  augInitialState_credit cfg.B hB deadline start p

theorem initialGoodObservation_eta {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hB : 1≤cfg.B) (deadline : Grid n→ℝ) (start : ℝ) (a b : Grid n) :
    (initialGoodObservation cfg ε M hB deadline start).val.1.val.1.eta a b=1 :=
  augInitialState_eta cfg.B hB deadline start a b

theorem initialGoodObservation_remaining {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hB : 1≤cfg.B) (deadline : Grid n→ℝ) (start : ℝ) :
    (initialGoodObservation cfg ε M hB deadline start).val.1.val.2=(cfg.horizon:ℝ) := rfl

theorem initial_cutPoint_activeWitness_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 1≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hpD : p∉D) (hDL : insert p D⊆L) (hε0 : 0≤ε) (hε : ε<1)
    (deadline : Grid n→ℝ) (t : ℝ) (ht : t∈Icc (0:ℝ) cfg.horizon) :
    let s := initialGoodObservation cfg ε M hB deadline start
    (∫ω,cutActiveWitness cfg ε M start e D p hn s (elapsedCutAmount cfg.horizon t,ω)
      ∂cutPointMeasure cfg ε M start hn s p (elapsedCutAmount cfg.horizon t))≤
      (∏q∈D,∫u in (0:ℝ)..t,(cfg.mask q*e.value q (start+u)/n)*
        max 1 (protection 1 cfg.K)^cfg.directions.card)/(1-ε)^L.card.choose 2 := by
  have hh := cutPoint_activeWitness_product_bound cfg ε M start e D L p hn
    (lt_of_lt_of_le zero_lt_one hB) hm hK hpD hDL (initialGoodObservation cfg ε M hB deadline start)
    (initialGoodObservation_credit cfg ε M hB deadline start p) hε
    (fun a _ b _ _=>by rw [initialGoodObservation_eta]; linarith)
    (initialGoodObservation_selected cfg ε M hB deadline start)
    (fun q=>(initialGoodObservation_weight cfg ε M hB deadline start q).le)
    (initialGoodObservation_clock cfg ε M hB deadline start) t ht
  simpa only [elapsedSourceCoefficient,initialGoodObservation_time,initialGoodObservation_remaining] using hh

theorem initial_cutPoint_activeWitnessPower_moment {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n)
    (hB : 1≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hε0 : 0≤ε) (hε : ε<1) (deadline : Grid n→ℝ) (hw0 : ∀q,0≤w q)
    (t : ℝ) (ht : t∈Icc (0:ℝ) cfg.horizon) :
    let s := initialGoodObservation cfg ε M hB deadline start
    (∫ω,cutActiveWitnessPower cfg ε M start e w m p hn s (elapsedCutAmount cfg.horizon t,ω)
      ∂cutPointMeasure cfg ε M start hn s p (elapsedCutAmount cfg.horizon t))≤
      ∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*
        ((t*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card))^(Finset.univ.image f).card/
          (1-ε)^(insert p (Finset.univ.image f)).card.choose 2) :=
  cutPoint_activeWitnessPower_moment cfg ε M start e w m p hn
    (lt_of_lt_of_le zero_lt_one hB) hm hK (initialGoodObservation cfg ε M hB deadline start)
    (initialGoodObservation_credit cfg ε M hB deadline start p) hε
    (fun a b _=>by rw [initialGoodObservation_eta]; linarith)
    (initialGoodObservation_selected cfg ε M hB deadline start)
    (fun q=>(initialGoodObservation_weight cfg ε M hB deadline start q).le)
    (initialGoodObservation_clock cfg ε M hB deadline start) hw0 t ht

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_cutPoint_activeWitness_product
#print axioms NoThreeLine.BirthWitness.initial_cutPoint_activeWitnessPower_moment
