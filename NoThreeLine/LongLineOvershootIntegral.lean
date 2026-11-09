import NoThreeLine.LongLineOvershootScalar
import NoThreeLine.GenericCreditIteration

/-! A weighted integral version of the positive-excess inequality. The
birth indicator/retention is retained as f, so its price is not replaced by
one. Actual C14 moment estimates and calendar integration are separate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.FiniteWitnessMoments

theorem weighted_positive_excess_integral_le {X : Type*} [MeasurableSpace X]
    (μ : Measure X) [IsFiniteMeasure μ] (f H : X→ℝ) (U D L ε : ℝ) (k : ℕ)
    (hf : Measurable f) (hH : Measurable H)
    (hfB : ∀x,0≤f x ∧ f x≤1) (hHB : ∀x,0≤H x ∧ H x≤U)
    (hU : 0≤U) (hD : 0≤D) (hL : 0<L) (hε : 0<ε) :
    (∫x,f x*max (H x-D) 0 ∂μ)≤ε*L*(∫x,f x ∂μ)+
      (∫x,f x*(H x)^(k+1) ∂μ)/(D+ε*L)^k := by
  have hi : Integrable f μ := GenericCreditIteration.bounded_nonnegative_integrable μ f hf 1 hfB
  have hp : Integrable (fun x=>f x*(H x)^(k+1)) μ :=
    GenericCreditIteration.bounded_nonnegative_integrable μ _ (hf.mul (hH.pow_const (k+1)))
      (U^(k+1)) (fun x=>⟨mul_nonneg (hfB x).1 (pow_nonneg (hHB x).1 _),by
        calc f x*(H x)^(k+1)≤1*U^(k+1) := mul_le_mul (hfB x).2
               (pow_le_pow_left₀ (hHB x).1 (hHB x).2 _) (pow_nonneg (hHB x).1 _) (by norm_num)
             _=U^(k+1) := one_mul _⟩)
  have he : Integrable (fun x=>f x*max (H x-D) 0) μ :=
    GenericCreditIteration.bounded_nonnegative_integrable μ _
      (hf.mul ((hH.sub measurable_const).max measurable_const)) U (fun x=>⟨
        mul_nonneg (hfB x).1 (le_max_right _ _),by
        have hm : max (H x-D) 0≤H x := max_le (sub_le_self _ hD) (hHB x).1
        calc f x*max (H x-D) 0≤1*H x := mul_le_mul (hfB x).2 hm (le_max_right _ _) (by norm_num)
             _≤U := by simpa using (hHB x).2⟩)
  have hu := (hi.const_mul (ε*L)).add (hp.div_const ((D+ε*L)^k))
  have hh := integral_mono he hu (fun x=>by
    change f x*max (H x-D) 0≤ε*L*f x+f x*(H x)^(k+1)/(D+ε*L)^k
    have hx := mul_le_mul_of_nonneg_left
      (positive_excess_le_power k (H x) D L ε (hHB x).1 hD hL hε) (hfB x).1
    calc f x*max (H x-D) 0≤f x*(ε*L+(H x)^(k+1)/(D+ε*L)^k) := hx
         _=ε*L*f x+f x*(H x)^(k+1)/(D+ε*L)^k := by ring)
  simpa only [Pi.add_apply,integral_add (hi.const_mul (ε*L)) (hp.div_const ((D+ε*L)^k)),
    integral_const_mul,integral_div] using hh

theorem weighted_positive_excess_from_moment {X : Type*} [MeasurableSpace X]
    (μ : Measure X) [IsFiniteMeasure μ] (f H : X→ℝ) (U D L ε B C P : ℝ) (k : ℕ)
    (hf : Measurable f) (hH : Measurable H)
    (hfB : ∀x,0≤f x ∧ f x≤1) (hHB : ∀x,0≤H x ∧ H x≤U)
    (hU : 0≤U) (hD : 0≤D) (hL : 0<L) (hDL : D≤L) (hε : 0<ε)
    (hB : 0≤B) (hC : 0≤C) (hP : 0≤P)
    (hprice : (∫x,f x ∂μ)≤P)
    (hmoment : (∫x,f x*(H x)^(k+1) ∂μ)≤P*(D^(k+1)+C*B*L^k)) :
    (∫x,f x*max (H x-D) 0 ∂μ)≤P*(ε*L+L/(1+ε)^k+C*B/ε^k) := by
  have hb : 0<D+ε*L := add_pos_of_nonneg_of_pos hD (mul_pos hε hL)
  calc
    _≤ε*L*(∫x,f x ∂μ)+(∫x,f x*(H x)^(k+1) ∂μ)/(D+ε*L)^k :=
      weighted_positive_excess_integral_le μ f H U D L ε k hf hH hfB hHB hU hD hL hε
    _≤ε*L*P+P*(D^(k+1)+C*B*L^k)/(D+ε*L)^k :=
      add_le_add (mul_le_mul_of_nonneg_left hprice (mul_pos hε hL).le)
        (div_le_div_of_nonneg_right hmoment (pow_pos hb k).le)
    _=P*(ε*L+(D^(k+1)+C*B*L^k)/(D+ε*L)^k) := by ring
    _≤P*(ε*L+(L/(1+ε)^k+C*B/ε^k)) := mul_le_mul_of_nonneg_left
      (add_le_add le_rfl (overshoot_moment_numerator_le k D L ε B C hD hL hDL hε hB hC)) hP
    _=P*(ε*L+L/(1+ε)^k+C*B/ε^k) := by ring

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.weighted_positive_excess_integral_le
#print axioms NoThreeLine.FiniteWitnessMoments.weighted_positive_excess_from_moment
