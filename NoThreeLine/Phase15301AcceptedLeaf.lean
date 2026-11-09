import NoThreeLine.BenchmarkAcceptedField
import NoThreeLine.Phase15301FrozenLeaf

/-! Transfer the one frozen-reference leaf to actual accepted-mask prefixes.
The finite inputs supply union witnesses, chronological reference matches and
actual duration comparisons. These hypotheses are structural input facts;
no chord, angular integral, or numerical risk bound is a premise. The theorem
is for this one root box and a cut no later than phase15301. -/
set_option autoImplicit false
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.Phase15301AcceptedLeaf
open FinitePhase FrozenReference BenchmarkAccepted

def actualPair {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T : ℝ) (j : Fin 3)
    (x y : ℝ) : ℝ :=
  s.acceptedPrefix (fun i => (a i).phase) 32768 (commonGridLines 32768)
      (commonGridLines 32768) T 3 x y+
    s.acceptedPrefix (fun i => (a i).phase) 32768 (commonGridLines 32768)
      (commonGridLines 32768) T j.castSucc x y

def normalizedPairWeight {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T : ℝ) (j : Fin 3)
    (z : OutputIndex a) : ℝ :=
  (prefixWeight s a T 3 z+prefixWeight s a T j.castSucc z)/
    (Phase15301Leaf.densityScale : ℝ)

theorem scale_pos : (0 : ℝ)<(Phase15301Leaf.densityScale : ℝ) := by
  norm_num [Phase15301Leaf.densityScale]

theorem normalizedPairWeight_nonneg {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T : ℝ) (j : Fin 3)
    (z : OutputIndex a) : 0≤normalizedPairWeight s a T j z :=
  div_nonneg (add_nonneg (prefixWeight_nonneg _ _ _ _ _)
    (prefixWeight_nonneg _ _ _ _ _)) scale_pos.le

theorem actualPair_eq_scaledField {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T : ℝ) (hT : 0≤T)
    (j : Fin 3) : actualPair s a T j =
      eraseGrid (commonGridLines 32768) (commonGridLines 32768)
        (fun x y => (Phase15301Leaf.densityScale : ℝ)*
          rectangleField Finset.univ (outputRect a) (normalizedPairWeight s a T j) x y) := by
  funext x y
  rw [actualPair,acceptedPairPrefix_eq_outputField s a (by decide) T hT]
  have hw (z : OutputIndex a) :
      (Phase15301Leaf.densityScale : ℝ)*normalizedPairWeight s a T j z =
        prefixWeight s a T 3 z+prefixWeight s a T j.castSucc z := by
    unfold normalizedPairWeight
    exact mul_div_cancel₀ _ (ne_of_gt scale_pos)
  have he : (fun x y => (Phase15301Leaf.densityScale : ℝ)*
      rectangleField Finset.univ (outputRect a) (normalizedPairWeight s a T j) x y) =
      rectangleField Finset.univ (outputRect a)
        (fun z => prefixWeight s a T 3 z+prefixWeight s a T j.castSucc z) := by
    funext x y
    rw [← rectangleField_mul]
    simp only [hw]
  rw [he]

theorem actualPair_eq_scale_mul {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T : ℝ) (hT : 0≤T)
    (j : Fin 3) (x y : ℝ) : actualPair s a T j x y =
      (Phase15301Leaf.densityScale : ℝ)*
        eraseGrid (commonGridLines 32768) (commonGridLines 32768)
          (rectangleField Finset.univ (outputRect a) (normalizedPairWeight s a T j)) x y := by
  rw [actualPair_eq_scaledField s a T hT]
  classical
  unfold eraseGrid
  split_ifs <;> simp

def actualRisk {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T x y : ℝ) : ℝ :=
  (Phase15301Leaf.sieveDensityBound : ℝ)/24*(∑ j : Fin 3, ∑ f : Fin 4,
    ∫ u in (0 : ℝ)..1, (directionalChord f (actualPair s a T j) x y u)^2)

theorem uniform_actual_risk {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀ i, PhaseMatches (a i) (index i)) (hi : StrictMono index)
    (hd : ∀ i, s.duration i≤(Phase15301Leaf.densityScale : ℝ)*
      ((phaseUnits (index i) : ℝ)/100000000))
    (k : Fin J) (hkl : index k≤15301) (T : ℝ) (hT : 0≤T) (hTk : T≤s.hi k)
    (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y∈Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1) :
    actualRisk s a T x y<(Phase15301Leaf.threshold : ℝ) := by
  classical
  have hdom (j : Fin 3) (b c : ℝ) :
      eraseGrid (commonGridLines 32768) (commonGridLines 32768)
          (rectangleField Finset.univ (outputRect a) (normalizedPairWeight s a T j)) b c ≤
        eraseGrid (commonGridLines 32768) (commonGridLines 32768) (Phase15301Leaf.fields j) b c := by
    have h3 := acceptedPrefix_le_fullPhasePrefix s a index hm hi
      (Phase15301Leaf.densityScale : ℝ) scale_pos.le hd k 15301 hkl T hT hTk 3 b c
    have hj := acceptedPrefix_le_fullPhasePrefix s a index hm hi
      (Phase15301Leaf.densityScale : ℝ) scale_pos.le hd k 15301 hkl T hT hTk j.castSucc b c
    have hp : actualPair s a T j b c≤
        (Phase15301Leaf.densityScale : ℝ)*Phase15301FrozenLeaf.frozenPair j b c := by
      simpa only [actualPair,Phase15301FrozenLeaf.frozenPair,mul_add] using add_le_add h3 hj
    rw [actualPair_eq_scale_mul s a T hT] at hp
    rw [← Phase15301FrozenLeaf.erased_fields_eq j] at hp
    exact le_of_mul_le_mul_left hp scale_pos
  have hh := Phase15301Leaf.uniform_scaled_dominated_risk Finset.univ
    (fun _ => outputRect a) (normalizedPairWeight s a T)
    (commonGridLines 32768) (commonGridLines 32768)
    (fun j z _ => normalizedPairWeight_nonneg s a T j z) hdom x y hx hy
  simpa only [actualRisk,actualPair_eq_scaledField s a T hT] using hh

end NoThreeLine.Phase15301AcceptedLeaf

#print axioms NoThreeLine.Phase15301AcceptedLeaf.uniform_actual_risk
