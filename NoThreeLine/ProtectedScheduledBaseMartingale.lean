import NoThreeLine.ProtectedScheduledRegion
import NoThreeLine.ProtectedScheduledMean
import NoThreeLine.ScheduledLineForbiddenLaw

/-! The original board supports both the stage-density martingale and
the density times actual protected compensation on the full ledger
history. The phase count does not enter the source bound. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

def protectedScheduledDensity {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (p : Grid n) (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B)
    (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  validLineStageDensity K L N s.1 (protectedScheduledIterate cs ε M deadline start L p hn J s k ω).1.2.1

def protectedScheduledCompensated {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B)
    (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  protectedPhaseCompensated L p (protectedScheduledIterate cs ε M deadline start L p hn J s k ω).1.2

theorem protectedScheduled_base_martingales {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<B) (hN : N≤1) (J : ℕ)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (hsp : ∀j,specified (cs j).directions L)
    (s : ProtectedPhaseState n B) (hs : protectedScheduleRegion cs start K L N p J (0,s))
    (hk : s.1.val.physical.clocks L≤K) :
    let D := protectedScheduledDensity cs ε M K deadline start L N p hn J s
    let H := protectedScheduledCompensated cs ε M deadline start L p hn J s
    let F := protectedScheduledFiltration cs ε M deadline start L p hn J s
    Martingale D F (boardClockMeasure n (B/n)) ∧
      Martingale (fun k ω=>D k ω*H k ω) F (boardClockMeasure n (B/n)) := by
  classical
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let F := protectedScheduledStep cs ε M deadline start L p hn J
  have hF : Measurable F := protectedScheduledStep_measurable cs ε M deadline start L p hn J
  have hsect := protectedScheduledStep_map cs ε M deadline start L p hn hB J
  let R := protectedScheduleRegion cs start K L N p J
  have hRm : Measurable R := protectedScheduleRegion_measurable cs start K L N p J
  have hR := protectedScheduleRegion_step cs ε M K deadline start L p hpL hn hB.le N hN J hKcfg hsp
  let d : ℕ × ProtectedPhaseState n B→ℝ := fun v=>validLineStageDensity K L N s.1 v.2.1
  let c : ℕ × ProtectedPhaseState n B→ℝ := fun v=>protectedPhaseCompensated L p v.2
  have hd : Measurable d := (validLineStageDensity_measurable K L N s.1).comp measurable_snd.fst
  have hc : Measurable c := (protectedPhaseCompensated_measurable L p).comp measurable_snd
  have hdB (v : ℕ × ProtectedPhaseState n B) : 0≤d v ∧ d v≤(2/(2-K))^2 :=
    validLineStageDensity_bounds K hK L N hN s.1 v.2.1 hk
  have hdm (v : ℕ × ProtectedPhaseState n B) (hv : R v) :
      (∫ω,d (F (v,ω)).1 ∂ν)=d v := by
    by_cases hj : v.1<J
    · have hp (ω : BoardClockPath n) :
          (protectedScheduledPair cs ε M deadline start L p hn v.1 (v.2,ω)).1.1=
            (recycledScheduledPair cs ε M deadline start hn v.1 (v.2.1,ω)).1 :=
        congrArg Prod.fst (protectedScheduledPair_projection cs ε M deadline start L p hn v.1 (v.2,ω))
      simp only [F,protectedScheduledStep,if_pos hj,d,validLineStageDensity,hp]
      rw [integral_const_mul,recycledScheduledPair_lineStageValue_mean cs ε M K deadline start hn hB
        v.1 (hKcfg _) hK L (hsp _) N hN v.2.1 hv.2.1]
    · simp only [F,protectedScheduledStep,if_neg hj]
      simp
  have hD := credit_martingale_of_invariant F hF ν hsect d hd _ hdB R hRm hR hdm (0,s) hs
  let T := protectedScheduleBudget cs start J
  let z : ℕ × ProtectedPhaseState n B→ℝ := fun v=>if R v then d v*(c v+T) else 0
  have hz : Measurable z := Measurable.ite hRm.setOf (hd.mul (hc.add measurable_const)) measurable_const
  have hzB (v : ℕ × ProtectedPhaseState n B) : 0≤z v ∧ z v≤(2/(2-K))^2*(2*B+T) := by
    have hT : 0≤T := by
      have ht : start≤phaseEndpoint cs start J := calc
        start = phaseEndpoint cs start 0 := (phaseEndpoint_zero cs start).symm
        _ ≤ _ := phaseEndpoint_mono cs start (Nat.zero_le J)
      exact mul_nonneg (sub_nonneg.mpr ht) (mul_nonneg (div_nonneg hB.le (Nat.cast_nonneg n)) hB.le)
    by_cases hv : R v
    · simp only [z,if_pos hv]
      have hcredit := protectedLineCredit_bounds_all L v.2.1.val.physical v.2.2.1
        (cs 0).directions (hsp 0) p hpL B v.2.1.property.1 hv.2.2.1
      have ha := hv.2.2.2.2.trans (protectedScheduleBudget_mono cs start hB.le hv.1)
      have hc0 : 0≤c v+T := by
        change 0≤protectedLineCredit L v.2.1.val.physical v.2.2.1 p-v.2.2.2+T
        linarith [hcredit.1]
      have hcb : c v+T≤2*B+T := by
        change protectedLineCredit L v.2.1.val.physical v.2.2.1 p-v.2.2.2+T≤2*B+T
        linarith [hcredit.2,hv.2.2.2.1]
      exact ⟨mul_nonneg (hdB v).1 hc0,mul_le_mul (hdB v).2 hcb hc0 (sq_nonneg _)⟩
    · simp only [z,if_neg hv]
      exact ⟨le_rfl,mul_nonneg (sq_nonneg _) (by linarith)⟩
  have hzm (v : ℕ × ProtectedPhaseState n B) (hv : R v) :
      (∫ω,z (F (v,ω)).1 ∂ν)=z v := by
    have hzstep (ω : BoardClockPath n) :
        z (F (v,ω)).1=d (F (v,ω)).1*(c (F (v,ω)).1+T) := if_pos (hR v hv ω)
    simp only [hzstep,show z v=d v*(c v+T) from if_pos hv]
    by_cases hj : v.1<J
    · simp only [F,protectedScheduledStep,if_pos hj,d,c,validLineStageDensity,mul_assoc]
      rw [integral_const_mul,protectedScheduledPair_stageCompensated_mean cs ε M K deadline start L p hpL hn hB
        v.1 (hKcfg _) hK (hsp _) N hN v.2 hv.2.1 hv.2.2.1 T]
    · simp only [F,protectedScheduledStep,if_neg hj]
      simp
  have hzM := credit_martingale_of_invariant F hF ν hsect z hz _ hzB R hRm hR hzm (0,s) hs
  have hsM := hzM.sub (hD.smul T)
  refine ⟨hD,hsM.congr ?_ ?_⟩
  · exact StateHistory.state_stronglyAdapted (state F (0,s)) (state_measurable F hF (0,s)) _
      (hd.mul hc)
  · intro k
    exact ae_of_all _ (fun ω=>by
      let v := state F (0,s) k ω
      have hv : R v := iterate_region F R hR (0,s) hs k ω
      change z v-T*d v=d v*c v
      rw [show z v=d v*(c v+T) from if_pos hv]
      ring)

end NoThreeLine

#print axioms NoThreeLine.protectedScheduled_base_martingales
