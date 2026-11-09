import NoThreeLine.Phase15301AcceptedLeaf

/-! At every real root, the actual accepted-prefix risk is bounded by the
reconstructed reference-prefix risk. This comparison contains no numerical
leaf assumption; root-box bounds are applied separately. -/
set_option autoImplicit false
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.Phase15301AcceptedLeaf
open FinitePhase FrozenReference BenchmarkAccepted

theorem normalized_pair_dominated {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀i,PhaseMatches (a i) (index i)) (hi : StrictMono index)
    (hd : ∀i,s.duration i≤(Phase15301Leaf.densityScale : ℝ)*
      ((phaseUnits (index i) : ℝ)/100000000))
    (k : Fin J) (hkl : index k≤15301) (T : ℝ) (hT : 0≤T) (hTk : T≤s.hi k)
    (j : Fin 3) (x y : ℝ) :
    eraseGrid (commonGridLines 32768) (commonGridLines 32768)
        (rectangleField Finset.univ (outputRect a) (normalizedPairWeight s a T j)) x y ≤
      eraseGrid (commonGridLines 32768) (commonGridLines 32768) (Phase15301Leaf.fields j) x y := by
  have h3 := acceptedPrefix_le_fullPhasePrefix s a index hm hi
    (Phase15301Leaf.densityScale : ℝ) scale_pos.le hd k 15301 hkl T hT hTk 3 x y
  have hj := acceptedPrefix_le_fullPhasePrefix s a index hm hi
    (Phase15301Leaf.densityScale : ℝ) scale_pos.le hd k 15301 hkl T hT hTk j.castSucc x y
  have hp : actualPair s a T j x y≤
      (Phase15301Leaf.densityScale : ℝ)*Phase15301FrozenLeaf.frozenPair j x y := by
    simpa only [actualPair,Phase15301FrozenLeaf.frozenPair,mul_add] using add_le_add h3 hj
  rw [actualPair_eq_scale_mul s a T hT,←Phase15301FrozenLeaf.erased_fields_eq j] at hp
  exact le_of_mul_le_mul_left hp scale_pos

theorem actualRisk_le_directRisk {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀i,PhaseMatches (a i) (index i)) (hi : StrictMono index)
    (hd : ∀i,s.duration i≤(Phase15301Leaf.densityScale : ℝ)*
      ((phaseUnits (index i) : ℝ)/100000000))
    (k : Fin J) (hkl : index k≤15301) (T : ℝ) (hT : 0≤T) (hTk : T≤s.hi k)
    (x y : ℝ) : actualRisk s a T x y≤Phase15301Leaf.directRisk x y := by
  classical
  have hb (j : Fin 3) (f : Fin 4) :
      (∫u in (0 : ℝ)..1,(directionalChord f
        (rectangleField Finset.univ (outputRect a) (normalizedPairWeight s a T j)) x y u)^2) ≤
      ∫u in (0 : ℝ)..1,(directionalChord f (Phase15301Leaf.fields j) x y u)^2 := by
    have hw (j : Fin 3) (z : OutputIndex a) (_ : z∈(Finset.univ : Finset (OutputIndex a))) :
        0≤normalizedPairWeight s a T j z := normalizedPairWeight_nonneg s a T j z
    have hdom := normalized_pair_dominated s a index hm hi hd k hkl T hT hTk
    fin_cases j
    · exact directional_square_integral_le_of_erased_domination Finset.univ Finset.univ
        (outputRect a) (fun i=>(Phase15301Original.rectangles0 i).real) (normalizedPairWeight s a T 0)
        (fun i=>(Phase15301Original.weights0 i : ℝ)) (commonGridLines 32768) (commonGridLines 32768)
        (hw 0) (hdom 0) f x y
    · exact directional_square_integral_le_of_erased_domination Finset.univ Finset.univ
        (outputRect a) (fun i=>(Phase15301Original.rectangles1 i).real) (normalizedPairWeight s a T 1)
        (fun i=>(Phase15301Original.weights1 i : ℝ)) (commonGridLines 32768) (commonGridLines 32768)
        (hw 1) (hdom 1) f x y
    · exact directional_square_integral_le_of_erased_domination Finset.univ Finset.univ
        (outputRect a) (fun i=>(Phase15301Original.rectangles2 i).real) (normalizedPairWeight s a T 2)
        (fun i=>(Phase15301Original.weights2 i : ℝ)) (commonGridLines 32768) (commonGridLines 32768)
        (hw 2) (hdom 2) f x y
  unfold actualRisk
  simp_rw [actualPair_eq_scaledField s a T hT,directionalChord_eraseGrid_square_integral_eq,
    Phase15301Leaf.directionalChord_mul,mul_pow,intervalIntegral.integral_const_mul]
  simp only [←Finset.mul_sum]
  have hc : (Phase15301Leaf.sieveDensityBound : ℝ)/24*(Phase15301Leaf.densityScale : ℝ)^2=
      (Phase15301Leaf.riskWeight : ℝ) := by
    norm_num [Phase15301Leaf.sieveDensityBound,Phase15301Leaf.densityScale,Phase15301Leaf.riskWeight]
  rw [←mul_assoc,hc]
  unfold Phase15301Leaf.directRisk
  apply mul_le_mul_of_nonneg_left
  · exact Finset.sum_le_sum (fun j _=>Finset.sum_le_sum (fun f _=>hb j f))
  · norm_num [Phase15301Leaf.riskWeight,Phase15301Leaf.sieveDensityBound,Phase15301Leaf.densityScale]

theorem frozenRisk_eq_directRisk (x y : ℝ) :
    Phase15301FrozenLeaf.frozenRisk x y=Phase15301Leaf.directRisk x y := by
  simpa only [Phase15301Leaf.scaledErasedRisk,Phase15301FrozenLeaf.scaled_field_eq,
    Phase15301FrozenLeaf.frozenRisk] using
    Phase15301Leaf.scaledErasedRisk_eq (commonGridLines 32768) (commonGridLines 32768) x y

theorem actualRisk_le_frozenRisk {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀i,PhaseMatches (a i) (index i)) (hi : StrictMono index)
    (hd : ∀i,s.duration i≤(Phase15301Leaf.densityScale : ℝ)*
      ((phaseUnits (index i) : ℝ)/100000000))
    (k : Fin J) (hkl : index k≤15301) (T : ℝ) (hT : 0≤T) (hTk : T≤s.hi k)
    (x y : ℝ) : actualRisk s a T x y≤Phase15301FrozenLeaf.frozenRisk x y := by
  rw [frozenRisk_eq_directRisk]
  exact actualRisk_le_directRisk s a index hm hi hd k hkl T hT hTk x y

end NoThreeLine.Phase15301AcceptedLeaf

#print axioms NoThreeLine.Phase15301AcceptedLeaf.actualRisk_le_frozenRisk
