import NoThreeLine.LineSectionMassSupport

/-! A measurable cover for arbitrary positive executed-time strict
exceedances while the physical root is active and unstopped. It also covers
later observations after a genuine permanent contact. -/
set_option autoImplicit false
set_option maxHeartbeats 1700000
noncomputable section
open MeasureTheory Set Filter

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator

def markedSectionExceededAt {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (k : ℕ) (x : GoodMarkedLineSection cfg p × BoardClockPath n) : Prop :=
  let v := RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) x.1 k x.2
  ¬phaseRootClosed p (observedTimedProjection cfg v.1.val.1.1) ∧
    (v.1.val.2 = true ∨ markedSectionContactAt cfg ε M start L p E A hn k x)

theorem markedSectionExceededAt_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (k : ℕ) :
    Measurable (markedSectionExceededAt cfg ε M start L p E A hn k) := by
  have hv := RecycledBoardProcess.iterate_joint_measurable _
    (goodMarkedRestart_measurable cfg ε M start L p E A hn) k
  have hs := hv.fst.subtype_val
  exact (((phaseRootClosed_measurable p).comp ((observedTimedProjection_measurable cfg).comp hs.fst.fst)).not).and
    ((hs.snd.eq_const true).or (markedSectionContactAt_measurable cfg ε M start L p E A hn k))

theorem markedSectionExceededAt_of_strict_mass {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (ω : BoardClockPath n) (k : ℕ) (t : ℝ)
    (ht : 0 < t)
    (hactive : ¬phaseRootClosed p (observedTimedProjection cfg
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1.val.1.1))
    (hta : t ≤ augAdvance cfg ε M
      (augTimedInput cfg (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1.val.1.1.1,
        (WinnerMarkLaw.firstMarkedRace hn (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).2).1.1))
    (hmass : A < actualLineSectionMass L p E (selectedAugmentedCurve cfg
      (augTimedInput cfg (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1.val.1.1.1).1 t)) :
    markedSectionExceededAt cfg ε M start L p E A hn k (s,ω) := by
  classical
  let v := RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω
  refine ⟨hactive,?_⟩
  by_cases hf : v.1.val.2 = true
  · exact Or.inl hf
  right
  have hm0 := Bool.eq_false_iff.mpr hf
  have ho : v.1.val.1.2.1 = false := by
    apply Bool.eq_false_iff.mpr
    intro hc
    rcases v.1.property.1.unmarked_closed hm0 hc with hd | hi
    · rcases hd with hR | hstop
      · have hle := (augAdvance_mem cfg ε M (augTimedInput cfg v.1.val.1.1.1)
          v.1.val.1.1.1.property.1.1 (WinnerMarkLaw.firstMarkedRace hn v.2).1.1).2.trans
            (augGuardTime_le_remaining cfg ε M _ v.1.val.1.1.1.property.2.1)
        exact (not_le_of_gt ht) (hta.trans (hle.trans hR))
      · exact hactive (Or.inl hstop)
    · exact hactive (Or.inr hi)
  refine ⟨ho,?_⟩
  rw [actualLineSectionMass_selected] at hmass
  exact (selectedLineSectionTime_lt_of_mass_gt cfg L p E A _ t ht hmass).trans_le hta

theorem markedSectionExceededAt_post {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (ω : BoardClockPath n) (k : ℕ)
    (hs : MarkedSectionMassSupport cfg L p E A
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1.val)
    (hh : markedSectionExceededAt cfg ε M start L p E A hn k (s,ω)) :
    (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s (k+1) ω).1.val.2 = true ∧
      A ≤ actualLineSectionMass L p E
        (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s (k+1) ω).1.val.1.2.2 := by
  rcases hh.2 with hm | hc
  · have hmass := (hs hm).resolve_right hh.1
    have he := goodMarkedIterate_permanent cfg ε M start L p E A hn s ω k hm (k+1) (Nat.le_succ k)
    exact ⟨he.1,he.2.symm ▸ hmass⟩
  · exact markedSectionContactAt_post cfg ε M start L p E A hn s k ω hc

def markedSectionExceededCaptured {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : GoodMarkedLineSection cfg p × BoardClockPath n) : Prop :=
  MarkedSectionMassSupport cfg L p E A x.1.val →
    (∃ k, markedSectionExceededAt cfg ε M start L p E A hn k x) →
      (markedSectionTerminalPair cfg ε M start L p E A hn x).1.val.2 = true ∧
        A ≤ actualLineSectionMass L p E (markedSectionTerminalPair cfg ε M start L p E A hn x).1.val.1.2.2

theorem markedSectionExceededCaptured_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) :
    Measurable (markedSectionExceededCaptured cfg ε M start L p E A hn) := by
  have ht := (markedSectionTerminalPair_measurable cfg ε M start L p E A hn).fst.subtype_val
  exact ((markedSectionMassSupport_measurable cfg L p E A).comp measurable_fst.subtype_val).imp
    ((Measurable.exists (markedSectionExceededAt_measurable cfg ε M start L p E A hn)).imp
      ((ht.snd.eq_const true).and (measurable_const.le'
        ((actualLineSectionMass_measurable L p E).comp ht.fst.snd.snd))))

theorem markedSectionExceededCaptured_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : GoodMarkedLineSection cfg p) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), markedSectionExceededCaptured cfg ε M start L p E A hn (s,ω) := by
  filter_upwards [markedSectionIterate_all_candidateRegular_ae cfg ε M start L p E A hn
    (cfg.B/n) (div_pos hB (by exact_mod_cast hn)) s,
    markedSectionTerminalPair_stable_ae cfg ε M start L p E A hn hB s] with ω hr hstable
  intro hs hh
  obtain ⟨k,hk⟩ := hh
  have hp := markedSectionExceededAt_post cfg ε M start L p E A hn s ω k
    (goodMarkedIterate_massSupport cfg ε M start L p E A hn s hs ω hr k) hk
  obtain ⟨j,hj,hj'⟩ := (hstable.and (eventually_ge_atTop (k+1))).exists
  have he := goodMarkedIterate_permanent cfg ε M start L p E A hn s ω (k+1) hp.1 j hj'
  rw [hj] at he
  exact ⟨he.1,he.2.symm ▸ hp.2⟩

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.markedSectionExceededAt_of_strict_mass
#print axioms NoThreeLine.BirthWitness.markedSectionExceededCaptured_measurable
#print axioms NoThreeLine.BirthWitness.markedSectionExceededCaptured_ae
