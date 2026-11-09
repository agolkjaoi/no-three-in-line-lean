import NoThreeLine.ProtectedScheduledKernel
import NoThreeLine.RecycledPhaseComposition

/-! The actual scheduled process with its passive protected payload. The
finite prefix is held fixed after its last phase so the same history
filtration can be indexed by all natural numbers. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

def protectedScheduledStep {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (J : ℕ) (x : (ℕ × ProtectedPhaseState n B) × BoardClockPath n) :
    (ℕ × ProtectedPhaseState n B) × BoardClockPath n :=
  if x.1.1<J then
    let r := protectedScheduledPair cs ε M deadline start L p hn x.1.1 (x.1.2,x.2)
    ((x.1.1+1,r.1),r.2)
  else x

theorem protectedScheduledStep_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (J : ℕ) : Measurable (protectedScheduledStep cs ε M deadline start L p hn J) := by
  have hr : Measurable (fun x : ℕ × (ProtectedPhaseState n B × BoardClockPath n)=>
      protectedScheduledPair cs ε M deadline start L p hn x.1 x.2) :=
    measurable_from_prod_countable_right (fun j=>protectedScheduledPair_measurable cs ε M deadline start L p hn j)
  have h := hr.comp (measurable_fst.fst.prodMk (measurable_fst.snd.prodMk measurable_snd))
  have hi : Measurable (fun x : (ℕ × ProtectedPhaseState n B) × BoardClockPath n=>x.1.1+1) :=
    (measurable_of_countable (fun j : ℕ=>j+1)).comp measurable_fst.fst
  exact Measurable.ite
    ((measurable_of_countable (fun j : ℕ=>j<J)).comp measurable_fst.fst).setOf
    ((hi.prodMk h.fst).prodMk h.snd) measurable_id

theorem protectedScheduledStep_map {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (hB : 0<B) (J : ℕ) (a : ℕ × ProtectedPhaseState n B) :
    (boardClockMeasure n (B/n)).map (fun ω=>protectedScheduledStep cs ε M deadline start L p hn J (a,ω))=
      ((boardClockMeasure n (B/n)).map (fun ω=>(protectedScheduledStep cs ε M deadline start L p hn J (a,ω)).1)).prod
        (boardClockMeasure n (B/n)) := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  by_cases ha : a.1<J
  · simp only [protectedScheduledStep,if_pos ha]
    let d : ProtectedPhaseState n B → ℕ × ProtectedPhaseState n B := fun s=>(a.1+1,s)
    have hd : Measurable d := measurable_const.prodMk measurable_id
    have hp : Measurable (fun r : ProtectedPhaseState n B × BoardClockPath n=>(d r.1,r.2)) :=
      (hd.comp measurable_fst).prodMk measurable_snd
    have hr : Measurable (fun ω=>protectedScheduledPair cs ε M deadline start L p hn a.1 (a.2,ω)) :=
      (protectedScheduledPair_measurable cs ε M deadline start L p hn a.1).comp
        (measurable_const.prodMk measurable_id)
    have h := congrArg (fun μ : Measure (ProtectedPhaseState n B × BoardClockPath n)=>
      μ.map (fun r=>(d r.1,r.2))) (protectedScheduledPair_map cs ε M deadline start L p hn hB a.1 a.2)
    rw [Measure.map_map hp hr,map_pair_with_fresh_right _ _ d hd,Measure.map_map hd hr.fst] at h
    exact h
  · simp only [protectedScheduledStep,if_neg ha]
    change ν.map (Prod.mk a)= (ν.map (fun _ : BoardClockPath n=>a)).prod ν
    rw [Measure.map_const,measure_univ,one_smul,Measure.dirac_prod]

def protectedScheduledIterate {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B) (k : ℕ) (ω : BoardClockPath n) :
    (ℕ × ProtectedPhaseState n B) × BoardClockPath n :=
  iterate (protectedScheduledStep cs ε M deadline start L p hn J) (0,s) k ω

theorem protectedScheduledIterate_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B) (k : ℕ) (hk : k≤J) (ω : BoardClockPath n) :
    let r := protectedScheduledIterate cs ε M deadline start L p hn J s k ω
    ((r.1.1,r.1.2.1),r.2)=recycledPhases cs ε M deadline start hn s.1 k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    let r := protectedScheduledIterate cs ε M deadline start L p hn J s k ω
    have he := ih (Nat.le_of_succ_le hk)
    change ((r.1.1,r.1.2.1),r.2)=recycledPhases cs ε M deadline start hn s.1 k ω at he
    have hi : r.1.1=k := (congrArg (fun z=>(Prod.fst z).1) he).trans
      (recycledPhases_index cs ε M deadline start hn s.1 k ω)
    have hlt : r.1.1<J := by rw [hi]; exact hk
    let q := protectedScheduledStep cs ε M deadline start L p hn J r
    change ((q.1.1,q.1.2.1),q.2)=recycledPhaseStep cs ε M deadline start hn
      (recycledPhases cs ε M deadline start hn s.1 k ω)
    rw [←he]
    have hp := protectedScheduledPair_projection cs ε M deadline start L p hn r.1.1 (r.1.2,r.2)
    simpa only [q,protectedScheduledStep,if_pos hlt,recycledPhaseStep] using
      congrArg (fun z : ValidAugmentedState n B × BoardClockPath n=>((r.1.1+1,z.1),z.2)) hp

theorem protectedScheduledIterate_stable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B) (ω : BoardClockPath n) (k : ℕ) (hk : J≤k) :
    protectedScheduledIterate cs ε M deadline start L p hn J s k ω=
      protectedScheduledIterate cs ε M deadline start L p hn J s J ω := by
  let r := protectedScheduledIterate cs ε M deadline start L p hn J s J ω
  have hi : r.1.1=J := (congrArg (fun z=>(Prod.fst z).1)
    (protectedScheduledIterate_projection cs ε M deadline start L p hn J s J le_rfl ω)).trans
    (recycledPhases_index cs ε M deadline start hn s.1 J ω)
  induction k,hk using Nat.le_induction with
  | base => rfl
  | succ k hk ih =>
    change protectedScheduledStep cs ε M deadline start L p hn J
      (protectedScheduledIterate cs ε M deadline start L p hn J s k ω)=r
    rw [ih]
    have hh : ¬r.1.1<J := by rw [hi]; exact Nat.lt_irrefl _
    exact if_neg hh

def protectedScheduledFiltration {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B) :
    Filtration ℕ (inferInstance : MeasurableSpace (BoardClockPath n)) :=
  StateHistory.filtration (state (protectedScheduledStep cs ε M deadline start L p hn J) (0,s))
    (state_measurable _ (protectedScheduledStep_measurable cs ε M deadline start L p hn J) (0,s))

end NoThreeLine

#print axioms NoThreeLine.protectedScheduledStep_map
#print axioms NoThreeLine.protectedScheduledIterate_projection
#print axioms NoThreeLine.protectedScheduledIterate_stable
