import NoThreeLine.ProtectedEntropyScale
import NoThreeLine.ProtectedEntropyGenerator

/-! Finite actual external-rate square/cost comparisons. These are generator
inequalities, not yet stochastic predictable-bracket identifications. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

def protectedExternalEventRate {n : ℕ} (e : ExtendedState n) (mask : Grid n→ℝ)
    (L : LineIndex n) (F : Grid n→ℝ) : ℝ :=
  ∑q∈e.process.activeEvents,if q∈L.val then 0 else e.process.birthRate mask q*F q

theorem protectedExternalEventRate_mono {n : ℕ} (e : ExtendedState n) (mask : Grid n→ℝ)
    (L : LineIndex n) (F G : Grid n→ℝ) (he : e.process.Valid) (hm : ∀q,0≤mask q)
    (h : ∀q∈e.process.activeEvents,q∉L.val→F q≤G q) :
    protectedExternalEventRate e mask L F≤protectedExternalEventRate e mask L G := by
  apply Finset.sum_le_sum
  intro q hq
  by_cases hqL : q∈L.val
  · simp only [if_pos hqL]; exact le_rfl
  · simp only [if_neg hqL]
    exact mul_le_mul_of_nonneg_left (h q hq hqL) (e.process.birthRate_nonneg mask hm he q)

theorem protectedExternalEventRate_mul {n : ℕ} (e : ExtendedState n) (mask : Grid n→ℝ)
    (L : LineIndex n) (F : Grid n→ℝ) (c : ℝ) :
    protectedExternalEventRate e mask L (fun q=>c*F q)=c*protectedExternalEventRate e mask L F := by
  rw [protectedExternalEventRate,protectedExternalEventRate,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q _
  split_ifs <;> ring

theorem protectedEventCostRate_eq_point_sum {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) :
    protectedExternalEventRate e mask L (fun q=>protectedEventCost e Γ L E q)=
      ∑p∈E.filter (fun p=>(e.process.accounts p).status=.active),protectedEntropyPointCostRate e Γ mask L p := by
  unfold protectedExternalEventRate protectedEventCost protectedEntropyPointCostRate
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro q _
  by_cases hqL : q∈L.val
  · simp only [if_pos hqL,Finset.sum_const_zero]
  · simp only [if_neg hqL,Finset.mul_sum]

theorem protectedEntropy_event_square_rate {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) (B K d γ : ℝ)
    (he : e.Valid B) (hm : ∀q,0≤mask q) (hn : 2≤n) (hB : 1≤B)
    (hd : 0≤d) (hdγ : d≤γ) (hBd : B≤(n:ℝ)^d)
    (hE : E⊆L.val) (hs : e.process.stopped=false) (hsp : specified Γ L)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hvirtual : ∀q∈e.process.activeEvents,q∉L.val→virtualMass e.process Γ e.coordinates L q≤(n:ℝ)^γ) :
    (1-Real.log 2)*protectedExternalEventRate e mask L
        (fun q=>(protectedEntropyDeletion e Γ L E q B)^2)≤
      ((1+2*(Γ.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*
        protectedExternalEventRate e mask L (fun q=>protectedEventCost e Γ L E q) := by
  rw [←protectedExternalEventRate_mul,←protectedExternalEventRate_mul]
  apply protectedExternalEventRate_mono e mask L _ _ he.1 hm
  intro q hq hqL
  exact protectedEntropyDeletion_power_cost e Γ L E q B K d γ he hn hB hd hdγ hBd hE hs hsp
    ((e.process.mem_activeEvents q).mp hq) hqL hN hclock hK (hvirtual q hq hqL)

theorem protectedCredit_event_square_rate {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) (B K d γ : ℝ)
    (he : e.Valid B) (hm : ∀q,0≤mask q) (hn : 1≤n) (hdγ : d≤γ) (hBd : B≤(n:ℝ)^d)
    (hE : E⊆L.val) (hs : e.process.stopped=false) (hsp : specified Γ L)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hvirtual : ∀q∈e.process.activeEvents,q∉L.val→virtualMass e.process Γ e.coordinates L q≤(n:ℝ)^γ) :
    (1-Real.log 2)*protectedExternalEventRate e mask L
        (fun q=>(protectedExternalDeletion e Γ L E q)^2)≤
      ((1+2*(Γ.card:ℝ))*(n:ℝ)^γ)*
        protectedExternalEventRate e mask L (fun q=>protectedEventCost e Γ L E q) := by
  rw [←protectedExternalEventRate_mul,←protectedExternalEventRate_mul]
  apply protectedExternalEventRate_mono e mask L _ _ he.1 hm
  intro q hq hqL
  apply protectedDeletion_cost_square e Γ L E q B K _ he hN hclock hK
  exact (protectedExternalDeletion_power_bound e Γ L E q B K d γ he hn hBd hdγ hE hs hsp
    ((e.process.mem_activeEvents q).mp hq) hqL hN hclock hK (hvirtual q hq hqL)).1

end NoThreeLine
#print axioms NoThreeLine.protectedEventCostRate_eq_point_sum
#print axioms NoThreeLine.protectedEntropy_event_square_rate
#print axioms NoThreeLine.protectedCredit_event_square_rate
