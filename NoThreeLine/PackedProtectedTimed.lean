import NoThreeLine.ProtectedPhaseBoundary

/-! Put timed ledgers from different scheduled phases in a common
measurable state space, retaining the actual remaining time. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine

def packProtectedTimed {n : ℕ} (cfg : FlowConfig n) (v : ProtectedTimedState cfg) :
    ProtectedPhaseState n cfg.B :=
  (augTimedStateProjection cfg v.1,(v.2,v.1.val.2))

theorem packProtectedTimed_measurable {n : ℕ} (cfg : FlowConfig n) :
    Measurable (packProtectedTimed cfg) :=
  ((augTimedStateProjection_measurable cfg).comp measurable_fst).prodMk
    (measurable_snd.prodMk (measurable_subtype_coe.snd.comp measurable_fst))

def unpackProtectedTimed {n : ℕ} (cfg : FlowConfig n) (a : ProtectedPhaseState n cfg.B) :
    ProtectedTimedState cfg :=
  (⟨(a.1.val,max 0 (min (cfg.horizon:ℝ) a.2.2)),a.1.property,le_max_left _ _,
      max_le cfg.horizon.coe_nonneg (min_le_left _ _)⟩,a.2.1)

theorem unpackProtectedTimed_measurable {n : ℕ} (cfg : FlowConfig n) :
    Measurable (unpackProtectedTimed cfg) := by
  have hr : Measurable (fun a : ProtectedPhaseState n cfg.B=>max 0 (min (cfg.horizon:ℝ) a.2.2)) :=
    measurable_const.max (measurable_const.min measurable_snd.snd)
  exact ((measurable_subtype_coe.comp measurable_fst).prodMk hr).subtype_mk.prodMk measurable_snd.fst

theorem unpackProtectedTimed_pack {n : ℕ} (cfg : FlowConfig n) (v : ProtectedTimedState cfg) :
    unpackProtectedTimed cfg (packProtectedTimed cfg v)=v := by
  apply Prod.ext
  · apply Subtype.ext
    exact Prod.ext rfl (by
      change max 0 (min (cfg.horizon:ℝ) v.1.val.2)=v.1.val.2
      rw [min_eq_right v.1.property.2.2,max_eq_right v.1.property.2.1])
  · rfl

theorem unpackProtectedTimed_phaseStart {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (e : ValidAugmentedState n cfg.B) (saved : Grid n→ℝ) :
    unpackProtectedTimed cfg (e,(saved,cfg.horizon))=(augPhaseStart cfg ε M e,saved) := by
  exact unpackProtectedTimed_pack cfg (augPhaseStart cfg ε M e,saved)

end NoThreeLine

#print axioms NoThreeLine.unpackProtectedTimed_pack
#print axioms NoThreeLine.unpackProtectedTimed_measurable
