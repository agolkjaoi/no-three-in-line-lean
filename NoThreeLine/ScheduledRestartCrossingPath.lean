import NoThreeLine.ScheduledCrossingBeforeExit

/-! At the first actual line birth, the restarted crossing observation
equals the original schedule's occupancy-one observation almost surely.
The original saved ledger and residual are used through the birth phase. -/
set_option autoImplicit false
set_option maxHeartbeats 2500000
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem scheduledRestartProtectedExceedance_ae_eq_original {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<B) (b : ℝ) (J : ℕ) (s : ProtectedPhaseState n B)
    (ho : occupancy s.1.val.physical.process L=0) :
    scheduledRestartProtectedExceedance cs ε M deadline start L E A hn b J s
      =ᵐ[boardClockMeasure n (B/n)] scheduledProtectedExceedance cs ε M deadline start L 1 E A hn b J s := by
  filter_upwards [validScheduledPhasesCompletion_ae cs ε M deadline start hn hB s.1] with ω hd
  apply propext
  change ω∈scheduledRestartProtectedExceedance cs ε M deadline start L E A hn b J s ↔
    ω∈scheduledProtectedExceedance cs ε M deadline start L 1 E A hn b J s
  rw [mem_scheduledProtectedExceedance_iff_original cs ε M deadline start L 1 E A p hn b J s ω]
  let ref := fun j=>protectedScheduledIterate cs ε M deadline start L p hn J s j ω
  let q := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J ω
  let R := scheduledCrossingRemainderPair cs ε M deadline start L 1 E A hn b J
  let H := fun j=>protectedScheduledExceedanceAt cs ε M deadline start L 1 E A p hn b J s j ω
  have hnone (j : ℕ) (hj : j≤J) (hz : occupancy (ref j).1.2.1.val.physical.process L≤0)
      (i : ℕ) (hi : i<j) : ¬H i := by
    intro h
    let cfg := (cs i).config
    let a := protectedPhaseStart cfg ε M (ref i).1.2
    change (ref i).2∈protectedActualExceedance cfg ε M L 1 E A hn a b at h
    obtain ⟨k,hk⟩ := (mem_protectedActualExceedance_iff cfg ε M L 1 E A hn a b (ref i).2).mp h
    have hm := protectedScheduledInternal_occupancy_le_later cs ε M deadline start L p hn J s ω
      i j k hi hj (hd i)
    change occupancy (protectedRecycledPair cfg ε M L hn a k (ref i).2).1.1.val.1.physical.process L≤
      occupancy (ref j).1.2.1.val.physical.process L at hm
    have he : occupancy (protectedRecycledPair cfg ε M L hn a k (ref i).2).1.1.val.1.physical.process L=1 := hk.1
    omega
  change (R q).1.2=true ↔ ∃ i : ℕ, i < J ∧ H i
  rcases scheduledLineExitIterate_cases cs ε M deadline start L 0 p hn J s ho.le J le_rfl ω with
    ⟨hq,hz⟩ | ⟨j,hj,hz,_,hq⟩
  · change q=lineExitBoundaryView cs (ref J) at hq
    have hi : (lineExitBoundaryView cs (ref J)).1.1=J :=
      protectedScheduledIterate_index cs ε M deadline start L p hn J s J le_rfl ω
    have hnlt : ¬(lineExitBoundaryView cs (ref J)).1.1<J := by rw [hi]; exact Nat.lt_irrefl _
    simp only [hq,R,scheduledCrossingRemainderPair,if_neg hnlt,Bool.false_eq_true,false_iff,not_exists]
    rintro i ⟨hi,he⟩
    exact hnone J le_rfl hz i hi he
  · let cfg := (cs j).config
    let a := protectedPhaseStart cfg ε M (ref j).1.2
    let w := (ref j).2
    let z := protectedLineExitPair cfg ε M L 0 hn a w
    let i := firstHitIndex (protectedRestartStep cfg ε M L hn) (protectedLineExitTest cfg L 0) a w
    let t := timedCrossingPhasePair cs ε M deadline start L 1 E A hn b j (z.1,z.2)
    let c := protectedScheduledPair cs ε M deadline start L p hn j ((ref j).1.2,w)
    have hidx : (ref j).1.1=j := protectedScheduledIterate_index cs ε M deadline start L p hn J s j hj.le ω
    have hnext : ref (j+1)=((j+1,c.1),c.2) := by
      change protectedScheduledStep cs ε M deadline start L p hn J (ref j)=_
      simp only [protectedScheduledStep,hidx,if_pos hj,c,w]
    have hp := protectedScheduledIterate_projection cs ε M deadline start L p hn J s j hj.le ω
    have hs : a.1=augPhaseStart cfg ε M (recycledPhaseState cs ε M deadline start hn s.1 j ω) :=
      congrArg (augPhaseStart cfg ε M) (congrArg (fun y=>y.1.2) hp)
    have hw : w=(recycledPhases cs ε M deadline start hn s.1 j ω).2 := congrArg Prod.snd hp
    have hd' : AugTimedDone cfg (augRecycledTerminal cfg ε M hn a.1 w) := by rw [hs,hw]; exact hd j
    have ht : protectedRecycledTerminalPair cfg ε M L hn z.1 z.2=
        protectedRecycledTerminalPair cfg ε M L hn a w :=
      protectedRecycledTerminalPair_continue cfg ε M L hn a i w hd'
    have hv : protectedCrossingBoundaryView (t.1.1,t.2)=protectedCrossingBoundaryView (c.1,c.2) := by
      let U := fun y : ProtectedTimedState cfg×BoardClockPath n=>
        protectedCrossingBoundaryView
          (protectedPhaseEnd cfg L deadline (phaseEndpoint cs start (j+1)) ((y.1,0),0),y.2)
      exact congrArg U ht
    have hcur : t.1.2=true ↔ H j := by
      change (timedCrossingPhasePair cs ε M deadline start L 1 E A hn b j (z.1,z.2)).1.2=true ↔ _
      rw [timedCrossingPhasePair_flag cs ε M deadline start L 1 E A hn b j z.1 z.2]
      exact protectedActualExceedance_at_lineExit_iff cfg ε M L 0 E A hn a b w
    let k := J-(j+1)
    have hjk : (j+1)+k=J := Nat.add_sub_of_le hj
    have htail := scheduledCrossingTail_flag_iff_original cs ε M deadline start L 1 E A p hn b J s ω
      (j+1) k hjk.le (t.1.1,t.2) (by
        change protectedCrossingBoundaryView (t.1.1,t.2)=
          protectedCrossingBoundaryView ((ref (j+1)).1.2,(ref (j+1)).2)
        rw [hnext]
        exact hv)
    change (scheduledCrossingTail cs ε M deadline start L 1 E A hn b (j+1) k (t.1.1,t.2)).1.2=true ↔
      (∃ i : ℕ, j+1 ≤ i ∧ i < (j+1)+k ∧ H i) at htail
    rw [hjk] at htail
    change q=((j,packProtectedTimed cfg z.1),z.2) at hq
    rw [hq]
    have hu : unpackProtectedTimed (cs j).config (packProtectedTimed cfg z.1)=z.1 :=
      unpackProtectedTimed_pack cfg z.1
    simp only [R,scheduledCrossingRemainderPair,if_pos hj,hu,crossingAppend]
    change ((t.1.2 || (scheduledCrossingTail cs ε M deadline start L 1 E A hn b (j+1) k
      (t.1.1,t.2)).1.2)=true) ↔ _
    rw [Bool.or_eq_true,hcur,htail]
    constructor
    · rintro (h | ⟨v,_,hv,h⟩)
      · exact ⟨j,hj,h⟩
      · exact ⟨v,hv,h⟩
    · rintro ⟨v,hv,h⟩
      have hjv : j≤v := le_of_not_gt (fun hvj=>hnone j hj.le hz v hvj h)
      by_cases he : v=j
      · exact Or.inl (he ▸ h)
      · exact Or.inr ⟨v,by omega,hv,h⟩

theorem scheduledLineRestartLaw_original_stageOne_crossing_ge {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (J : ℕ) (hKcfg : ∀i,(cs i).K≤K) (hK : K<2) (hsp : ∀i,specified (cs i).directions L)
    (s : ProtectedPhaseState n B) (ho : occupancy s.1.val.physical.process L=0) :
    (boardClockMeasure n (B/n)).real (scheduledProtectedExceedance cs ε M deadline start L 1 E A hn b J s)≤
      (scheduledLineRestartLaw cs ε M K deadline start L hn J s).real
        (scheduledProtectedExceedance cs ε M deadline start L 1 E A hn b J s) := by
  have he := scheduledRestartProtectedExceedance_ae_eq_original cs ε M deadline start L E A p hn hB b J s ho
  have hAC : scheduledLineRestartLaw cs ε M K deadline start L hn J s ≪ boardClockMeasure n (B/n) :=
    savedCreditMeasure_absolutelyContinuous _ _
  have h := scheduledLineRestartLaw_protected_firstCrossing_ge cs ε M K deadline start L E A hA hn hB
    b J hKcfg hK hsp s
  simp only [measureReal_def,measure_congr he,measure_congr (hAC.ae_le he)] at h
  exact h

end NoThreeLine

#print axioms NoThreeLine.scheduledRestartProtectedExceedance_ae_eq_original
#print axioms NoThreeLine.scheduledLineRestartLaw_original_stageOne_crossing_ge

