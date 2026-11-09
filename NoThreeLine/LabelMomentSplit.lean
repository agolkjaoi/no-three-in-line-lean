import NoThreeLine.LabelMomentPairUnion
import NoThreeLine.LabelMomentEtaBound

/-! Unit prices on separated labels, and coarse prices only on the union
of bad distinct-label pairs. The main power keeps coefficient one. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteWitnessMoments

def splitTuplePrice {α : Type*} [DecidableEq α] (R : α→α→Prop) [DecidableRel R]
    (w b c : α→ℝ) {m : ℕ} (f : Fin m→α) : ℝ :=
  if ∃i j,i≠j ∧ R (f i) (f j) then tuplePrice ∅ w c f else tuplePrice ∅ w b f

theorem splitTuplePrice_nonneg {α : Type*} [DecidableEq α]
    (R : α→α→Prop) [DecidableRel R] (w b c : α→ℝ)
    (hw : ∀q,0≤w q) (hb : ∀q,0≤b q) (hc : ∀q,0≤c q) {m : ℕ} (f : Fin m→α) :
    0≤splitTuplePrice R w b c f := by
  unfold splitTuplePrice
  split_ifs
  · exact tuplePrice_nonneg ∅ w c hw hc f
  · exact tuplePrice_nonneg ∅ w b hw hb f

theorem split_tuple_moment_bound {α : Type*} [Fintype α] [DecidableEq α]
    (R : α→α→Prop) [DecidableRel R] (hR : ∀q r,R q r→q≠r)
    (w b c : α→ℝ) (hw : ∀q,0≤w q) (hb : ∀q,0≤b q) (hc : ∀q,0≤c q)
    (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) (m : ℕ) :
    (∑f : Fin (m+2)→α,splitTuplePrice R w b c f)≤
      (∑q : α,w q*b q)^(m+2)+((m+2:ℕ):ℝ)^2*W*
        ((∑q : α,w q*b q)+((m+2:ℕ):ℝ)*W)^(m+1)+
      ((m+2:ℕ):ℝ)^2*pairWeight R w c*
        ((∑q : α,w q*c q)+((m+2:ℕ):ℝ)*W)^m := by
  have hh : (∑f : Fin (m+2)→α,splitTuplePrice R w b c f)≤
      tupleMoment ∅ w b (m+2)+
        ∑f : Fin (m+2)→α,if ∃i j,i≠j ∧ R (f i) (f j) then tuplePrice ∅ w c f else 0 := by
    unfold tupleMoment
    rw [←Finset.sum_add_distrib]
    apply Finset.sum_le_sum
    intro f _
    unfold splitTuplePrice
    split_ifs
    · exact le_add_of_nonneg_left (tuplePrice_nonneg ∅ w b hw hb f)
    · exact le_of_eq (add_zero _).symm
  apply hh.trans
  exact add_le_add (by simpa only [show m+2-1=m+1 from by omega] using
    tupleMoment_le_main_add_error w b hw hb W hW0 hW (m+2))
    (bad_pair_moment_bound R hR w c hw hc W hW0 hW m)

theorem split_tuple_eta_moment_bound {α : Type*} [Fintype α] [DecidableEq α]
    (R : α→α→Prop) [DecidableRel R] (hR : ∀q r,R q r→q≠r)
    (w b c : α→ℝ) (hw : ∀q,0≤w q) (hb : ∀q,0≤b q) (hc : ∀q,0≤c q)
    (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) (m : ℕ) (p : α)
    (r : ℝ) (hr : 0<r) (hr1 : r≤1) :
    (∑f : Fin (m+2)→α,splitTuplePrice R w b c f/r^(insert p (tupleLabels f)).card.choose 2)≤
      ((∑q : α,w q*b q)^(m+2)+((m+2:ℕ):ℝ)^2*W*
        ((∑q : α,w q*b q)+((m+2:ℕ):ℝ)*W)^(m+1)+
      ((m+2:ℕ):ℝ)^2*pairWeight R w c*
        ((∑q : α,w q*c q)+((m+2:ℕ):ℝ)*W)^m)/r^(m+3).choose 2 := by
  have hh : (∑f : Fin (m+2)→α,splitTuplePrice R w b c f/r^(insert p (tupleLabels f)).card.choose 2)≤
      (∑f : Fin (m+2)→α,splitTuplePrice R w b c f)/r^(m+3).choose 2 := by
    rw [Finset.sum_div]
    apply Finset.sum_le_sum
    intro f _
    apply div_le_div_of_nonneg_left (splitTuplePrice_nonneg R w b c hw hb hc f) (pow_pos hr _)
    exact pow_le_pow_of_le_one hr.le hr1 (Nat.choose_le_choose 2 (inserted_tupleLabels_card_le p f))
  exact hh.trans (div_le_div_of_nonneg_right
    (split_tuple_moment_bound R hR w b c hw hb hc W hW0 hW m) (pow_pos hr _).le)

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.split_tuple_eta_moment_bound
