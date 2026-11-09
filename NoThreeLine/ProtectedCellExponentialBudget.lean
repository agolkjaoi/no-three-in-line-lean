import NoThreeLine.ProtectedCellLargeNBudget

/-! The optimized credit and entropy exponentials share one decay
scale with constants depending only on the fixed budgets. -/
set_option autoImplicit false
set_option maxHeartbeats 2400000
noncomputable section
namespace NoThreeLine
open FiniteWitnessMoments

def protectedCellCreditVarianceBudget (n : ℕ) (C D d γ : ℝ) : ℝ :=
  D*(n:ℝ)^γ*(3*protectedCellEntropyBudget n C d)/(1-Real.log 2)

def protectedCellEntropyVarianceBudget (n : ℕ) (C D d γ : ℝ) : ℝ :=
  (D*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*
    (3*protectedCellEntropyBudget n C d)/(1-Real.log 2)

theorem protectedCellVarianceBudgets_pos {n : ℕ} (hn : 2≤n) (C D d γ : ℝ)
    (hC : 0<C) (hD : 0<D) (hd : 0≤d) :
    0<protectedCellCreditVarianceBudget n C D d γ ∧
    0<protectedCellEntropyVarianceBudget n C D d γ := by
  have hℓ := entropyLogConstant_pos d hd
  have hl := log_nat_pos hn
  have hα := protectedEntropyCost_margin.1
  have hnR : (0:ℝ)<n := by exact_mod_cast (show 0<n by omega)
  have hp := Real.rpow_pos_of_pos hnR γ
  unfold protectedCellCreditVarianceBudget protectedCellEntropyVarianceBudget protectedCellEntropyBudget
  constructor <;> positivity

theorem exists_protectedCellExponential_budget (C D d γ g r : ℝ)
    (hC : 0<C) (hD : 0<D) (hd : 0≤d) (hγ : γ<1) (hg : 0<g) (hr : 0<r) :
    ∃n0 : ℕ,2≤n0 ∧ ∀ n≥n0,
      Real.exp (-(((g/2)*n)^2/(2*protectedCellCreditVarianceBudget n C D d γ)))+
        Real.exp (-((protectedCellEntropyBudget n C d)^2/(2*protectedCellEntropyVarianceBudget n C D d γ)))
        ≤2*(n:ℝ)^(-r) := by
  let α := 1-Real.log 2
  let L := entropyLogConstant d
  let aC := α*(g/2)^2/(6*D*L*C)
  let aH := α*C/(6*D*L)
  have hα : 0<α := protectedEntropyCost_margin.1
  have hL : 0<L := entropyLogConstant_pos d hd
  have haC : 0<aC := by dsimp [aC]; positivity
  have haH : 0<aH := by dsimp [aH]; positivity
  obtain ⟨nC,hnC,hc⟩ := exists_clock_exponential_le_power aC γ r haC hγ hr
  obtain ⟨nH,_,hh⟩ := exists_clock_exponential_le_power aH γ r haH hγ hr
  refine ⟨max nC nH,hnC.trans (le_max_left _ _),?_⟩
  intro n hn
  have hcn := (le_max_left nC nH).trans hn
  have hhn := (le_max_right nC nH).trans hn
  have h2 := hnC.trans hcn
  have hx : (0:ℝ)<n := by exact_mod_cast (show 0<n by omega)
  have hlog := log_nat_pos h2
  have hpow := Real.rpow_pos_of_pos hx γ
  have hratio : (n:ℝ)/(n:ℝ)^γ=(n:ℝ)^(1-γ) := by
    calc
      _ = (n:ℝ)^(1:ℝ)/(n:ℝ)^γ := by rw [Real.rpow_one]
      _ = _ := (Real.rpow_sub hx 1 γ).symm
  have eC : ((g/2)*n)^2/(2*protectedCellCreditVarianceBudget n C D d γ)=
      aC*((n:ℝ)/(n:ℝ)^γ)/Real.log n := by
    change ((g/2)*(n:ℝ))^2/(2*(D*(n:ℝ)^γ*(3*((L*Real.log n)*(C*n)))/α))=
      (α*(g/2)^2/(6*D*L*C))*((n:ℝ)/(n:ℝ)^γ)/Real.log n
    field_simp [hα.ne',hL.ne',hlog.ne',hpow.ne',hx.ne',hD.ne',hC.ne'] <;> ring
  have eH : (protectedCellEntropyBudget n C d)^2/(2*protectedCellEntropyVarianceBudget n C D d γ)=
      aH*((n:ℝ)/(n:ℝ)^γ)/Real.log n := by
    change ((L*Real.log n)*(C*n))^2/(2*((D*(n:ℝ)^γ*L^2*(Real.log n)^2)*
      (3*((L*Real.log n)*(C*n)))/α))=(α*C/(6*D*L))*((n:ℝ)/(n:ℝ)^γ)/Real.log n
    field_simp [hα.ne',hL.ne',hlog.ne',hpow.ne',hx.ne',hD.ne',hC.ne'] <;> ring
  rw [eC,eH,hratio,two_mul]
  exact add_le_add (hc n hcn) (hh n hhn)

end NoThreeLine

#print axioms NoThreeLine.exists_protectedCellExponential_budget

