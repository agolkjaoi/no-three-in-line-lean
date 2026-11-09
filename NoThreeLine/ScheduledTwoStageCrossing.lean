import NoThreeLine.ScheduledRestartCrossingPath

/-! A single probability bound for the actual zero- and one-occupancy
crossings over the entire original schedule. Only the two stage
probabilities are added. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem scheduledProtected_twoStage_crossing_le {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (J : ℕ) (hKcfg : ∀i,(cs i).K≤K) (hK : K<2) (hsp : ∀i,specified (cs i).directions L)
    (s : ProtectedPhaseState n B) (ho : occupancy s.1.val.physical.process L=0)
    (hk : s.1.val.physical.clocks L≤K) :
    let E₀ := scheduledProtectedExceedance cs ε M deadline start L 0 E A hn b J s
    let E₁ := scheduledProtectedExceedance cs ε M deadline start L 1 E A hn b J s
    (boardClockMeasure n (B/n)).real (E₀∪E₁)≤
      (scheduledLineForbiddenLaw cs ε M K deadline start hn L 0 s.1 J).real E₀+
        (scheduledLineRestartLaw cs ε M K deadline start L hn J s).real E₁ := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact (measureReal_union_le (μ:=μ) _ _).trans (add_le_add
    (scheduledLineForbiddenLaw_protected_firstCrossing_ge cs ε M K deadline start L 0 E A hA hn hB
      b J hKcfg hK hsp (by omega) s ho hk)
    (scheduledLineRestartLaw_original_stageOne_crossing_ge cs ε M K deadline start L E A hA p hn hB
      b J hKcfg hK hsp s ho))

end NoThreeLine

#print axioms NoThreeLine.scheduledProtected_twoStage_crossing_le

