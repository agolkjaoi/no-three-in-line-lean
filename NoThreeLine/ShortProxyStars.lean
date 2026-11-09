import NoThreeLine.ProxyLinePartition
import NoThreeLine.ActivatedLineProxy
import NoThreeLine.ShortStarMaskedPower

/-! Actual selected-witness masked line mass is exactly the existing
short-star intensity. Diagonal leaf/witness terms vanish by actual safety;
every surviving ordered star has one full board line through the root. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines GridLines MixedConnection FiniteDirections ShortStars

theorem short_witness_mass_eq_stars {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (mask : Grid n → ℝ) (a : WitnessState n) (B : ℝ) (ha : a.Valid B) :
    (∑ L ∈ shortRootBoardLines Γ p H, ∑ z ∈ L.val.val.erase p,
      selectedLineGate p z a * boardLineMass mask L.val p a) =
      weightedStarIntensity Γ p H (fun s => mask s.val.1) a := by
  classical
  by_cases hp : p ∈ a.augmented.physical.process.activeEvents
  · let T := (shortRootBoardLines Γ p H).sigma (fun L => (L.val.val.erase p).product (L.val.val.erase p))
    let f := fun x : Σ L : RootBoardLineIndex p, Grid n × Grid n =>
      mask x.2.1 * activeLeafWeight x.2.1 a * a.augmented.physical.lineCredits x.1.val *
        (if x.2.2 ∈ a.augmented.physical.process.selected then 1 else 0)
    have hvalid (x : Σ L : RootBoardLineIndex p, Grid n × Grid n) (hx : x ∈ T) (hf : f x ≠ 0) :
        ShortStars.Valid Γ p H x.2.1 x.2.2 := by
      have hx' := Finset.mem_sigma.mp hx
      have hL := (mem_shortRootBoardLines Γ p H x.1).mp hx'.1
      have hqz := Finset.mem_product.mp hx'.2
      have hq := Finset.mem_erase.mp hqz.1
      have hz := Finset.mem_erase.mp hqz.2
      have hzs : x.2.2 ∈ a.augmented.physical.process.selected := by
        by_contra h
        exact hf (by simp [f,h])
      have hqa : x.2.1 ∈ a.augmented.physical.process.activeEvents := by
        by_contra h
        exact hf (by simp only [f,activeLeafWeight,if_neg h,mul_zero,zero_mul])
      have hqs : x.2.1 ∉ a.augmented.physical.process.selected :=
        (ha.1.1.1.2.1 x.2.1 ((a.augmented.physical.process.mem_activeEvents x.2.1).mp hqa)).1
      have he := boardLine_eq x.1.val p x.2.1 x.1.property hq.2 hq.1.symm
      refine ⟨hq.1,hz.1,(fun h => hqs (h ▸ hzs)),he ▸ hz.2,?_,?_⟩
      · intro hsp
        apply hL.1
        apply (specified_iff_designated Γ p x.1.val x.1.property).mpr
        rw [he]
        exact (LineDrift.designated_iff Γ p x.2.1 hq.1.symm).mpr hsp
      · simpa only [he] using hL.2
    let g := fun x hx hf => (⟨x.2,(mem_shortStars Γ p H x.2.1 x.2.2).mpr (hvalid x hx hf)⟩ : ↥(shortStars Γ p H))
    have hsum : (∑ x ∈ T, f x) = ∑ s : ↥(shortStars Γ p H), starTerm (fun s => mask s.val.1) a s := by
      apply Finset.sum_bij_ne_zero g
      · intro x hx hf
        exact Finset.mem_univ _
      · intro x hx hf y hy hfy hxy
        have hqz : x.2 = y.2 := congrArg Subtype.val hxy
        have hx' := Finset.mem_product.mp (Finset.mem_sigma.mp hx).2
        have hy' := Finset.mem_product.mp (Finset.mem_sigma.mp hy).2
        have hL : x.1 = y.1 := by
          apply Subtype.ext
          apply Subtype.ext
          rw [boardLine_eq x.1.val p x.2.1 x.1.property (Finset.mem_of_mem_erase hx'.1)
            (Finset.ne_of_mem_erase hx'.1).symm,
            boardLine_eq y.1.val p y.2.1 y.1.property (Finset.mem_of_mem_erase hy'.1)
              (Finset.ne_of_mem_erase hy'.1).symm,hqz]
        exact Sigma.ext hL (heq_of_eq hqz)
      · intro s _ hs
        let L : RootBoardLineIndex p := ⟨starRootLine s,left_mem_lineThrough p s.val.1⟩
        let x : Σ L : RootBoardLineIndex p, Grid n × Grid n := ⟨L,s.val⟩
        have hv := (mem_shortStars Γ p H s.val.1 s.val.2).mp s.property
        have hx : x ∈ T := by
          apply Finset.mem_sigma.mpr
          refine ⟨(mem_shortRootBoardLines Γ p H L).mpr ⟨starRootLine_nonspecified s,hv.2.2.2.2.2⟩,?_⟩
          exact Finset.mem_product.mpr ⟨Finset.mem_erase.mpr ⟨hv.1,right_mem_lineThrough p s.val.1⟩,
            Finset.mem_erase.mpr ⟨hv.2.1,hv.2.2.2.1⟩⟩
        have hf : f x ≠ 0 := hs
        exact ⟨x,hx,hf,Subtype.ext rfl⟩
      · intro x hx hf
        have he : starRootLine (g x hx hf) = x.1.val := by
          apply Subtype.ext
          exact (boardLine_eq x.1.val p x.2.1 x.1.property
            (Finset.mem_of_mem_erase (Finset.mem_product.mp (Finset.mem_sigma.mp hx).2).1)
            (Finset.ne_of_mem_erase (Finset.mem_product.mp (Finset.mem_sigma.mp hx).2).1).symm).symm
        simp only [starTerm,g,he]
        rfl
    rw [weightedStarIntensity,if_pos hp,one_mul,←hsum]
    rw [show T=(shortRootBoardLines Γ p H).sigma (fun L => (L.val.val.erase p).product (L.val.val.erase p)) from rfl,
      Finset.sum_sigma]
    apply Finset.sum_congr rfl
    intro L _
    refine Eq.trans ?_ (Finset.sum_product_right (L.val.val.erase p) (L.val.val.erase p)
      (fun qz : Grid n × Grid n => f ⟨L,qz⟩)).symm
    apply Finset.sum_congr rfl
    intro z _
    simp only [selectedLineGate,hp,true_and,boardLineMass,Finset.mul_sum,Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro q _
    dsimp only [f]
    ring
  · simp [selectedLineGate,hp,weightedStarIntensity]

theorem physicalOutsideShortProxy_le_stars {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (a : WitnessState n) (B : ℝ) (hB : 0 ≤ B) (ha : a.Valid B) :
    physicalOutsideShortProxy Γ mask p H a.augmented.physical ≤
      weightedStarIntensity Γ p H (fun s => mask s.val.1) a / n := by
  calc
    _ ≤ ∑ L ∈ shortRootBoardLines Γ p H,
        (∑ z ∈ L.val.val.erase p, selectedLineGate p z a * boardLineMass mask L.val p a)/n :=
      Finset.sum_le_sum (fun L _ => physicalOutsideLineProxy_le_witness_mass mask hm a B hB ha L.val p)
    _ = _ := by rw [←Finset.sum_div,short_witness_mass_eq_stars Γ p H mask a B ha]

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.short_witness_mass_eq_stars
#print axioms NoThreeLine.BirthWitness.physicalOutsideShortProxy_le_stars
