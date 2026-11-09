import NoThreeLine.BenchmarkAcceptedField
import NoThreeLine.ReferencePrefixBound

/-! Every root type has exactly three other types. Actual accepted-mask risk
is dominated by the corresponding full reference prefix, with the actual
duration scale appearing once in each field. No numerical root certificate
or whole-schedule acceptance is asserted by this general comparison. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators Interval

namespace NoThreeLine.BenchmarkTypedRisk
open FinitePhase FrozenReference BenchmarkAccepted

def otherType (root : Fin 4) (j : Fin 3) : Fin 4 := root.succAbove j

theorem otherType_ne (root : Fin 4) (j : Fin 3) : otherType root j ≠ root :=
  Fin.succAbove_ne root j

theorem otherType_injective (root : Fin 4) : Function.Injective (otherType root) :=
  Fin.succAbove_right_injective

theorem exists_otherType (root q : Fin 4) (hq : q ≠ root) : ∃j,otherType root j=q :=
  Fin.exists_succAbove_eq hq

theorem otherType_three (j : Fin 3) : otherType 3 j=j.castSucc :=
  Fin.succAbove_last_apply j

def actualPair {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T : ℝ) (root : Fin 4) (j : Fin 3)
    (x y : ℝ) : ℝ :=
  s.acceptedPrefix (fun i => (a i).phase) 32768 (commonGridLines 32768)
      (commonGridLines 32768) T root x y+
    s.acceptedPrefix (fun i => (a i).phase) 32768 (commonGridLines 32768)
      (commonGridLines 32768) T (otherType root j) x y

def pairWeight {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T : ℝ) (root : Fin 4) (j : Fin 3)
    (z : OutputIndex a) : ℝ :=
  prefixWeight s a T root z+prefixWeight s a T (otherType root j) z

theorem pairWeight_nonneg {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T : ℝ) (root : Fin 4) (j : Fin 3)
    (z : OutputIndex a) : 0≤pairWeight s a T root j z :=
  add_nonneg (prefixWeight_nonneg _ _ _ _ _) (prefixWeight_nonneg _ _ _ _ _)

theorem actualPair_eq_field {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T : ℝ) (hT : 0≤T)
    (root : Fin 4) (j : Fin 3) : actualPair s a T root j=
      eraseGrid (commonGridLines 32768) (commonGridLines 32768)
        (rectangleField Finset.univ (outputRect a) (pairWeight s a T root j)) := by
  funext x y
  exact acceptedPairPrefix_eq_outputField s a (by decide) T hT root (otherType root j) x y

def referencePair (last : Fin 15348) (root : Fin 4) (j : Fin 3) (x y : ℝ) : ℝ :=
  fullPhasePrefix last root x y+fullPhasePrefix last (otherType root j) x y

def referenceWeight (last : Fin 15348) (scale : ℝ) (root : Fin 4) (j : Fin 3)
    (cell : Grid 128) : ℝ :=
  scale*(fullTypeWeight last root cell+fullTypeWeight last (otherType root j) cell)

theorem referencePair_eq_field (last : Fin 15348) (scale : ℝ) (root : Fin 4) (j : Fin 3) :
    (fun x y => scale*referencePair last root j x y)=
      eraseGrid (commonGridLines 32768) (commonGridLines 32768)
        (rectangleField Finset.univ coarseGridRect (referenceWeight last scale root j)) := by
  funext x y
  unfold referencePair
  rw [fullPhasePrefix_eq_field,fullPhasePrefix_eq_field,←erased_rectangleField_add]
  classical
  by_cases hb : x∈commonGridLines 32768 ∨ y∈commonGridLines 32768
  · simp only [eraseGrid,if_pos hb,mul_zero]
  · simp only [eraseGrid,if_neg hb]
    exact (rectangleField_mul Finset.univ coarseGridRect
      (fun cell => fullTypeWeight last root cell+fullTypeWeight last (otherType root j) cell)
      scale x y).symm

theorem actualPair_le_reference {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀i,PhaseMatches (a i) (index i)) (hi : StrictMono index)
    (scale : ℝ) (hscale : 0≤scale)
    (hd : ∀i,s.duration i≤scale*((phaseUnits (index i) : ℝ)/100000000))
    (k : Fin J) (last : Fin 15348) (hkl : index k≤last)
    (T : ℝ) (hT : 0≤T) (hTk : T≤s.hi k) (root : Fin 4) (j : Fin 3) (x y : ℝ) :
    actualPair s a T root j x y≤scale*referencePair last root j x y := by
  have hr := acceptedPrefix_le_fullPhasePrefix s a index hm hi scale hscale hd k last hkl T hT hTk root x y
  have hj := acceptedPrefix_le_fullPhasePrefix s a index hm hi scale hscale hd k last hkl T hT hTk (otherType root j) x y
  simpa only [actualPair,referencePair,mul_add] using add_le_add hr hj

theorem directional_integral_le {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀i,PhaseMatches (a i) (index i)) (hi : StrictMono index)
    (scale : ℝ) (hscale : 0≤scale)
    (hd : ∀i,s.duration i≤scale*((phaseUnits (index i) : ℝ)/100000000))
    (k : Fin J) (last : Fin 15348) (hkl : index k≤last)
    (T : ℝ) (hT : 0≤T) (hTk : T≤s.hi k) (root : Fin 4) (j : Fin 3) (f : Fin 4) (x y : ℝ) :
    (∫u in (0 : ℝ)..1,(directionalChord f (actualPair s a T root j) x y u)^2)≤
      ∫u in (0 : ℝ)..1,(directionalChord f (fun b c=>scale*referencePair last root j b c) x y u)^2 := by
  classical
  have hdom (b c : ℝ) :
      eraseGrid (commonGridLines 32768) (commonGridLines 32768)
        (rectangleField Finset.univ (outputRect a) (pairWeight s a T root j)) b c≤
      eraseGrid (commonGridLines 32768) (commonGridLines 32768)
        (rectangleField Finset.univ coarseGridRect (referenceWeight last scale root j)) b c := by
    rw [←actualPair_eq_field s a T hT root j,←referencePair_eq_field last scale root j]
    exact actualPair_le_reference s a index hm hi scale hscale hd k last hkl T hT hTk root j b c
  rw [actualPair_eq_field s a T hT root j,referencePair_eq_field last scale root j]
  exact erased_directional_square_integral_le_of_erased_domination Finset.univ Finset.univ
    (outputRect a) coarseGridRect (pairWeight s a T root j) (referenceWeight last scale root j)
    (commonGridLines 32768) (commonGridLines 32768)
    (fun z _=>pairWeight_nonneg s a T root j z) hdom f x y

def actualRisk {J : ℕ} (D : ℝ) (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T : ℝ) (root : Fin 4) (x y : ℝ) : ℝ :=
  D/24*(∑j : Fin 3,∑f : Fin 4,∫u in (0 : ℝ)..1,
    (directionalChord f (actualPair s a T root j) x y u)^2)

def referenceRisk (D scale : ℝ) (last : Fin 15348) (root : Fin 4) (x y : ℝ) : ℝ :=
  D/24*(∑j : Fin 3,∑f : Fin 4,∫u in (0 : ℝ)..1,
    (directionalChord f (fun b c=>scale*referencePair last root j b c) x y u)^2)

theorem actualRisk_le_referenceRisk {J : ℕ} (D : ℝ) (hD : 0≤D) (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀i,PhaseMatches (a i) (index i)) (hi : StrictMono index)
    (scale : ℝ) (hscale : 0≤scale)
    (hd : ∀i,s.duration i≤scale*((phaseUnits (index i) : ℝ)/100000000))
    (k : Fin J) (last : Fin 15348) (hkl : index k≤last)
    (T : ℝ) (hT : 0≤T) (hTk : T≤s.hi k) (root : Fin 4) (x y : ℝ) :
    actualRisk D s a T root x y≤referenceRisk D scale last root x y := by
  unfold actualRisk referenceRisk
  apply mul_le_mul_of_nonneg_left _ (div_nonneg hD (by norm_num))
  exact Finset.sum_le_sum (fun j _=>Finset.sum_le_sum (fun f _=>
    directional_integral_le s a index hm hi scale hscale hd k last hkl T hT hTk root j f x y))

end NoThreeLine.BenchmarkTypedRisk

#print axioms NoThreeLine.BenchmarkTypedRisk.otherType_injective
#print axioms NoThreeLine.BenchmarkTypedRisk.exists_otherType
#print axioms NoThreeLine.BenchmarkTypedRisk.actualRisk_le_referenceRisk
