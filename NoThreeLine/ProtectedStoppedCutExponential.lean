import NoThreeLine.ProtectedCutObservationBounds
import NoThreeLine.InsertedCutSupermartingale

/-! Freeze the first strict inserted cut under the same whole-phase law.
The observation contains the actual past and actual elapsed compensation. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedStoppedCutExponential {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (param : ℕ→BoardClockPath n→ℝ) : ℕ→BoardClockPath n→ℝ :=
  insertedCutValue
    (protectedStateExponential cfg ε M L (fun v=>G (v.1.val.1.physical,v.2)) F V θ hn s)
    (protectedCutObservation cfg ε M L G F V θ cut hn s param)
    (protectedCutReached cfg ε M L cut hn s param)

theorem protectedStoppedCutExponential_nonneg {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (param : ℕ→BoardClockPath n→ℝ) (k : ℕ) (ω : BoardClockPath n) :
    0≤protectedStoppedCutExponential cfg ε M L G F V θ cut hn s param k ω := by
  classical
  induction k with
  | zero => exact Real.exp_nonneg _
  | succ k ih =>
      change 0 ≤ if ω∈insertedCutHit (protectedCutReached cfg ε M L cut hn s param) k
        then protectedStoppedCutExponential cfg ε M L G F V θ cut hn s param k ω
        else protectedCutObservation cfg ε M L G F V θ cut hn s param k ω
      split_ifs
      · exact ih
      · exact protectedCutObservation_nonneg cfg ε M L G F V θ cut hn s param k ω

theorem protectedStoppedCutExponential_supermartingale {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (hG : Measurable G) (hF : Measurable F) (hV : Measurable V)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hcut : Measurable cut)
    (hu : ∀v a,0≤cut (v,a))
    (hug : ∀v a,cut (v,a)≤augGuardTime cfg ε M (augTimedInput cfg v.1))
    (θ D C W : ℝ) (hC : 0≤C) (hW : 0≤W)
    (hGD : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖G (e,saved)‖≤D)
    (hFC : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hVW : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖V (e,saved)‖≤W)
    (hfirst : ∀v : ProtectedTimedState cfg,occupancy v.1.val.1.physical.process L≤1→
      v.1.val.1.physical.clocks L≤K→(∀p∈E,0≤v.2 p ∧ v.2 p≤2*cfg.B)→∀a : ℝ,
      (∫ω,protectedParameterCutExponential cfg G F V θ cut
        ((v,(protectedRestartStep cfg ε M L hn (v,ω)).1),a)
        ∂firstLineForbiddenLaw cfg ε M L hn v.1)≤Real.exp (θ*G (v.1.val.1.physical,v.2)))
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (param : ℕ→BoardClockPath n→ℝ)
    (hp : ∀k,@Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance (param k)) :
    Supermartingale (protectedStoppedCutExponential cfg ε M L G F V θ cut hn s param)
      (protectedStateFiltration cfg ε M L hn s) (phaseLineForbiddenLaw cfg ε M K L N hn s.1) := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have hstate : Measurable (fun v : ProtectedTimedState cfg=>G (v.1.val.1.physical,v.2)) :=
    hG.comp (((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst)).prodMk measurable_snd)
  obtain ⟨B,hbound⟩ := protectedCutObservation_bounds cfg ε M L hsp E hE G F V θ D C W hC hW hGD hFC hVW cut hu hug hn s hsv param
  apply insertedCutValue_supermartingale _ (protectedStateFiltration cfg ε M L hn s)
    (protectedStateExponential cfg ε M L (fun v=>G (v.1.val.1.physical,v.2)) F V θ hn s)
    (protectedCutObservation cfg ε M L G F V θ cut hn s param)
    (protectedCutReached cfg ε M L cut hn s param) B
    (protectedStateExponential_measurable_history cfg ε M L _ F V θ hstate hF hV hn s)
    (fun k=>(protectedCutObservation_history cfg ε M L G F V θ hG hF hV cut hcut hn s param hp k).1)
    (fun k=>(protectedCutObservation_history cfg ε M L G F V θ hG hF hV cut hcut hn s param hp k).2)
    (fun k ω=>(hbound k ω).1) (fun k ω=>(hbound k ω).2) _
    (protectedCutObservation_of_not_reached cfg ε M L G F V θ cut hn s param)
  intro k A hA
  exact protectedParameterCutKernel_past_integral_le cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    G F V hG hF hV cut hcut hu hug θ D C W hC hW hGD hFC hVW hfirst hm s ho hk hsv k (param k) (hp k) A hA

theorem protectedStoppedCutExponential_maximal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (param : ℕ→BoardClockPath n→ℝ) (μ : Measure (BoardClockPath n)) [IsProbabilityMeasure μ]
    (hY : Supermartingale (protectedStoppedCutExponential cfg ε M L G F V θ cut hn s param)
      (protectedStateFiltration cfg ε M L hn s) μ) (r : ℝ) (hr : 0<r) :
    μ {ω | ∃k,r≤protectedStoppedCutExponential cfg ε M L G F V θ cut hn s param k ω}≤
      ENNReal.ofReal (Real.exp (θ*G (s.1.val.1.physical,s.2))/r) := by
  have h := nonnegativeSupermartingale_maximal μ (protectedStateFiltration cfg ε M L hn s)
    (protectedStoppedCutExponential cfg ε M L G F V θ cut hn s param) hY
    (protectedStoppedCutExponential_nonneg cfg ε M L G F V θ cut hn s param) r hr
  simpa [protectedStoppedCutExponential,insertedCutValue,protectedStateExponential,
    cumulativeProtectedStateSource,protectedRecycledPair,RecycledBoardProcess.iterate] using h

end NoThreeLine
#print axioms NoThreeLine.protectedStoppedCutExponential_supermartingale
#print axioms NoThreeLine.protectedStoppedCutExponential_maximal
