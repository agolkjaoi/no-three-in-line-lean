import NoThreeLine.NegativeJumpExponential
import NoThreeLine.ProtectedWholeEnergy

/-! Exponential compensated generators for the actual whole protected
credit and entropy. Real external births only decrease these totals;
the variance term remains the square of the simultaneous total loss. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem protectedCreditTotal_external_decreases {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (L : LineIndex n) (E : Finset (Grid n))
    (B K : ℝ) (he : e.Valid B) (hs : e.process.stopped=false)
    (hN : occupancy e.process L≤1) (hk : e.clocks L≤K) (hK : K<2)
    (q : Grid n) (positive : Grid n→Bool) (hq : q∈e.process.activeEvents) (hqL : q∉L.val) :
    protectedCreditTotal L E (e.birth Γ q positive) (protectedLineSave L e (e.birth Γ q positive) saved)≤
      protectedCreditTotal L E e saved := by
  have hl := protectedLedger_external_total_loss e Γ L E saved q positive he.1 hs hq hqL
  have h0 := protectedExternalDeletion_nonneg e Γ L E q B K he hN hk hK
  change protectedCreditTotal L E e saved-
    protectedCreditTotal L E (e.birth Γ q positive) (protectedLineSave L e (e.birth Γ q positive) saved)=_ at hl
  linarith only [hl,h0]

theorem protectedEntropyTotal_external_decreases {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (L : LineIndex n) (E : Finset (Grid n))
    (B K : ℝ) (hB : 0<B) (he : e.Valid B) (hs : e.process.stopped=false)
    (hN : occupancy e.process L≤1) (hk : e.clocks L≤K) (hK : K<2)
    (q : Grid n) (positive : Grid n→Bool) (hq : q∈e.process.activeEvents) (hqL : q∉L.val) :
    protectedEntropyTotal L E B (e.birth Γ q positive) (protectedLineSave L e (e.birth Γ q positive) saved)≤
      protectedEntropyTotal L E B e saved := by
  have hl := protectedLedger_external_entropy_loss e Γ L E saved q B positive he.1 hs hq hqL
  have h0 := (protectedEntropyDeletion_bounds e Γ L E q B K he hB hN hk hK).1
  change protectedEntropyTotal L E B e saved-
    protectedEntropyTotal L E B (e.birth Γ q positive) (protectedLineSave L e (e.birth Γ q positive) saved)=_ at hl
  linarith only [hl,h0]

theorem protectedCreditTotal_exp_compensated_generator {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ)
    (positive : Grid n→Grid n→Bool) (L : LineIndex n) (E : Finset (Grid n))
    (B K θ : ℝ) (he : e.Valid B) (hs : e.process.stopped=false)
    (hN : occupancy e.process L≤1) (hk : e.clocks L≤K) (hK : K<2)
    (hm : ∀q,0≤mask q) (hθ : 0≤θ) (hE : E⊆L.val) (hsp : specified Γ L) :
    θ*Real.exp (θ*protectedCreditTotal L E e saved)*
      (protectedCreditTotalDrift e Γ mask L E-protectedCreditTotalSource e mask L E)+
      protectedObservableExternalRate e saved Γ mask positive L
        (fun v a=>Real.exp (θ*protectedCreditTotal L E v a))≤
      (θ^2/2)*Real.exp (θ*protectedCreditTotal L E e saved)*protectedCreditEnergyRate e Γ mask L E := by
  have hh := protectedObservableExternalRate_exp_bound e saved Γ mask positive L (protectedCreditTotal L E) θ hθ he.1 hm
    (fun q hq hqL=>protectedCreditTotal_external_decreases e saved Γ L E B K he hs hN hk hK q (positive q) hq hqL)
  have hg := protectedCreditTotal_generator e saved Γ mask positive L E he.1 hs hE hsp
  rw [protectedCreditTotal_jumpSquare_eq_deletion e saved Γ mask positive L E he.1 hs] at hh
  change _≤(θ^2/2)*Real.exp (θ*protectedCreditTotal L E e saved)*protectedCreditEnergyRate e Γ mask L E at hh
  have heq : protectedCreditTotalDrift e Γ mask L E-protectedCreditTotalSource e mask L E=
      -protectedObservableExternalRate e saved Γ mask positive L (protectedCreditTotal L E) := by linarith only [hg]
  rw [heq]
  nlinarith only [hh]

theorem protectedEntropyTotal_exp_compensated_generator {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ)
    (positive : Grid n→Grid n→Bool) (L : LineIndex n) (E : Finset (Grid n))
    (B K θ : ℝ) (hB : 0<B) (he : e.Valid B) (hs : e.process.stopped=false)
    (hN : occupancy e.process L≤1) (hk : e.clocks L≤K) (hK : K<2)
    (hm : ∀q,0≤mask q) (hθ : 0≤θ) (hE : E⊆L.val) (hsp : specified Γ L) :
    θ*Real.exp (θ*protectedEntropyTotal L E B e saved)*
      (protectedEntropyTotalDrift e saved Γ mask L E B-protectedEntropyTotalSource e saved Γ mask L E B)+
      protectedObservableExternalRate e saved Γ mask positive L
        (fun v a=>Real.exp (θ*protectedEntropyTotal L E B v a))≤
      (θ^2/2)*Real.exp (θ*protectedEntropyTotal L E B e saved)*protectedEntropyEnergyRate e Γ mask L E B := by
  have hh := protectedObservableExternalRate_exp_bound e saved Γ mask positive L (protectedEntropyTotal L E B) θ hθ he.1 hm
    (fun q hq hqL=>protectedEntropyTotal_external_decreases e saved Γ L E B K hB he hs hN hk hK q (positive q) hq hqL)
  have hg := protectedEntropyTotal_generator e saved Γ mask positive L E B hB he.1 hs hE hsp
  rw [protectedEntropyTotal_jumpSquare_eq_deletion e saved Γ mask positive L E B he.1 hs] at hh
  change _≤(θ^2/2)*Real.exp (θ*protectedEntropyTotal L E B e saved)*protectedEntropyEnergyRate e Γ mask L E B at hh
  have heq : protectedEntropyTotalDrift e saved Γ mask L E B-protectedEntropyTotalSource e saved Γ mask L E B=
      -protectedObservableExternalRate e saved Γ mask positive L (protectedEntropyTotal L E B) := by linarith only [hg]
  rw [heq]
  nlinarith only [hh]

end NoThreeLine
#print axioms NoThreeLine.protectedCreditTotal_exp_compensated_generator
#print axioms NoThreeLine.protectedEntropyTotal_exp_compensated_generator
