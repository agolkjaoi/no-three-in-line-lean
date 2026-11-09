import NoThreeLine.ScheduledLineRestartInitial
import NoThreeLine.ScheduledRestartEventSections

/-! Separate the thresholds of the two occupancy stages. When stage zero
has never crossed the lower threshold, the actual stage-one exit lies in
the corresponding low-credit part of the restart mixture. -/
set_option autoImplicit false
set_option maxHeartbeats 2400000
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

def scheduledRestartEntryTotal {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ) (a : ℕ×ProtectedPhaseState n B) : ℝ :=
  protectedStateTotal (cs a.1).config L E A (unpackProtectedTimed (cs a.1).config a.2)

theorem scheduledRestartEntryTotal_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Measurable A) :
    Measurable (scheduledRestartEntryTotal cs L E A) :=
  measurable_from_prod_countable_right (fun j=>
    (protectedStateTotal_measurable (cs j).config L E A hA).comp
      (unpackProtectedTimed_measurable (cs j).config))

def scheduledRestartGoodCrossingFlag {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (lo hi : ℝ) (J : ℕ)
    (x : (ℕ×ProtectedPhaseState n B)×BoardClockPath n) : Bool :=
  if x.1.1<J ∧ scheduledRestartEntryTotal cs L E A x.1≤lo then
    (scheduledCrossingRemainderPair cs ε M deadline start L 1 E A hn hi J x).1.2
  else false

theorem scheduledRestartGoodCrossingFlag_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (lo hi : ℝ) (J : ℕ) :
    Measurable (scheduledRestartGoodCrossingFlag cs ε M deadline start L E A hn lo hi J) :=
  Measurable.ite (((measurable_of_countable (fun j : ℕ=>j<J)).comp measurable_fst.fst).and
    (((scheduledRestartEntryTotal_measurable cs L E A hA.measurable).comp measurable_fst).le'
      measurable_const)).setOf
    (scheduledCrossingRemainderPair_measurable cs ε M deadline start L 1 E A hA hn hi J).fst.snd
    measurable_const

def scheduledRestartGoodCrossing {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (lo hi : ℝ) (J : ℕ)
    (s : ProtectedPhaseState n B) : Set (BoardClockPath n) :=
  {ω | scheduledRestartGoodCrossingFlag cs ε M deadline start L E A hn lo hi J
    (scheduledLineExitIterate cs ε M deadline start L 0 hn J s J ω)=true}

theorem scheduledRestartGoodCrossing_original_le_restart {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (hB : 0<B)
    (lo hi : ℝ) (J : ℕ) (hKcfg : ∀j,(cs j).K≤K) (hK : K<2)
    (hsp : ∀j,specified (cs j).directions L) (s : ProtectedPhaseState n B) :
    (boardClockMeasure n (B/n)).real
      (scheduledRestartGoodCrossing cs ε M deadline start L E A hn lo hi J s)≤
    (scheduledLineRestartLaw cs ε M K deadline start L hn J s).real
      (scheduledRestartGoodCrossing cs ε M deadline start L E A hn lo hi J s) := by
  let μ := boardClockMeasure n (B/n)
  let H := scheduledRestartGoodCrossingFlag cs ε M deadline start L E A hn lo hi J
  let R := scheduledCrossingRemainderPair cs ε M deadline start L 1 E A hn hi J
  let Q := fun a=>savedCreditMeasure μ (fun w=>scheduledRemainderDensity cs ε M K deadline start L 1 hn J (a,w))
  have hsec (a : ℕ×ProtectedPhaseState n B) : μ.real {w | H (a,w)=true}≤(Q a).real {w | H (a,w)=true} := by
    by_cases ha : a.1<J ∧ scheduledRestartEntryTotal cs L E A a≤lo
    · change μ.real {w | (if a.1<J ∧ scheduledRestartEntryTotal cs L E A a≤lo then (R (a,w)).1.2 else false)=true}≤_
      simp only [H,scheduledRestartGoodCrossingFlag,if_pos ha]
      exact scheduledRemainderLaw_crossing_ge cs ε M K deadline start L 1 E A hA hn hB hi J
        hKcfg hK hsp (by omega) a
    · simp only [H,scheduledRestartGoodCrossingFlag,if_neg ha,Bool.false_eq_true,Set.setOf_false,
        measureReal_empty,le_refl]
  have h := scheduledRestartEvent_real_sections cs ε M K hK deadline start L hn hB J s H
    (scheduledRestartGoodCrossingFlag_measurable cs ε M deadline start L E A hA hn lo hi J)
  unfold scheduledRestartGoodCrossing
  rw [h.1,h.2.1]
  exact integral_mono h.2.2.1 h.2.2.2 hsec

theorem scheduledProtected_twoStage_shifted_crossing_le {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (hE : E⊆L.val)
    (A : ℝ→ℝ) (hA : Continuous A) (hAm : Monotone A) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0<B) (lo hi : ℝ) (J : ℕ) (Γ : Finset ZPoint)
    (hΓ : ∀j,(cs j).directions=Γ) (hKcfg : ∀j,(cs j).K≤K) (hK : K<2)
    (hsp : ∀j,specified (cs j).directions L) (s : ProtectedPhaseState n B)
    (ho : occupancy s.1.val.physical.process L=0) (hk : s.1.val.physical.clocks L≤K)
    (hsv : ∀q∈L.val,0≤s.2.1 q ∧ s.2.1 q≤2*B) (hs : s.1.val.AuxReady Γ ε M) :
    let E₀ := scheduledProtectedExceedance cs ε M deadline start L 0 E A hn lo J s
    let E₁ := scheduledProtectedExceedance cs ε M deadline start L 1 E A hn hi J s
    let G := scheduledRestartGoodCrossing cs ε M deadline start L E A hn lo hi J s
    (boardClockMeasure n (B/n)).real (E₀∪E₁)≤
      (scheduledLineForbiddenLaw cs ε M K deadline start hn L 0 s.1 J).real E₀+
      (scheduledLineRestartLaw cs ε M K deadline start L hn J s).real G := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let E₀ := scheduledProtectedExceedance cs ε M deadline start L 0 E A hn lo J s
  let E₁ := scheduledProtectedExceedance cs ε M deadline start L 1 E A hn hi J s
  let G := scheduledRestartGoodCrossing cs ε M deadline start L E A hn lo hi J s
  have hsub : ∀ᵐω∂μ,ω∈E₀∪E₁ → ω∈E₀∪G := by
    filter_upwards [scheduledRestartProtectedExceedance_ae_eq_original cs ε M deadline start L
      E A p hn hB hi J s ho] with ω hω
    intro h
    by_cases h0 : ω∈E₀
    · exact Or.inl h0
    · have h1 : ω∈E₁ := h.resolve_left h0
      let r := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J ω
      let R := scheduledCrossingRemainderPair cs ε M deadline start L 1 E A hn hi J
      have hR : (R r).1.2=true := hω.mpr h1
      have hj : r.1.1<J := by
        by_contra hn'
        simp only [R,scheduledCrossingRemainderPair,if_neg hn',Bool.false_eq_true] at hR
      have hinit := scheduledLineExit_stageOne_initial cs ε M K deadline start L E hE A hAm
        p hpL hn J s Γ hΓ hKcfg hsp ho hk hsv hs lo ω hj
      have hl : scheduledRestartEntryTotal cs L E A r.1≤lo := hinit.2.2.2.2 h0
      right
      change scheduledRestartGoodCrossingFlag cs ε M deadline start L E A hn lo hi J r=true
      simpa only [scheduledRestartGoodCrossingFlag,if_pos (show r.1.1<J ∧
        scheduledRestartEntryTotal cs L E A r.1≤lo from ⟨hj,hl⟩)] using hR
  have hmeasure : μ.real (E₀∪E₁)≤μ.real (E₀∪G) :=
    ENNReal.toReal_mono (measure_ne_top μ _) (measure_mono_ae hsub)
  calc
    _ ≤ μ.real (E₀∪G) := hmeasure
    _ ≤ μ.real E₀+μ.real G := measureReal_union_le _ _
    _ ≤ _ := add_le_add
      (scheduledLineForbiddenLaw_protected_firstCrossing_ge cs ε M K deadline start L 0 E A hA hn hB
        lo J hKcfg hK hsp (by omega) s ho hk)
      (scheduledRestartGoodCrossing_original_le_restart cs ε M K deadline start L E A hA hn hB
        lo hi J hKcfg hK hsp s)

end NoThreeLine

#print axioms NoThreeLine.scheduledRestartGoodCrossing_original_le_restart
#print axioms NoThreeLine.scheduledProtected_twoStage_shifted_crossing_le

