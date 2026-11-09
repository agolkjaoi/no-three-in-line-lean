import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Literal nonaxis specified-line chord checks in canonical chart 0. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.SpecifiedNonaxisCapacityChart0
open FrozenCapacity

def terms_m1h1r0s3 (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (1*(y+cy)-1*(x+cx),sign*(cellUnits 0 p+cellUnits 3 p))

theorem checked_m1h1r0s3 : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 0 3)
    (1/1) 16 1600000000 (197/50:ℚ) terms_m1h1r0s3 (-16) 32 6304000000=true := by
  decide +kernel

theorem capacity_m1h1r0s3 (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 3 p:ℝ))) x y (1/1)/2 ≤ (197/100:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 3) 0
    (1/1) 16 1600000000 (197/50:ℚ) terms_m1h1r0s3 (-16) 32 6304000000 checked_m1h1r0s3 x y
  norm_num at h
  linarith

def terms_m1h1r1s2 (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (1*(y+cy)-1*(x+cx),sign*(cellUnits 1 p+cellUnits 2 p))

theorem checked_m1h1r1s2 : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 1 2)
    (1/1) 16 1600000000 (197/50:ℚ) terms_m1h1r1s2 (-16) 32 6304000000=true := by
  decide +kernel

theorem capacity_m1h1r1s2 (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (1/1)/2 ≤ (197/100:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 1 2) 0
    (1/1) 16 1600000000 (197/50:ℚ) terms_m1h1r1s2 (-16) 32 6304000000 checked_m1h1r1s2 x y
  norm_num at h
  linarith

def terms_m1h2r0s2 (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (2*(y+cy)-1*(x+cx),sign*(cellUnits 0 p+cellUnits 2 p))

theorem checked_m1h2r0s2 : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 0 2)
    (1/2) 32 1600000000 (197/25:ℚ) terms_m1h2r0s2 (-16) 48 12608000000=true := by
  decide +kernel

theorem capacity_m1h2r0s2 (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 2 p:ℝ))) x y (1/2)/4 ≤ (197/100:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 2) 0
    (1/2) 32 1600000000 (197/25:ℚ) terms_m1h2r0s2 (-16) 48 12608000000 checked_m1h2r0s2 x y
  norm_num at h
  linarith

def terms_m1h2r1s3 (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (2*(y+cy)-1*(x+cx),sign*(cellUnits 1 p+cellUnits 3 p))

theorem checked_m1h2r1s3 : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 1 3)
    (1/2) 32 1600000000 (197/25:ℚ) terms_m1h2r1s3 (-16) 48 12608000000=true := by
  decide +kernel

theorem capacity_m1h2r1s3 (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 3 p:ℝ))) x y (1/2)/4 ≤ (197/100:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 1 3) 0
    (1/2) 32 1600000000 (197/25:ℚ) terms_m1h2r1s3 (-16) 48 12608000000 checked_m1h2r1s3 x y
  norm_num at h
  linarith

def terms_m1h3r0s3 (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (3*(y+cy)-1*(x+cx),sign*(cellUnits 0 p+cellUnits 3 p))

theorem checked_m1h3r0s3 : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 0 3)
    (1/3) 48 1600000000 (591/50:ℚ) terms_m1h3r0s3 (-16) 64 18912000000=true := by
  decide +kernel

theorem capacity_m1h3r0s3 (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 3 p:ℝ))) x y (1/3)/6 ≤ (197/100:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 3) 0
    (1/3) 48 1600000000 (591/50:ℚ) terms_m1h3r0s3 (-16) 64 18912000000 checked_m1h3r0s3 x y
  norm_num at h
  linarith

def terms_m1h3r1s2 (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (3*(y+cy)-1*(x+cx),sign*(cellUnits 1 p+cellUnits 2 p))

theorem checked_m1h3r1s2 : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 1 2)
    (1/3) 48 1600000000 (591/50:ℚ) terms_m1h3r1s2 (-16) 64 18912000000=true := by
  decide +kernel

theorem capacity_m1h3r1s2 (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (1/3)/6 ≤ (197/100:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 1 2) 0
    (1/3) 48 1600000000 (591/50:ℚ) terms_m1h3r1s2 (-16) 64 18912000000 checked_m1h3r1s2 x y
  norm_num at h
  linarith

def terms_m2h3r0s1 (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (3*(y+cy)-2*(x+cx),sign*(cellUnits 0 p+cellUnits 1 p))

theorem checked_m2h3r0s1 : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 0 1)
    (2/3) 48 3200000000 (591/50:ℚ) terms_m2h3r0s1 (-32) 80 37824000000=true := by
  decide +kernel

theorem capacity_m2h3r0s1 (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 1 p:ℝ))) x y (2/3)/6 ≤ (197/100:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 1) 0
    (2/3) 48 3200000000 (591/50:ℚ) terms_m2h3r0s1 (-32) 80 37824000000 checked_m2h3r0s1 x y
  norm_num at h
  linarith

def terms_m2h3r2s3 (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (3*(y+cy)-2*(x+cx),sign*(cellUnits 2 p+cellUnits 3 p))

theorem checked_m2h3r2s3 : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 2 3)
    (2/3) 48 3200000000 (591/50:ℚ) terms_m2h3r2s3 (-32) 80 37824000000=true := by
  decide +kernel

theorem capacity_m2h3r2s3 (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 2 3 p:ℝ))) x y (2/3)/6 ≤ (197/100:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 2 3) 0
    (2/3) 48 3200000000 (591/50:ℚ) terms_m2h3r2s3 (-32) 80 37824000000 checked_m2h3r2s3 x y
  norm_num at h
  linarith

end NoThreeLine.SpecifiedNonaxisCapacityChart0
#print axioms NoThreeLine.SpecifiedNonaxisCapacityChart0.capacity_m1h1r0s3
#print axioms NoThreeLine.SpecifiedNonaxisCapacityChart0.capacity_m1h1r1s2
#print axioms NoThreeLine.SpecifiedNonaxisCapacityChart0.capacity_m1h2r0s2
#print axioms NoThreeLine.SpecifiedNonaxisCapacityChart0.capacity_m1h2r1s3
#print axioms NoThreeLine.SpecifiedNonaxisCapacityChart0.capacity_m1h3r0s3
#print axioms NoThreeLine.SpecifiedNonaxisCapacityChart0.capacity_m1h3r1s2
#print axioms NoThreeLine.SpecifiedNonaxisCapacityChart0.capacity_m2h3r0s1
#print axioms NoThreeLine.SpecifiedNonaxisCapacityChart0.capacity_m2h3r2s3
