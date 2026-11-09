import NoThreeLine.StateRestartLaw

/-! Exact finite-state laws for a measurable transition driven by iid noise.
These are measure identities, separate from any credit or termination claim. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Function

namespace NoThreeLine.FiniteTransitionLaw
open GenericCreditIteration

def stateLaw {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (φ : S × W → S) (ν : Measure W) (s : S) : ℕ → Measure S
  | 0 => Measure.dirac s
  | k+1 => ((stateLaw φ ν s k).prod ν).map φ

theorem stateLaw_probability {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (φ : S × W → S) (hφ : Measurable φ) (ν : Measure W) [IsProbabilityMeasure ν]
    (s : S) (k : ℕ) : IsProbabilityMeasure (stateLaw φ ν s k) := by
  induction k with
  | zero => exact Measure.dirac.isProbabilityMeasure
  | succ k ih =>
    letI := ih
    exact Measure.isProbabilityMeasure_map hφ.aemeasurable

theorem finiteState_map {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (φ : S × W → S) (hφ : Measurable φ) (ν : Measure W) [IsProbabilityMeasure ν]
    (s : S) (k : ℕ) :
    (Measure.pi (fun _ : Fin k => ν)).map (finiteState φ k s) = stateLaw φ ν s k := by
  induction k with
  | zero => simp [finiteState,stateLaw]
  | succ k ih =>
    have hfs := finiteState_fixed_measurable φ hφ k s
    have hn := finiteState_fixed_measurable φ hφ (k+1) s
    have hsnoc := fin_snoc_preserving ν k
    have hm : Measurable (fun z : (Fin k → W) × W => (finiteState φ k s z.1,z.2)) :=
      (hfs.comp measurable_fst).prodMk measurable_snd
    have hp : ((Measure.pi (fun _ : Fin k => ν)).map (finiteState φ k s)).prod ν =
        ((Measure.pi (fun _ : Fin k => ν)).prod ν).map
          (fun z : (Fin k → W) × W => (finiteState φ k s z.1,z.2)) := by
      simpa only [Measure.map_id,Prod.map_def,id_eq] using
        Measure.map_prod_map (Measure.pi (fun _ : Fin k => ν)) ν hfs measurable_id
    change _ = ((stateLaw φ ν s k).prod ν).map φ
    rw [← hsnoc.map_eq,Measure.map_map hn hsnoc.measurable,← ih,hp,
      Measure.map_map hφ hm]
    congr 1
    funext z
    exact finiteState_snoc φ k s z.1 z.2

theorem noiseState_map {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (φ : S × W → S) (hφ : Measurable φ) (ν : Measure W) [IsProbabilityMeasure ν]
    (s : S) (k : ℕ) :
    (Measure.infinitePi (fun _ : ℕ => ν)).map (noiseState φ s k) = stateLaw φ ν s k := by
  change (Measure.infinitePi (fun _ : ℕ => ν)).map ((finiteState φ k s) ∘ noisePrefix k) = _
  rw [← Measure.map_map (finiteState_fixed_measurable φ hφ k s) (noisePrefix_measurable k),
    noisePrefix_map ν k,finiteState_map φ hφ ν s k]

end NoThreeLine.FiniteTransitionLaw

#print axioms NoThreeLine.FiniteTransitionLaw.finiteState_map
#print axioms NoThreeLine.FiniteTransitionLaw.noiseState_map
