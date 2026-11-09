import NoThreeLine.CapacityFrozenField
import NoThreeLine.CapacityHighTail
import NoThreeLine.CapacityLowAccepted000
import NoThreeLine.CapacityCritical34

/-! The same frozen full-prefix chord as the literal capacity checks.
Only nonaxis chord equality removes the finite common grid; no all-point
boundary equality is asserted. This also checks the completed interfaces
together in one import environment. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.FrozenCapacity
open FrozenReference

theorem reference_pair_chord_eq (r s : Fin 4) (f : Fin 4) (x y u : ℝ) (hu : u≠0) :
    directionalChord f (fun b c=>fullPhasePrefix 15347 r b c+fullPhasePrefix 15347 s b c)
      x y u = directionalChord f (pairField r s) x y u := by
  have hf : (fun b c=>fullPhasePrefix 15347 r b c+fullPhasePrefix 15347 s b c) =
      eraseGrid (commonGridLines 32768) (commonGridLines 32768) (pairField r s) := by
    funext b c
    exact (erased_pairField_eq r s b c).symm
  rw [hf,directionalChord_eraseGrid f _ _ _ x y u hu]

theorem reference_critical_capacity (x y : ℝ) :
    directionalChord 2 (fun b c=>fullPhasePrefix 15347 0 b c+fullPhasePrefix 15347 1 b c)
      x y (3/4)/8≤(30549893891/38400000000:ℝ) := by
  rw [reference_pair_chord_eq 0 1 2 x y (3/4) (by norm_num)]
  exact CapacityCritical34.actual_capacity_bound x y

theorem reference_capacity_high (r s : Fin 4) (hrs : r≠s) (f : Fin 4)
    (x y u : ℝ) (hu : u≠0) (h : ℕ) (hh : 8≤h) :
    directionalChord f (fun b c=>fullPhasePrefix 15347 r b c+fullPhasePrefix 15347 s b c)
      x y u/(2*(h:ℝ))≤(1181489833/1600000000:ℝ) := by
  rw [reference_pair_chord_eq r s f x y u hu]
  exact pairCapacity_high r s hrs f x y u h hh

theorem reference_capacity_high_scaled (r s : Fin 4) (hrs : r≠s) (f : Fin 4)
    (x y u : ℝ) (hu : u≠0) (h : ℕ) (hh : 8≤h) :
    (249/250:ℝ)*(directionalChord f
      (fun b c=>fullPhasePrefix 15347 r b c+fullPhasePrefix 15347 s b c)
        x y u/(2*(h:ℝ)))≤(294190968417/400000000000:ℝ) := by
  rw [reference_pair_chord_eq r s f x y u hu]
  exact scaled_pairCapacity_high r s hrs f x y u h hh

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.reference_pair_chord_eq
#print axioms NoThreeLine.FrozenCapacity.reference_critical_capacity
#print axioms NoThreeLine.FrozenCapacity.reference_capacity_high_scaled
