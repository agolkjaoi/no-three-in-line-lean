import NoThreeLine.BenchmarkAngularSymmetry
import NoThreeLine.DyadicPhaseInput

/-! Pull back membership in each closed rational symmetry box to the same
canonical root box. Boundary points are included in both coordinates. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.BenchmarkSymmetry

theorem one_sub_mem_Icc (l h x : ℝ) (hx : x∈Set.Icc (1-h) (1-l)) :
    1-x∈Set.Icc l h := by
  constructor <;> linarith [hx.1,hx.2]

theorem root_mem_of_symmetry_box (Q : QRect) (f : Fin 4) (x y : ℝ)
    (hx : x∈Set.Icc ((Q.symmetry f).x0 : ℝ) (Q.symmetry f).x1)
    (hy : y∈Set.Icc ((Q.symmetry f).y0 : ℝ) (Q.symmetry f).y1) :
    rootX f x y∈Set.Icc (Q.x0 : ℝ) Q.x1 ∧
      rootY f x y∈Set.Icc (Q.y0 : ℝ) Q.y1 := by
  fin_cases f
  · exact ⟨hx,hy⟩
  · exact ⟨hy,hx⟩
  · change x∈Set.Icc ((1-Q.x1 : ℚ):ℝ) ((1-Q.x0 : ℚ):ℝ) at hx
    change y∈Set.Icc ((1-Q.y1 : ℚ):ℝ) ((1-Q.y0 : ℚ):ℝ) at hy
    push_cast at hx hy
    exact ⟨one_sub_mem_Icc _ _ _ hx,one_sub_mem_Icc _ _ _ hy⟩
  · change x∈Set.Icc ((1-Q.y1 : ℚ):ℝ) ((1-Q.y0 : ℚ):ℝ) at hx
    change y∈Set.Icc ((1-Q.x1 : ℚ):ℝ) ((1-Q.x0 : ℚ):ℝ) at hy
    push_cast at hx hy
    exact ⟨one_sub_mem_Icc _ _ _ hy,one_sub_mem_Icc _ _ _ hx⟩

theorem root_box_bound_symmetry (Q : QRect) (F : ℝ → ℝ → ℝ) (B : ℝ)
    (hs : ∀f x y,F (rootX f x y) (rootY f x y)=F x y)
    (hb : ∀x y,x∈Set.Icc (Q.x0 : ℝ) Q.x1 →
      y∈Set.Icc (Q.y0 : ℝ) Q.y1 → F x y<B)
    (f : Fin 4) (x y : ℝ)
    (hx : x∈Set.Icc ((Q.symmetry f).x0 : ℝ) (Q.symmetry f).x1)
    (hy : y∈Set.Icc ((Q.symmetry f).y0 : ℝ) (Q.symmetry f).y1) :
    F x y<B := by
  have hm := root_mem_of_symmetry_box Q f x y hx hy
  rw [←hs f x y]
  exact hb _ _ hm.1 hm.2

end NoThreeLine.BenchmarkSymmetry

#print axioms NoThreeLine.BenchmarkSymmetry.root_mem_of_symmetry_box
