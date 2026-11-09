import NoThreeLine.WitnessCandidateMean
import NoThreeLine.WitnessSourceBound

/-! Measurability and finite domination of the actual mixed observable.
The cap here is only an integrability bound; it does not change the S7
source coefficients or the quantitative estimates of the manuscript. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct EtaMixedGenerator

theorem WitnessState.measurable_augmented (n : ℕ) : Measurable (@WitnessState.augmented n) :=
  (comap_measurable (fun a : WitnessState n=>(a.augmented,a.retained))).fst

theorem WitnessState.measurable_retained (n : ℕ) : Measurable (@WitnessState.retained n) :=
  (comap_measurable (fun a : WitnessState n=>(a.augmented,a.retained))).snd

theorem activeEvents_measurable (n : ℕ) : Measurable (@ProcessState.activeEvents n) := by
  apply measurable_finset_iff.mpr
  intro p
  simp only [ProcessState.mem_activeEvents]
  exact (CreditAccount.measurable_status.comp (ProcessState.measurable_account n p)).eq_const .active

theorem lineConnection_measurable {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n))
    (L : LineIndex n) : Measurable (fun e : ExtendedState n=>lineConnection Γ C e L) := by
  unfold lineConnection
  split_ifs
  · exact (((measurable_const.sub ((measurable_of_countable (fun k : ℕ=>(k:ℝ))).comp
      (ExtendedState.measurable_occupancy n L))).div
      (measurable_const.sub ((measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)))).inv).pow_const _
  · exact ((measurable_pi_apply L).comp (ExtendedState.measurable_lineCredits n)).pow_const _

theorem phi_measurable {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n)) :
    Measurable (phi Γ C : ExtendedState n→ℝ) := by
  unfold phi rootWeightProduct connectionProduct
  apply Measurable.ite
  · exact ((measurable_of_countable (fun S : Finset (Grid n)=>C⊆S)).comp
      ((activeEvents_measurable n).comp (ExtendedState.measurable_process n))).setOf
  · exact (Finset.measurable_prod C (fun p _=>CreditAccount.measurable_weight.comp
      ((ProcessState.measurable_account n p).comp (ExtendedState.measurable_process n)))).mul
        (Finset.measurable_prod Finset.univ (fun L _=>lineConnection_measurable Γ C L))
  · exact measurable_const

theorem etaProduct_measurable {n : ℕ} (L : Finset (Grid n)) :
    Measurable (etaProduct L : EtaCoordinates n→ℝ) := by
  apply Finset.measurable_prod
  intro p _
  exact (measurable_pi_apply p.2).comp (measurable_pi_apply p.1)

theorem mixed_measurable {n : ℕ} (Γ : Finset ZPoint) (C D L : Finset (Grid n)) :
    Measurable (mixed Γ C D L : WitnessState n→ℝ) := by
  exact (Finset.measurable_prod D (fun p _=>(measurable_pi_apply p).comp
    (WitnessState.measurable_retained n))).mul
      (((etaProduct_measurable L).comp ((AugmentedState.measurable_eta n).comp
        (WitnessState.measurable_augmented n))).mul
        ((phi_measurable Γ C).comp ((AugmentedState.measurable_physical n).comp
          (WitnessState.measurable_augmented n))))

theorem sourcePrice_measurable {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) : Measurable (fun e : ExtendedState n=>sourcePrice e Γ C q) := by
  apply Finset.measurable_prod
  intro K _
  unfold sourcePriceLine
  split_ifs
  · exact measurable_const.div (measurable_const.sub
      ((measurable_pi_apply K).comp (ExtendedState.measurable_clocks n)))
  · exact measurable_const

def mixedCap {n : ℕ} (C : Finset (Grid n)) (B : ℝ) : ℝ :=
  (max 1 B)^C.card * ∏K : LineIndex n,(2:ℝ)^(MixedConnection.multiplicity C K-1)

theorem mixedCap_nonneg {n : ℕ} (C : Finset (Grid n)) (B : ℝ) : 0≤mixedCap C B := by
  exact mul_nonneg (pow_nonneg (le_trans (by norm_num) (le_max_left _ _)) _)
    (Finset.prod_nonneg (fun _ _=>pow_nonneg (by norm_num) _))

theorem lineConnection_le {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (B : ℝ) (he : e.Valid B) (hC : C⊆e.process.activeEvents)
    (K : LineIndex n) : lineConnection Γ C e K≤(2:ℝ)^(MixedConnection.multiplicity C K-1) := by
  unfold lineConnection
  split_ifs with hsp
  · by_cases hm : MixedConnection.multiplicity C K≤1
    · simp [Nat.sub_eq_zero_of_le hm]
    · have hpos : 0<MixedConnection.multiplicity C K := by omega
      obtain ⟨p,hp⟩ := Finset.card_pos.mp hpos
      obtain ⟨hpC,hpK⟩ := Finset.mem_inter.mp hp
      have hN := active_line_occupancy_le_one e.process p he.1 (hC hpC) K hpK
      have hNr : (occupancy e.process K:ℝ)≤1 := by exact_mod_cast hN
      have hk := he.2.1.2.1 K
      change 0≤e.clocks K ∧ e.clocks K≤2 at hk
      rw [protection,inv_div]
      apply pow_le_pow_left₀ (div_nonneg (by linarith) (by linarith))
      apply (div_le_iff₀ (by linarith : 0<2-(occupancy e.process K:ℝ))).mpr
      linarith
  · exact pow_le_pow_left₀ (he.2.1.2.2 K).1 ((he.2.1.2.2 K).2.trans (by norm_num : (1:ℝ)≤2)) _

theorem phi_le_cap {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (B : ℝ) (he : e.Valid B) : phi Γ C e≤mixedCap C B := by
  unfold phi
  split_ifs with hC
  · apply mul_le_mul
    · unfold rootWeightProduct
      calc
        _ ≤ ∏_p∈C,max 1 B := Finset.prod_le_prod
          (fun p _=>(he.2.1.1 p).1) (fun p _=>(he.2.1.1 p).2.trans (le_max_right _ _))
        _ = _ := by simp
    · exact Finset.prod_le_prod (fun K _=>lineConnection_nonneg e Γ C B he hC K)
        (fun K _=>lineConnection_le e Γ C B he hC K)
    · exact Finset.prod_nonneg (fun K _=>lineConnection_nonneg e Γ C B he hC K)
    · exact pow_nonneg (le_trans (by norm_num) (le_max_left _ _)) _
  · exact mixedCap_nonneg C B

theorem mixed_le_cap {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (B : ℝ) (ha : a.Valid B) : mixed Γ C D L a≤mixedCap C B := by
  have hw0 : 0≤witnessProduct D a := witnessProduct_nonneg a D B ha
  have hw1 : witnessProduct D a≤1 := Finset.prod_le_one
    (fun p _=>(ha.2.1 p).1) (fun p _=>(ha.2.1 p).2)
  have hη0 := etaProduct_nonneg L a.augmented.eta (fun p q=>(ha.1.2 p q).1)
  have hη1 : etaProduct L a.augmented.eta≤1 := Finset.prod_le_one
    (fun p _=>(ha.1.2 p.1 p.2).1) (fun p _=>(ha.1.2 p.1 p.2).2)
  unfold mixed correctedPhi
  calc
    _ ≤ 1*(1*phi Γ C a.augmented.physical) := mul_le_mul hw1
      (mul_le_mul_of_nonneg_right hη1 (phi_nonneg _ Γ C B ha.1.1))
      (mul_nonneg hη0 (phi_nonneg _ Γ C B ha.1.1)) (by norm_num)
    _ ≤ _ := by simpa using phi_le_cap a.augmented.physical Γ C B ha.1.1

theorem mixed_integrable {n : ℕ} {X : Type*} [MeasurableSpace X]
    (μ : Measure X) [IsFiniteMeasure μ] (a : X→WitnessState n) (ha : Measurable a)
    (Γ : Finset ZPoint) (C D L : Finset (Grid n)) (B : ℝ) (hv : ∀x,(a x).Valid B) :
    Integrable (fun x=>mixed Γ C D L (a x)) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _ ((mixed_measurable Γ C D L).comp ha)
    (mixedCap C B) (fun x=>⟨mixed_nonneg (a x) Γ C D L B (hv x),mixed_le_cap (a x) Γ C D L B (hv x)⟩)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.mixed_measurable
#print axioms NoThreeLine.BirthWitness.mixed_le_cap
#print axioms NoThreeLine.BirthWitness.mixed_integrable
