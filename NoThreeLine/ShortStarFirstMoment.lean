import NoThreeLine.ShortStarMaskedPower

/-! At degree one the distinct-line and all four exception conditions are
vacuous. The actual intensity therefore has the unit-price first moment,
without invoking the coarse high-degree exception envelope. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

theorem singleton_mainTuple_eq {n : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin 1→↥(shortStars Γ p H)) (R : ℝ) (a : WitnessState n) :
    mainTupleObservable f R a=tuplePhysicalProduct f a := by
  classical
  have he : TupleMainEvent f R a.augmented.physical.process ↔
      p∈a.augmented.physical.process.activeEvents ∧
      (f 0).val.1∈a.augmented.physical.process.activeEvents ∧
      (f 0).val.2∈a.augmented.physical.process.selected := by
    simp [TupleMainEvent,NoSpecifiedCrossPairs,NoLongLeafPairException,
      NoExtraSelectedException,NoThirdWitnessException]
  unfold mainTupleObservable
  by_cases hp : p∈a.augmented.physical.process.activeEvents
  · by_cases hq : (f 0).val.1∈a.augmented.physical.process.activeEvents
    · by_cases hz : (f 0).val.2∈a.augmented.physical.process.selected
      · rw [if_pos (he.mpr ⟨hp,hq,hz⟩)]
      · simp [he,hp,hq,hz,tuplePhysicalProduct]
    · have hz : activeLeafWeight (f 0).val.1 a=0 := if_neg hq
      simp [he,hp,hq,tuplePhysicalProduct,hz]
  · simp [he,hp,tuplePhysicalProduct]

theorem weightedMain_one_eq_intensity {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H R : ℝ) (w : ↥(shortStars Γ p H)→ℝ) (a : WitnessState n) :
    weightedMainTupleSum Γ p H R 1 w a=weightedStarIntensity Γ p H w a := by
  classical
  have hD : rootDistinctTuples Γ p H 1=Finset.univ := by
    ext f
    simp [RootLinePairwise]
  calc
    _ = weightedPhysicalTupleSum Γ p H 1 w a := by
      unfold weightedMainTupleSum weightedPhysicalTupleSum
      rw [hD]
      simp_rw [singleton_mainTuple_eq]
    _ = _ := by simpa using weighted_tuple_sum_eq_power Γ p H 1 (by omega) w a

attribute [local irreducible] weightedStarIntensity scheduledCutWitness

theorem initial_scheduledCutPoint_intensity_firstMoment {n : ℕ} {B : ℝ}
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (w : ↥(shortStars Γ p H)→ℝ)
    (hw : ∀s,0≤w s) (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (N : ℕ) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (cs N).horizon) :
    (∫ω,weightedStarIntensity Γ p H w
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t)≤
      weightedCutStarPriceSum Γ p H w cs N t/(1-ε)^3 := by
  simpa only [weightedMain_one_eq_intensity,pow_one,show (2*1+1).choose 2=3 by decide] using
    initial_scheduledCutPoint_weightedMain_bound 1 0 w hw cs ε M deadline start hn hB hΓ hK
      hε0 hε N t ht

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.singleton_mainTuple_eq
#print axioms NoThreeLine.ShortStars.weightedMain_one_eq_intensity
#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_intensity_firstMoment
