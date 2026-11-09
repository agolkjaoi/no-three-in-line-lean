import NoThreeLine.ProtectedStateSourceForbidden
import NoThreeLine.ProtectedFirstEnergyVariance

/-! Joint measurability and coarse finite caps for the real whole-event
energy and the two-state compensated increment. These are not sharp tails. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

theorem protectedCreditTotalSource_measurable {n : ℕ} (mask : Grid n→ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) :
    Measurable (fun e : ExtendedState n=>protectedCreditTotalSource e mask L E) :=
  Finset.measurable_sum _ (fun p _=>protectedLinePositiveDrift_measurable mask L p)

theorem protectedEntropyTotalSource_measurable {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n→ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ) :
    Measurable (fun x : ExtendedState n×(Grid n→ℝ)=>protectedEntropyTotalSource x.1 x.2 Γ mask L E B) :=
  Finset.measurable_sum _ (fun p _=>protectedEntropySource_measurable Γ mask L p B)

theorem protectedWholeEnergyRate_measurable {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n→ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ) :
    Measurable (fun e : ExtendedState n=>protectedCreditEnergyRate e Γ mask L E) ∧
      Measurable (fun e : ExtendedState n=>protectedEntropyEnergyRate e Γ mask L E B) :=
  ⟨protectedExternalEventRate_measurable mask L _
      (fun q=>((protectedWholeDeletion_measurable Γ L E q B).1).pow_const 2),
    protectedExternalEventRate_measurable mask L _
      (fun q=>((protectedWholeDeletion_measurable Γ L E q B).2).pow_const 2)⟩

private theorem norm_sum_cap {ι : Type*} (E : Finset ι) (f : ι→ℝ) (C : ℝ)
    (hf : ∀p∈E,‖f p‖≤C) : ‖∑p∈E,f p‖≤(E.card:ℝ)*C :=
  (norm_sum_le _ _).trans ((Finset.sum_le_sum hf).trans_eq (by simp))

theorem protectedWholeSource_norm_bounds {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (hsp : specified Γ L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hm : ∀q,0≤mask q ∧ mask q≤1) :
    ‖protectedCreditTotalSource e mask L E‖≤(E.card:ℝ)*((B/n)*B) ∧
      ‖protectedEntropyTotalSource e saved Γ mask L E B‖≤(E.card:ℝ)*protectedEntropySourceCap n B := by
  constructor
  · apply norm_sum_cap
    intro p hp
    have hh := protectedLinePositiveDrift_bounds_all e Γ mask L hsp p (hE hp) B he hm
    rw [Real.norm_eq_abs,abs_of_nonneg hh.1]
    exact hh.2
  · exact norm_sum_cap E _ _ (fun p hp=>protectedEntropySource_bounds_all e saved Γ mask L hsp p (hE hp) B hB he hm)

def protectedWholeEnergyCap (n : ℕ) (B : ℝ) (a : ℕ) : ℝ :=
  (n:ℝ)^2*(B/n)*((a:ℝ)*(4*B))^2

theorem protectedWholeEnergyCap_nonneg (n : ℕ) (B : ℝ) (a : ℕ) (hB : 0≤B) :
    0≤protectedWholeEnergyCap n B a := by unfold protectedWholeEnergyCap; positivity

theorem protectedWholeEnergyRate_norm_bounds {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (hsp : specified Γ L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hm : ∀q,0≤mask q ∧ mask q≤1) :
    ‖protectedCreditEnergyRate e Γ mask L E‖≤protectedWholeEnergyCap n B E.card ∧
      ‖protectedEntropyEnergyRate e Γ mask L E B‖≤protectedWholeEnergyCap n B E.card := by
  constructor
  · apply protectedExternalEventRate_norm_bound e mask L B hB he hm _ _ (sq_nonneg _)
    intro q _
    rw [norm_pow]
    exact pow_le_pow_left₀ (norm_nonneg _) (protectedWholeDeletion_norm_bounds e Γ L hsp E hE B hB he q).1 2
  · apply protectedExternalEventRate_norm_bound e mask L B hB he hm _ _ (sq_nonneg _)
    intro q _
    rw [norm_pow]
    exact pow_le_pow_left₀ (norm_nonneg _) (protectedWholeDeletion_norm_bounds e Γ L hsp E hE B hB he q).2 2

def protectedPairCompensatedIncrement {n : ℕ} (cfg : FlowConfig n)
    (f : ProtectedTimedState cfg→ℝ) (F : ExtendedState n×(Grid n→ℝ)→ℝ)
    (x : ProtectedTimedState cfg×ProtectedTimedState cfg) : ℝ :=
  f x.2-protectedStatePairGenericSource cfg F x-f x.1

theorem protectedPairCompensatedIncrement_measurable {n : ℕ} (cfg : FlowConfig n)
    (f : ProtectedTimedState cfg→ℝ) (F : ExtendedState n×(Grid n→ℝ)→ℝ)
    (hf : Measurable f) (hF : Measurable F) : Measurable (protectedPairCompensatedIncrement cfg f F) :=
  ((hf.comp measurable_snd).sub (protectedStatePairGenericSource_measurable cfg F hF)).sub (hf.comp measurable_fst)

theorem protectedPairCompensatedIncrement_actual {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (f : ProtectedTimedState cfg→ℝ) (F : ExtendedState n×(Grid n→ℝ)→ℝ)
    (hn : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n) :
    protectedPairCompensatedIncrement cfg f F (s,(protectedRestartStep cfg ε M L hn (s,ω)).1)=
      f (protectedRestartStep cfg ε M L hn (s,ω)).1-protectedClockStateSource cfg ε M F hn (s,ω)-f s := by
  unfold protectedPairCompensatedIncrement
  have hh : protectedStatePairGenericSource cfg F (s,(protectedRestartStep cfg ε M L hn (s,ω)).1)=
      protectedClockStateSource cfg ε M F hn (s,ω) :=
    protectedStatePairGenericSource_actual cfg ε M L F s (WinnerMarkLaw.firstMarkedRace hn ω)
  rw [hh]

theorem protectedPairCompensatedIncrement_actual_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (f : ProtectedTimedState cfg→ℝ) (F : ExtendedState n×(Grid n→ℝ)→ℝ) (D C : ℝ) (hC : 0≤C)
    (hf : ∀s : ProtectedTimedState cfg,(∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)→‖f s‖≤D)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hn : 0<n) (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (ω : BoardClockPath n) :
    ‖protectedPairCompensatedIncrement cfg f F (s,(protectedRestartStep cfg ε M L hn (s,ω)).1)‖≤
      2*D+(cfg.horizon:ℝ)*C := by
  rw [protectedPairCompensatedIncrement_actual]
  have hnxt := hf (protectedRestartStep cfg ε M L hn (s,ω)).1
    (fun p hp=>protectedLineSave_timed_bounds_all cfg ε M L hsp p (hE hp) s (hsv p hp) _)
  have hr := protectedClockStateSource_bound cfg ε M E F C hC hF hn s hsv ω
  exact ((norm_sub_le _ _).trans (add_le_add ((norm_sub_le _ _).trans (add_le_add hnxt hr)) (hf s hsv))).trans_eq (by ring)

end NoThreeLine
#print axioms NoThreeLine.protectedWholeEnergyRate_norm_bounds
#print axioms NoThreeLine.protectedPairCompensatedIncrement_actual_bound
