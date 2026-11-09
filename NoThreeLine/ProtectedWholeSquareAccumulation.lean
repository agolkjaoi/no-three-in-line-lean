import NoThreeLine.ProtectedStateSourceAccumulation

/-! Actual whole-square source sums: their history-adaptedness and finite
integrability are supplied internally from the real saved-credit invariant. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedWholeSquareSourceCap_nonneg (n : ℕ) (B : ℝ) (a : ℕ) (pointCap : ℝ)
    (hB : 0≤B) (hP : 0≤pointCap) : 0≤protectedWholeSquareSourceCap n B a pointCap := by
  unfold protectedWholeSquareSourceCap
  positivity

def cumulativeProtectedCreditSquareSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  cumulativeProtectedStateSource cfg ε M L (fun x=>protectedCreditSquareSource x.1 x.2 cfg.directions cfg.mask L E) hn s k ω

theorem cumulativeProtectedCreditSquareSource_stronglyAdapted {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) :
    StronglyAdapted (protectedStateFiltration cfg ε M L hn s) (cumulativeProtectedCreditSquareSource cfg ε M L E hn s) :=
  cumulativeProtectedStateSource_stronglyAdapted cfg ε M L _ (protectedCreditSquareSource_measurable cfg.directions cfg.mask L E) hn s

theorem cumulativeProtectedCreditSquareSource_norm_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (ω : BoardClockPath n) :
    ‖cumulativeProtectedCreditSquareSource cfg ε M L E hn s k ω‖≤(cfg.horizon:ℝ)*(protectedWholeSquareSourceCap n cfg.B E.card ((cfg.B/n)*cfg.B)) :=
  cumulativeProtectedStateSource_bound cfg ε M L hsp E hE _ (protectedWholeSquareSourceCap n cfg.B E.card ((cfg.B/n)*cfg.B))
    (protectedWholeSquareSourceCap_nonneg n cfg.B E.card ((cfg.B/n)*cfg.B) hB.le (mul_nonneg (div_nonneg hB.le (Nat.cast_nonneg n)) hB.le)) (fun e saved he hv=>protectedCreditSquareSource_norm_bound e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he (fun q=>⟨cfg.mask_nonneg q,hm q⟩) hv) hn s hsv k ω

theorem cumulativeProtectedCreditSquareSource_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (cumulativeProtectedCreditSquareSource cfg ε M L E hn s k) μ :=
  cumulativeProtectedStateSource_integrable cfg ε M L hsp E hE _ (protectedCreditSquareSource_measurable cfg.directions cfg.mask L E) (protectedWholeSquareSourceCap n cfg.B E.card ((cfg.B/n)*cfg.B))
    (protectedWholeSquareSourceCap_nonneg n cfg.B E.card ((cfg.B/n)*cfg.B) hB.le (mul_nonneg (div_nonneg hB.le (Nat.cast_nonneg n)) hB.le)) (fun e saved he hv=>protectedCreditSquareSource_norm_bound e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he (fun q=>⟨cfg.mask_nonneg q,hm q⟩) hv) hn s hsv k μ

def cumulativeProtectedEntropySquareSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  cumulativeProtectedStateSource cfg ε M L (fun x=>protectedEntropySquareSource x.1 x.2 cfg.directions cfg.mask L E cfg.B) hn s k ω

theorem cumulativeProtectedEntropySquareSource_stronglyAdapted {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) :
    StronglyAdapted (protectedStateFiltration cfg ε M L hn s) (cumulativeProtectedEntropySquareSource cfg ε M L E hn s) :=
  cumulativeProtectedStateSource_stronglyAdapted cfg ε M L _ (protectedEntropySquareSource_measurable cfg.directions cfg.mask L E cfg.B) hn s

theorem cumulativeProtectedEntropySquareSource_norm_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (ω : BoardClockPath n) :
    ‖cumulativeProtectedEntropySquareSource cfg ε M L E hn s k ω‖≤(cfg.horizon:ℝ)*(protectedWholeSquareSourceCap n cfg.B E.card (protectedEntropySourceCap n cfg.B)) :=
  cumulativeProtectedStateSource_bound cfg ε M L hsp E hE _ (protectedWholeSquareSourceCap n cfg.B E.card (protectedEntropySourceCap n cfg.B))
    (protectedWholeSquareSourceCap_nonneg n cfg.B E.card (protectedEntropySourceCap n cfg.B) hB.le (protectedEntropySourceCap_nonneg n cfg.B hB.le)) (fun e saved he hv=>protectedEntropySquareSource_norm_bound e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he (fun q=>⟨cfg.mask_nonneg q,hm q⟩) hv) hn s hsv k ω

theorem cumulativeProtectedEntropySquareSource_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (cumulativeProtectedEntropySquareSource cfg ε M L E hn s k) μ :=
  cumulativeProtectedStateSource_integrable cfg ε M L hsp E hE _ (protectedEntropySquareSource_measurable cfg.directions cfg.mask L E cfg.B) (protectedWholeSquareSourceCap n cfg.B E.card (protectedEntropySourceCap n cfg.B))
    (protectedWholeSquareSourceCap_nonneg n cfg.B E.card (protectedEntropySourceCap n cfg.B) hB.le (protectedEntropySourceCap_nonneg n cfg.B hB.le)) (fun e saved he hv=>protectedEntropySquareSource_norm_bound e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he (fun q=>⟨cfg.mask_nonneg q,hm q⟩) hv) hn s hsv k μ

end NoThreeLine
#print axioms NoThreeLine.cumulativeProtectedCreditSquareSource_integrable
#print axioms NoThreeLine.cumulativeProtectedEntropySquareSource_integrable
