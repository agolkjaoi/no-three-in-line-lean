import NoThreeLine.LabelMomentBound
import Mathlib.Data.Nat.Choose.Basic

/-! A uniform eta floor for a fixed moment degree. The image size of every
label map, including repetitions, is bounded by its domain size. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteWitnessMoments

theorem inserted_tupleLabels_card_le {α : Type*} [DecidableEq α] {m : ℕ}
    (p : α) (f : Fin m→α) : (insert p (tupleLabels f)).card≤m+1 :=
  (Finset.card_insert_le p (tupleLabels f)).trans (Nat.add_le_add_right (tupleLabels_card_le f) 1)

theorem tupleMoment_eta_sum_le {α : Type*} [Fintype α] [DecidableEq α]
    (w b : α→ℝ) (hw : ∀q,0≤w q) (hb : ∀q,0≤b q) (p : α) (m : ℕ)
    (r : ℝ) (hr : 0<r) (hr1 : r≤1) :
    (∑f : Fin m→α,tuplePrice ∅ w b f/r^(insert p (tupleLabels f)).card.choose 2)≤
      tupleMoment ∅ w b m/r^(m+1).choose 2 := by
  unfold tupleMoment
  rw [Finset.sum_div]
  apply Finset.sum_le_sum
  intro f _
  apply div_le_div_of_nonneg_left (tuplePrice_nonneg ∅ w b hw hb f) (pow_pos hr _)
  exact pow_le_pow_of_le_one hr.le hr1 (Nat.choose_le_choose 2 (inserted_tupleLabels_card_le p f))

theorem tupleMoment_eta_sum_le_main_add_error {α : Type*} [Fintype α] [DecidableEq α]
    (w b : α→ℝ) (hw : ∀q,0≤w q) (hb : ∀q,0≤b q) (p : α) (m : ℕ)
    (r : ℝ) (hr : 0<r) (hr1 : r≤1) (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) :
    (∑f : Fin m→α,tuplePrice ∅ w b f/r^(insert p (tupleLabels f)).card.choose 2)≤
      ((∑q : α,w q*b q)^m+(m:ℝ)^2*W*((∑q : α,w q*b q)+(m:ℝ)*W)^(m-1))/r^(m+1).choose 2 :=
  (tupleMoment_eta_sum_le w b hw hb p m r hr hr1).trans
    (div_le_div_of_nonneg_right (tupleMoment_le_main_add_error w b hw hb W hW0 hW m) (pow_pos hr _).le)

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.tupleMoment_eta_sum_le
#print axioms NoThreeLine.FiniteWitnessMoments.tupleMoment_eta_sum_le_main_add_error
