import NoThreeLine.RecycledNoiseLaw
import NoThreeLine.TerminalResidualLaw

/-! A measurable transition can carry its full discrete state history.
The original residual-noise factorization survives this explicit memory lift. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.RememberedRestart

abbrev Memory (S : Type*) := (ℕ × S) × (ℕ → S)

def initial {S : Type*} (s : S) : Memory S := ((0,s),fun _ => s)

def remember {S : Type*} (a : Memory S) (s : S) : Memory S :=
  ((a.1.1+1,s),fun j => if j = a.1.1+1 then s else a.2 j)

theorem remember_measurable {S : Type*} [MeasurableSpace S] :
    Measurable (fun a : Memory S × S => remember a.1 a.2) := by
  have hi : Measurable (fun a : Memory S × S => a.1.1.1+1) :=
    (measurable_of_countable (fun j : ℕ => j+1)).comp measurable_fst.fst.fst
  refine (hi.prodMk measurable_snd).prodMk (measurable_pi_lambda _ (fun j => ?_))
  exact Measurable.ite (measurableSet_setOf.mpr (measurable_const.eq hi))
    measurable_snd ((measurable_pi_apply j).comp measurable_fst.snd)

def lift {S W : Type*} (F : S × W → S × W) (a : Memory S × W) : Memory S × W :=
  let r := F (a.1.1.2,a.2)
  (remember a.1 r.1,r.2)

def liftState {S V : Type*} (ψ : S × V → S) (a : Memory S × V) : Memory S :=
  remember a.1 (ψ (a.1.1.2,a.2))

theorem lift_measurable {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) : Measurable (lift F) := by
  have hr : Measurable (fun a : Memory S × W => F (a.1.1.2,a.2)) :=
    hF.comp (measurable_fst.fst.snd.prodMk measurable_snd)
  exact (remember_measurable.comp (measurable_fst.prodMk hr.fst)).prodMk hr.snd

theorem liftState_measurable {S V : Type*} [MeasurableSpace S] [MeasurableSpace V]
    (ψ : S × V → S) (hψ : Measurable ψ) : Measurable (liftState ψ) :=
  remember_measurable.comp (measurable_fst.prodMk
    (hψ.comp (measurable_fst.fst.snd.prodMk measurable_snd)))

theorem lift_map {S W V : Type*}
    [MeasurableSpace S] [MeasurableSpace W] [MeasurableSpace V]
    (F : S × W → S × W) (hF : Measurable F) (ψ : S × V → S) (hψ : Measurable ψ)
    (ν : Measure W) (ρ : Measure V) [IsProbabilityMeasure ν] [IsProbabilityMeasure ρ]
    (hsection : ∀ s, ν.map (fun w => F (s,w)) =
      (ρ.map (fun v => ψ (s,v))).prod ν) (a : Memory S) :
    ν.map (fun w => lift F (a,w)) = (ρ.map (fun v => liftState ψ (a,v))).prod ν := by
  have hr : Measurable (remember a) := remember_measurable.comp (measurable_const.prodMk measurable_id)
  have hp : Measurable (fun r : S × W => (remember a r.1,r.2)) :=
    (hr.comp measurable_fst).prodMk measurable_snd
  have hs : Measurable (fun w : W => F (a.1.2,w)) := hF.comp (measurable_const.prodMk measurable_id)
  have ht : Measurable (fun v : V => ψ (a.1.2,v)) := hψ.comp (measurable_const.prodMk measurable_id)
  letI : IsProbabilityMeasure (ρ.map (fun v => ψ (a.1.2,v))) :=
    Measure.isProbabilityMeasure_map ht.aemeasurable
  have h := congrArg (fun μ : Measure (S × W) => μ.map (fun r => (remember a r.1,r.2))) (hsection a.1.2)
  rw [Measure.map_map hp hs,map_pair_with_fresh_right _ _ _ hr,Measure.map_map hr ht] at h
  exact h

def memoryOf {S : Type*} (s : S) (f : ℕ → S) (k : ℕ) : Memory S :=
  ((k,f k),fun j => if j ≤ k then f j else s)

theorem memoryOf_zero {S : Type*} (s : S) (f : ℕ → S) (h : f 0 = s) : memoryOf s f 0 = initial s := by
  apply Prod.ext
  · simp [memoryOf,initial,h]
  · funext j
    by_cases hj : j = 0
    · subst j
      simp [memoryOf,initial,h]
    · simp [memoryOf,initial,hj]

theorem memoryOf_succ {S : Type*} (s : S) (f : ℕ → S) (k : ℕ) :
    remember (memoryOf s f k) (f (k+1)) = memoryOf s f (k+1) := by
  apply Prod.ext
  · rfl
  · funext j
    change (if j = k+1 then f (k+1) else if j ≤ k then f j else s) = if j ≤ k+1 then f j else s
    by_cases hj : j = k+1
    · subst j
      simp
    · have he : j ≤ k+1 ↔ j ≤ k := by omega
      simp [hj,he]

theorem iterate_lift {S W : Type*} (F : S × W → S × W) (s : S) (k : ℕ) (w : W) :
    RecycledBoardProcess.iterate (lift F) (initial s) k w =
      (memoryOf s (fun j => (RecycledBoardProcess.iterate F s j w).1) k,
        (RecycledBoardProcess.iterate F s k w).2) := by
  induction k with
  | zero =>
    rw [memoryOf_zero s _ rfl]
    rfl
  | succ k ih =>
    rw [RecycledBoardProcess.iterate,ih]
    change (remember (memoryOf s (fun j => (RecycledBoardProcess.iterate F s j w).1) k)
      (RecycledBoardProcess.iterate F s (k+1) w).1,(RecycledBoardProcess.iterate F s (k+1) w).2) = _
    rw [memoryOf_succ]

theorem noiseState_lift {S V : Type*} (ψ : S × V → S) (s : S) (k : ℕ) (v : ℕ → V) :
    GenericCreditIteration.noiseState (liftState ψ) (initial s) k v =
      memoryOf s (fun j => GenericCreditIteration.noiseState ψ s j v) k := by
  induction k with
  | zero =>
    rw [memoryOf_zero s _ rfl]
    rfl
  | succ k ih =>
    rw [GenericCreditIteration.noiseState_succ,ih]
    change remember (memoryOf s (fun j => GenericCreditIteration.noiseState ψ s j v) k)
      (GenericCreditIteration.noiseState ψ s (k+1) v) = _
    rw [memoryOf_succ]

end NoThreeLine.RememberedRestart

#print axioms NoThreeLine.RememberedRestart.lift_map
#print axioms NoThreeLine.RememberedRestart.iterate_lift
#print axioms NoThreeLine.RememberedRestart.noiseState_lift
