import NoThreeLine.ShortStarRepeatedWitness
import NoThreeLine.PhysicalLeafRegularity

/-! The B^(m-a) cost is paid only for repetitions of the actual physical
leaf label. This holds without distinct root lines; witness-count bounds
still require the actual realization hypotheses proved separately. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FiniteWitnessMoments

theorem prod_activeLeafWeight_le_repeat_cap {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (a : WitnessState n) (B : ℝ) (hB : 0<B)
    (ha : a.Valid B) :
    (∏i : Fin m,activeLeafWeight (f i).val.1 a)≤
      B^(m-(leafLabels f).card)*∏q∈leafLabels f,activeLeafWeight q a := by
  simpa only [tupleLabels,leafLabels] using
    prod_tuple_le_repeat_cap (fun i : Fin m=>(f i).val.1) (fun q=>activeLeafWeight q a)
      B hB (fun q=>activeLeafWeight_bounds q a B hB.le ha)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.prod_activeLeafWeight_le_repeat_cap
