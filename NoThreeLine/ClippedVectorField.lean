import NoThreeLine.AuxiliaryODE
import Mathlib.Analysis.Normed.Group.Bounded
import Mathlib.Topology.MetricSpace.Lipschitz

/-! A bounded globally Lipschitz extension of the actual fixed-mode vector
field. Equality on the full coordinate box is proved explicitly. This is a
tool for constructing a flow up to a stopping guard, not a replacement law
outside that guard. -/
set_option autoImplicit false
noncomputable section
open Set Metric
open scoped NNReal

namespace NoThreeLine.AuxiliaryODE

def clipScalar (C x : ℝ) : ℝ := max (-C) (min C x)

theorem clipScalar_lipschitz (C : ℝ) : LipschitzWith 1 (clipScalar C) :=
  (LipschitzWith.id.const_min C).const_max (-C)

theorem clipScalar_norm_le (C x : ℝ) (hC : 0 ≤ C) : ‖clipScalar C x‖ ≤ C := by
  rw [Real.norm_eq_abs,abs_le]
  exact ⟨le_max_left _ _,max_le (by linarith) (min_le_left _ _)⟩

theorem clipScalar_eq (C x : ℝ) (hx : ‖x‖ ≤ C) : clipScalar C x = x := by
  have hb := abs_le.mp (show |x| ≤ C from hx)
  simp [clipScalar,min_eq_right hb.2,max_eq_right hb.1]

def clipPi {ι : Type*} (C : ℝ) (w : ι → ℝ) : ι → ℝ := fun i => clipScalar C (w i)

theorem clipPi_lipschitz {ι : Type*} [Fintype ι] (C : ℝ) :
    LipschitzWith 1 (clipPi (ι:=ι) C) := by
  intro x y
  rw [edist_pi_le_iff]
  intro i
  simpa only [Function.comp_def,Function.eval,clipPi,one_mul] using
    (clipScalar_lipschitz C).comp (LipschitzWith.eval i) x y

theorem clipPi_norm_le {ι : Type*} [Fintype ι] (C : ℝ) (hC : 0 ≤ C) (w : ι → ℝ) :
    ‖clipPi C w‖ ≤ C :=
  (pi_norm_le_iff_of_nonneg hC).mpr (fun i => clipScalar_norm_le C (w i) hC)

theorem clipPi_eq {ι : Type*} [Fintype ι] (C : ℝ) (w : ι → ℝ) (hw : ‖w‖ ≤ C) :
    clipPi C w = w := by
  funext i
  exact clipScalar_eq C (w i) ((norm_le_pi_norm w i).trans hw)

def clipCoordinates {n : ℕ} (C : ℝ) (z : Coordinates n) : Coordinates n :=
  (clipPi C z.1,(clipPi C z.2.1,clipPi C z.2.2))

theorem clipCoordinates_lipschitz (n : ℕ) (C : ℝ) :
    LipschitzWith 1 (clipCoordinates (n:=n) C) := by
  have h₁ : LipschitzWith 1 (fun z : Coordinates n => clipPi C z.1) := by
    simpa only [Function.comp_def,one_mul] using (clipPi_lipschitz C).comp LipschitzWith.prod_fst
  have h₂ : LipschitzWith 1 (fun z : Coordinates n => clipPi C z.2.1) := by
    simpa only [Function.comp_def,one_mul] using
      (clipPi_lipschitz C).comp (LipschitzWith.prod_fst.comp LipschitzWith.prod_snd)
  have h₃ : LipschitzWith 1 (fun z : Coordinates n => clipPi C z.2.2) := by
    simpa only [Function.comp_def,one_mul] using
      (clipPi_lipschitz C).comp (LipschitzWith.prod_snd.comp LipschitzWith.prod_snd)
  change LipschitzWith 1 (fun z : Coordinates n => (clipPi C z.1,(clipPi C z.2.1,clipPi C z.2.2)))
  simpa only [max_self] using h₁.prodMk (h₂.prodMk h₃)

theorem clipCoordinates_norm_le {n : ℕ} (C : ℝ) (hC : 0 ≤ C) (z : Coordinates n) :
    ‖clipCoordinates C z‖ ≤ C := by
  exact max_le (clipPi_norm_le C hC z.1)
    (max_le (clipPi_norm_le C hC z.2.1) (clipPi_norm_le C hC z.2.2))

theorem clipCoordinates_eq {n : ℕ} (C : ℝ) (z : Coordinates n) (hz : ‖z‖ ≤ C) :
    clipCoordinates C z = z := by
  have hh : ‖z.1‖ ≤ C ∧ ‖z.2.1‖ ≤ C ∧ ‖z.2.2‖ ≤ C := by
    simpa only [Prod.norm_def,max_le_iff] using hz
  simp [clipCoordinates,clipPi_eq C z.1 hh.1,clipPi_eq C z.2.1 hh.2.1,
    clipPi_eq C z.2.2 hh.2.2]

def clippedVectorField {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (C : ℝ) (z : Coordinates n) : Coordinates n :=
  vectorField s Γ mask (clipCoordinates C z)

theorem clippedVectorField_eq {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (C : ℝ) (z : Coordinates n) (hz : ‖z‖ ≤ C) :
    clippedVectorField s Γ mask C z = vectorField s Γ mask z := by
  rw [clippedVectorField,clipCoordinates_eq C z hz]

theorem clippedVectorField_bounded_lipschitz {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (C : ℝ) (hC : 0 ≤ C) :
    ∃ L K : ℝ≥0, (∀ z, ‖clippedVectorField s Γ mask C z‖ ≤ L) ∧
      LipschitzWith K (clippedVectorField s Γ mask C) := by
  have hc : IsCompact (closedBall (0 : Coordinates n) C) := isCompact_closedBall _ _
  have hf := vectorField_contDiff s Γ mask
  obtain ⟨K,hK⟩ := hf.contDiffOn.exists_lipschitzOnWith (by norm_num) (convex_closedBall _ _) hc
  obtain ⟨D,hD⟩ := hc.exists_bound_of_continuousOn hf.continuous.continuousOn
  have hmem (z : Coordinates n) : clipCoordinates C z ∈ closedBall (0 : Coordinates n) C := by
    simpa only [mem_closedBall,dist_zero_right] using clipCoordinates_norm_le C hC z
  refine ⟨⟨max D 0,le_max_right _ _⟩,K,?_,?_⟩
  · intro z
    exact (hD _ (hmem z)).trans (le_max_left _ _)
  · apply LipschitzWith.of_dist_le_mul
    intro x y
    calc
      _ ≤ K * dist (clipCoordinates C x) (clipCoordinates C y) := hK.dist_le_mul _ (hmem x) _ (hmem y)
      _ ≤ K * dist x y := by
        gcongr
        simpa using (clipCoordinates_lipschitz n C).dist_le_mul x y

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.clippedVectorField_eq
#print axioms NoThreeLine.AuxiliaryODE.clippedVectorField_bounded_lipschitz
