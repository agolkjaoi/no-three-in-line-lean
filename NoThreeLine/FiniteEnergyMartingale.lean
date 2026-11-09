import NoThreeLine.GenericCreditMartingale
import NoThreeLine.SavedCreditHistory

/-! An optional (next-history measurable) energy compensator. The energy
need not be predictable. The application must supply the actual martingale
and the history-set identity for its squared increments. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem finiteEnergyMartingale {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ]
    (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (M V : ℕ→Ω→ℝ) (hM : Martingale M F μ)
    (hV : ∀k,@Measurable Ω ℝ (F (k+1)) inferInstance (V k))
    (b c : ℕ→ℝ) (hb : ∀k ω,‖M k ω‖≤b k) (hc : ∀k ω,‖V k ω‖≤c k)
    (henergy : ∀k A,MeasurableSet[F k] A→
      (∫ω in A,(M (k+1) ω-M k ω)^2 ∂μ)=∫ω in A,V k ω ∂μ) :
    Martingale (fun k ω=>(M k ω)^2-∑j∈Finset.range k,V j ω) F μ := by
  have hm (k : ℕ) : Measurable (M k) :=
    (hM.stronglyMeasurable k).measurable.mono (F.le k) le_rfl
  have hv (k : ℕ) : Measurable (V k) := (hV k).mono (F.le (k+1)) le_rfl
  have hiV (k : ℕ) : Integrable (V k) μ :=
    Integrable.of_bound (hv k).aestronglyMeasurable (c k) (ae_of_all _ (hc k))
  have hip (i j : ℕ) : Integrable (fun ω=>M i ω*M j ω) μ := by
    apply Integrable.of_bound ((hm i).mul (hm j)).aestronglyMeasurable (|b i| * |b j|)
    exact ae_of_all _ (fun ω=>by
      change ‖M i ω*M j ω‖≤_
      rw [norm_mul]
      exact mul_le_mul ((hb i ω).trans (le_abs_self _))
        ((hb j ω).trans (le_abs_self _)) (norm_nonneg _) (abs_nonneg _))
  have hiSq (k : ℕ) : Integrable (fun ω=>(M k ω)^2) μ := by
    simpa only [pow_two] using hip k k
  have hiSum (k : ℕ) : Integrable (fun ω=>∑j∈Finset.range k,V j ω) μ :=
    integrable_finsetSum _ (fun j _=>hiV j)
  have hcross (k : ℕ) (A : Set Ω) (hA : MeasurableSet[F k] A) :
      (∫ω in A,M (k+1) ω*M k ω ∂μ)=∫ω in A,(M k ω)^2 ∂μ := by
    have hp : Integrable (M (k+1)*M k) μ := hip (k+1) k
    have hce := condExp_mul_of_stronglyMeasurable_right (hM.stronglyMeasurable k) hp
      (hM.integrable (k+1))
    calc
      _ = ∫ω in A,condExp (F k) μ (M (k+1)*M k) ω ∂μ :=
        (setIntegral_condExp (F.le k) hp hA).symm
      _ = _ := by
        apply setIntegral_congr_ae (F.le k _ hA)
        filter_upwards [hce,hM.condExp_ae_eq (Nat.le_succ k)] with ω h1 h2 _
        simpa only [Pi.mul_apply,h2,pow_two] using h1
  have hsq (k : ℕ) (A : Set Ω) (hA : MeasurableSet[F k] A) :
      (∫ω in A,(M (k+1) ω)^2 ∂μ)=
        (∫ω in A,(M k ω)^2 ∂μ)+∫ω in A,V k ω ∂μ := by
    have he := henergy k A hA
    have halg : (fun ω=>(M (k+1) ω-M k ω)^2)=
        fun ω=>(M (k+1) ω)^2-2*(M (k+1) ω*M k ω)+(M k ω)^2 := by
      funext ω; ring
    have hiD : Integrable (fun ω=>(M (k+1) ω)^2-2*(M (k+1) ω*M k ω)) μ :=
      (hiSq (k+1)).sub ((hip (k+1) k).const_mul 2)
    rw [halg,integral_add hiD.integrableOn
      (hiSq k).integrableOn,integral_sub (hiSq (k+1)).integrableOn
      ((hip (k+1) k).const_mul 2).integrableOn,integral_const_mul,hcross k A hA] at he
    linarith
  have hadp : StronglyAdapted F (fun k ω=>(M k ω)^2-∑j∈Finset.range k,V j ω) := by
    intro k
    apply Measurable.stronglyMeasurable
    apply ((hM.stronglyMeasurable k).measurable.pow_const 2).sub
    apply Finset.measurable_sum
    intro j hj
    exact (hV j).mono (F.mono (Nat.succ_le_of_lt (Finset.mem_range.mp hj))) le_rfl
  have hi (k : ℕ) : Integrable (fun ω=>(M k ω)^2-∑j∈Finset.range k,V j ω) μ :=
    (hiSq k).sub (hiSum k)
  apply martingale_of_setIntegral_eq_succ hadp hi
  intro k A hA
  have hiSV : Integrable (fun ω=>(∑j∈Finset.range k,V j ω)+V k ω) μ :=
    (hiSum k).add (hiV k)
  simp_rw [Finset.sum_range_succ]
  rw [integral_sub (hiSq k).integrableOn (hiSum k).integrableOn,
    integral_sub (hiSq (k+1)).integrableOn hiSV.integrableOn,
    integral_add (hiSum k).integrableOn (hiV k).integrableOn,hsq k A hA]
  ring

end NoThreeLine
#print axioms NoThreeLine.finiteEnergyMartingale
