import NoThreeLine.ProtectedScheduledKernel
import NoThreeLine.PhaseLineStageTransition

/-! The real completed-phase compensation identity with its physical
stage weight. Deadline retirement leaves both protected credit and the
stage value unchanged. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedPhaseCompensated {n : ℕ} {B : ℝ} (L : LineIndex n) (p : Grid n)
    (s : ProtectedPhaseState n B) : ℝ := protectedPhaseCredit L p s-s.2.2

theorem protectedPhaseCompensated_measurable {n : ℕ} {B : ℝ} (L : LineIndex n) (p : Grid n) :
    Measurable (protectedPhaseCompensated (B:=B) L p) :=
  (protectedPhaseCredit_measurable L p).sub measurable_snd.snd

theorem protectedScheduledPair_stageCompensated_mean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hpL : p∈L.val) (hn : 0<n) (hB : 0<B) (j : ℕ)
    (hKcfg : (cs j).K≤K) (hK : K<2) (hsp : specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (s : ProtectedPhaseState n B)
    (hs : validLineStageRegion K L N s.1) (hsv : 0≤s.2.1 p ∧ s.2.1 p≤2*B) (shift : ℝ) :
    (∫ω,let v := (protectedScheduledPair cs ε M deadline start L p hn j (s,ω)).1
        validLineStageValue K L N v.1*(protectedPhaseCompensated L p v+shift)
        ∂boardClockMeasure n (B/n))=
      validLineStageValue K L N s.1*(protectedPhaseCompensated L p s+shift) := by
  let cfg := (cs j).config
  let a := protectedPhaseStart cfg ε M s
  let ν := boardClockMeasure n (B/n)
  let v := fun ω=>(protectedScheduledPair cs ε M deadline start L p hn j (s,ω)).1
  let V := validLineStageValue K L N s.1
  by_cases ho : occupancy s.1.val.physical.process L=N
  · have hk := hs.2 ho
    let Q := phaseLineForbiddenLaw cfg ε M K L N hn a.1
    let D := terminalLineStageDensity cfg ε M K L N hn a.1
    let H := terminalCompensatedProtectedCredit cfg ε M L p hn a
    letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB
      (cs j).mask_le_one a.1 ho hk
    have he (ω : BoardClockPath n) : validLineStageValue K L N (v ω).1=V*D ω := by
      rw [show (v ω).1=(recycledScheduledPair cs ε M deadline start hn j (s.1,ω)).1 from
        congrArg Prod.fst (protectedScheduledPair_projection cs ε M deadline start L p hn j (s,ω))]
      simp only [recycledScheduledPair,validLineStageValue_retire]
      change lineStageValue cfg K L N (augRecycledTerminal cfg ε M hn a.1 ω)=V*D ω
      have hV : V=Real.exp (specifiedClockHazardPotential N (a.1.val.1.physical.clocks L)) :=
        if_pos ⟨ho,hk⟩
      rw [hV,show D ω=Real.exp (-specifiedClockHazardPotential N (a.1.val.1.physical.clocks L))*
        lineStageValue cfg K L N (augRecycledTerminal cfg ε M hn a.1 ω) from rfl,
        ←mul_assoc,←Real.exp_add,add_neg_cancel,Real.exp_zero,one_mul]
    have hc (ω : BoardClockPath n) : protectedPhaseCompensated L p (v ω)+shift=
        H ω+(shift-s.2.2) := by
      unfold v protectedPhaseCompensated protectedScheduledPair
      rw [protectedPhaseEnd_credit]
      simp only [protectedPhaseEnd,protectedDeadlineBook,protectedSourceTerminalPair,
        protectedSourceFinitePair,H,terminalCompensatedProtectedCredit,compensatedProtectedCredit,a,cfg]
      ring
    have hi : Integrable H Q := by
      apply (integrable_const (2*B+(cfg.horizon:ℝ)*((B/n)*B))).mono'
        (terminalCompensatedProtectedCredit_measurable cfg ε M L p hn a).aestronglyMeasurable
      exact ae_of_all _ (fun ω=>compensatedProtectedCredit_norm_bound cfg ε M L hsp p hpL hn hB.le
        (cs j).mask_le_one a hsv _ ω)
    have hm : (∫ω,H ω ∂Q)=protectedPhaseCredit L p s :=
      terminalCompensatedProtectedCredit_mean cfg ε M K hKcfg hK L hsp N hN p hpL hn hB
        (cs j).mask_le_one a ho hk hsv
    have hQ : (∫ω,(H ω+(shift-s.2.2)) ∂Q)=protectedPhaseCompensated L p s+shift := by
      rw [integral_add hi (integrable_const _),hm]
      simp only [integral_const,measureReal_def,measure_univ,ENNReal.toReal_one,one_smul,
        protectedPhaseCompensated]
      ring
    have hD (ω : BoardClockPath n) : 0≤D ω :=
      (lineStageDensity_bounds cfg K hK L N hN a.1 (augRecycledTerminal cfg ε M hn a.1 ω) hk).1
    change (∫ω,validLineStageValue K L N (v ω).1*(protectedPhaseCompensated L p (v ω)+shift) ∂ν)=_
    simp_rw [he,hc,mul_assoc]
    rw [integral_const_mul,←savedCreditMeasure_integral ν D
      (terminalLineStageDensity_measurable cfg ε M K L N hn a.1) hD (fun ω=>H ω+(shift-s.2.2))]
    exact congrArg (fun z=>V*z) hQ
  · have hV : V=0 := if_neg (fun h=>ho h.1)
    have hv (ω : BoardClockPath n) : validLineStageValue K L N (v ω).1=0 := by
      have hmono := recycledScheduledPair_occupancy_le cs ε M deadline start hn j L s.1 ω
      have he := congrArg Prod.fst (protectedScheduledPair_projection cs ε M deadline start L p hn j (s,ω))
      change (v ω).1=_ at he
      rw [←he] at hmono
      exact if_neg (fun h=>ho (le_antisymm (hmono.trans_eq h.1) hs.1))
    change (∫ω,validLineStageValue K L N (v ω).1*(protectedPhaseCompensated L p (v ω)+shift) ∂ν)=
      V*(protectedPhaseCompensated L p s+shift)
    simp only [hV,hv,zero_mul,integral_zero]

end NoThreeLine

#print axioms NoThreeLine.protectedScheduledPair_stageCompensated_mean
