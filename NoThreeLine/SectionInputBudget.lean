import NoThreeLine.SectionScheduledRawCredit
import NoThreeLine.LineCreditErrorBudget

/-! Exact discrete schedule input and its deterministic margin. The actual
line masks, total duration and root self-rate are retained. A concrete G5
input certificate is not supplied by these general analytic lemmas. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open Filter
open scoped BigOperators Topology

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

def sectionScheduleInput {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (L : LineIndex n) (p : Grid n) (J : ℕ) : ℝ :=
  ∑j∈Finset.range J,(cs j).horizon*binaryLineInputRate (cs j).mask L p

theorem sectionScheduleInput_eq_cumulative {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (L : LineIndex n) (p : Grid n) (J : ℕ) :
    sectionScheduleInput cs L p J =
      (∑q∈L.val.erase p,∑j∈Finset.range J,(cs j).horizon*(cs j).mask q)/(n:ℝ) := by
  simp only [sectionScheduleInput,binaryLineInputRate,←mul_div_assoc,←Finset.sum_div,
    Finset.mul_sum]
  rw [Finset.sum_comm]

theorem sectionScheduleBudget_eq {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (L : LineIndex n) (p : Grid n) (δ : ℝ) (J : ℕ) :
    sectionScheduleBudget cs L p δ J = sectionScheduleInput cs L p J +
      phaseEndpoint cs 0 J*δ+phaseEndpoint cs 0 J*(B/n) := by
  simp only [sectionScheduleBudget,sectionScheduleInput,phaseEndpoint,NNReal.coe_sum,zero_add,
    mul_add,Finset.sum_add_distrib,Finset.sum_mul]

theorem sectionScheduleBudget_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (L : LineIndex n) (p : Grid n) (δ T lam : ℝ) (J : ℕ)
    (hδ : 0≤δ) (hB : 0≤B) (hT : phaseEndpoint cs 0 J≤T)
    (hinput : sectionScheduleInput cs L p J≤lam) :
    sectionScheduleBudget cs L p δ J ≤ lam+T*δ+T*(B/n) := by
  rw [sectionScheduleBudget_eq]
  exact add_le_add (add_le_add hinput (mul_le_mul_of_nonneg_right hT hδ))
    (mul_le_mul_of_nonneg_right hT (div_nonneg hB (Nat.cast_nonneg n)))

theorem exists_sectionScheduleBudget_gap (T lam ρ d : ℝ) (hT : 0≤T)
    (hgap : lam<1-ρ) (hd : d<1) :
    ∃ δ : ℝ, 0<δ ∧ ∃ N : ℕ, 1≤N ∧ ∀n≥N,
      ∀ (B : ℝ) (cs : ℕ→SharedPhase n B) (L : LineIndex n) (p : Grid n) (J : ℕ),
        0≤B → B≤(n:ℝ)^d → phaseEndpoint cs 0 J≤T → sectionScheduleInput cs L p J≤lam →
        sectionScheduleBudget cs L p δ J<1-ρ := by
  let g := 1-ρ-lam
  have hg : 0<g := by dsimp [g]; linarith
  let δ := g/(4*(T+1))
  have hδ : 0<δ := div_pos hg (by positivity)
  have hδT : T*δ≤g/4 := by
    dsimp [δ]
    apply (le_div_iff₀ (by norm_num : (0:ℝ)<4)).mpr
    have he : T*(g/(4*(T+1)))*4 = g*(T/(T+1)) := by field_simp <;> ring
    rw [he]
    exact mul_le_of_le_one_right hg.le ((div_le_one (by positivity : (0:ℝ)<T+1)).mpr (by linarith))
  have ht : Tendsto (fun n : ℕ=>T*((n:ℝ)^d/(n:ℝ))) atTop (𝓝 (0:ℝ)) := by
    simpa only [mul_zero] using (tendsto_nat_rpow_div_nat d hd).const_mul T
  obtain ⟨N,hN⟩ := eventually_atTop.mp (ht.eventually (gt_mem_nhds (show (0:ℝ)<g/4 by positivity)))
  refine ⟨δ,hδ,max N 1,le_max_right _ _,?_⟩
  intro n hn B cs L p J hB hBn htime hinput
  have he : T*(B/n)<g/4 := (mul_le_mul_of_nonneg_left
    (div_le_div_of_nonneg_right hBn (Nat.cast_nonneg n)) hT).trans_lt
      (hN n ((le_max_left _ _).trans hn))
  have hb := sectionScheduleBudget_le cs L p δ T lam J hδ.le hB htime hinput
  dsimp [g] at hg he hδT
  linarith

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.sectionScheduleInput_eq_cumulative
#print axioms NoThreeLine.BirthWitness.sectionScheduleBudget_eq
#print axioms NoThreeLine.BirthWitness.exists_sectionScheduleBudget_gap
