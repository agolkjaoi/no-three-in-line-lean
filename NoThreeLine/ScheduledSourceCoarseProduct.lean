import NoThreeLine.ScheduledSourceCoarse

/-! Exact phase-product increments dominate the actual expected source.
The resulting finite telescoping estimate retains the original coarse
price in every phase and makes no separation assumption on the labels. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines FiniteSourceHierarchy

theorem initial_scheduledSource_coarse_product_difference {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCD : Disjoint C D) (hCDL : C∪D⊆L) (j : ℕ) :
    (∫ω,scheduledSourceIncrement cs ε M deadline start e C D L hn
      (initialGoodPhaseObservation B hB deadline start) j ω ∂boardClockMeasure n (B/n))≤
        (∏q∈D,accumulatedPhaseCoarsePrice cs start e (j+1) q)-
          (∏q∈D,accumulatedPhaseCoarsePrice cs start e j q) := by
  classical
  let s := initialGoodPhaseObservation B hB deadline start
  let β := phaseCoarseCoefficient (cs j).config (phaseEndpoint cs start j) e
  let c := accumulatedPhaseCoarsePrice cs start e j
  let μ := goodPhaseStateLaw cs ε M deadline start hn s j
  have hB0 : 0<B := lt_of_lt_of_le zero_lt_one hB
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB0 s j
  have hβ (q) : IntervalIntegrable (β q) volume 0 (cs j).horizon :=
    phaseCoarseCoefficient_intervalIntegrable (cs j).config _ e (cs j).mask_le_one q _ _
  have hi : IntervalIntegrable (fun t=>∑q∈D,β q t*
      scheduledCutMean cs ε M deadline start e (insert q C) (D.erase q) L hn s j t) volume 0 (cs j).horizon := by
    simp only [scheduledCutMean_eq_kernel cs ε M deadline start e _ _ L hn hB0 s j]
    simpa only [Finset.sum_fn] using IntervalIntegrable.sum D (fun q _=>phaseKernelCoarseHierarchyTerm_intervalIntegrable (cs j).config ε M (phaseEndpoint cs start j) e
      (insert q C) (D.erase q) L hn hB0 μ (cs j).mask_le_one q _ _)
  have hj : IntervalIntegrable (fun t=>∑q∈D,β q t*(∏r∈D.erase q,shiftedPrimitive c β 0 r t))
      volume 0 (cs j).horizon := by
    simpa only [Finset.sum_fn] using IntervalIntegrable.sum D (fun q hq=>shiftedPrimitive_product_term_integrable D c β 0 (cs j).horizon (fun r _=>hβ r) q hq)
  have hle : (∫t in (0:ℝ)..(cs j).horizon,∑q∈D,β q t*
      scheduledCutMean cs ε M deadline start e (insert q C) (D.erase q) L hn s j t)≤
      ∫t in (0:ℝ)..(cs j).horizon,∑q∈D,β q t*(∏r∈D.erase q,shiftedPrimitive c β 0 r t) := by
    apply intervalIntegral.integral_mono_on (cs j).horizon.coe_nonneg hi hj
    intro t ht
    apply Finset.sum_le_sum
    intro q hq
    apply mul_le_mul_of_nonneg_left _ (phaseCoarseCoefficient_bounds (cs j).config _ e (cs j).mask_le_one q t).1
    have hd : Disjoint (insert q C) (D.erase q) :=
      Finset.disjoint_insert_left.mpr ⟨by simp,hCD.mono_right (Finset.erase_subset q D)⟩
    have hs : insert q C∪D.erase q=C∪D := by
      ext r
      simp only [Finset.mem_union,Finset.mem_insert,Finset.mem_erase]
      constructor
      · rintro ((rfl | hrC) | ⟨_,hrD⟩)
        · exact Or.inr hq
        · exact Or.inl hrC
        · exact Or.inr hrD
      · rintro (hrC | hrD)
        · exact Or.inl (Or.inr hrC)
        · by_cases hrq : r=q
          · exact Or.inl (Or.inl hrq)
          · exact Or.inr ⟨hrq,hrD⟩
    simpa only [shiftedPrimitive,primitive,c,β] using
      initial_scheduledCut_coarse_product cs ε M deadline start Γ e (insert q C) (D.erase q) L hn hB hΓ hK
        hd (by simpa only [hs] using hCDL) j t ht
  have hid := shiftedPrimitive_product_identity D c β 0 (cs j).horizon (fun q _=>hβ q)
  have he : (∫t in (0:ℝ)..(cs j).horizon,∑q∈D,β q t*(∏r∈D.erase q,shiftedPrimitive c β 0 r t))=
      (∏q∈D,accumulatedPhaseCoarsePrice cs start e (j+1) q)-(∏q∈D,c q) := by
    rw [hid]
    congr 1
    apply Finset.prod_congr rfl
    intro q _
    exact (accumulatedPhaseCoarsePrice_succ cs start e j q).symm
  exact (scheduledSourceIncrement_mean_le_coarse cs ε M deadline start e C D L hn hB0 s j (hK j)).trans (hle.trans_eq he)

theorem initial_cumulativeSource_coarse_product_difference {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCD : Disjoint C D) (hCDL : C∪D⊆L) (k : ℕ) :
    (∫ω,cumulativeScheduledSource cs ε M deadline start e C D L hn
      (initialGoodPhaseObservation B hB deadline start) k ω ∂boardClockMeasure n (B/n))≤
        (∏q∈D,accumulatedPhaseCoarsePrice cs start e k q)-(∏q∈D,(0:ℝ)) := by
  have hB0 : 0<B := lt_of_lt_of_le zero_lt_one hB
  unfold cumulativeScheduledSource
  rw [integral_finsetSum _ (fun j _=>scheduledSourceIncrement_integrable cs ε M deadline start e C D L hn hB0 _ j (hK j))]
  apply (Finset.sum_le_sum (fun j _=>initial_scheduledSource_coarse_product_difference cs ε M deadline start Γ e C D L
    hn hB hΓ hK hCD hCDL j)).trans_eq
  have ht (m : ℕ) : (∑j∈Finset.range m,((∏q∈D,accumulatedPhaseCoarsePrice cs start e (j+1) q)-
      (∏q∈D,accumulatedPhaseCoarsePrice cs start e j q)))=
      (∏q∈D,accumulatedPhaseCoarsePrice cs start e m q)-(∏q∈D,(0:ℝ)) := by
    induction m with
    | zero => simp [accumulatedPhaseCoarsePrice]
    | succ m ih => rw [Finset.sum_range_succ,ih]; ring
  exact ht k

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_scheduledSource_coarse_product_difference
#print axioms NoThreeLine.BirthWitness.initial_cumulativeSource_coarse_product_difference
