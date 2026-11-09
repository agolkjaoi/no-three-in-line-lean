import NoThreeLine.AcceptedClockCauseBound

/-! Exact constants for the original designated family and the one frozen
time shortening. The chord capacity itself is certified separately. -/
set_option autoImplicit false
set_option maxRecDepth 10000
set_option maxHeartbeats 1700000
noncomputable section
namespace NoThreeLine
open PrimitiveLines FiniteDirections SpecifiedBoardCount

theorem gamma16_card_and_lineCount : gamma16.card=16 ∧ lineCountConstant gamma16=124 := by
  let shell (h : ℕ) : Finset ZPoint :=
    @Finset.filter ZPoint Primitive (fun d=>inferInstanceAs
      (Decidable (Nat.gcd d.1.natAbs d.2.natAbs=1))) (rawShell h)
  have hs : primitiveShell=shell := by
    funext h
    ext d
    simp only [primitiveShell,shell,Finset.mem_filter]
  have hΓ : gamma16=((Finset.Ico 1 4).sigma shell).image Sigma.snd := by
    unfold gamma16 directionIndices
    rw [hs]
  rw [hΓ]
  decide +kernel

namespace FrozenCapacity

theorem frozen_specified_capacity_gap :
    (249/250:ℝ)*(639781503/320000000)<255/128 := by norm_num

theorem frozen_specified_capacity_slack :
    (255/128:ℝ)-(249/250)*(639781503/320000000)=69405753/80000000000 := by norm_num

theorem exists_uniform_frozenClockSlack (T : ℝ) (hT : 0≤T) :
    ∃ lam δ : ℝ, 0<δ ∧ lam+T*δ<255/128 ∧
      ∃ N : ℕ, 0<N ∧ ∀n≥N,
        (249/250:ℝ)*(639781503/320000000)+((249/250)*12312)/(n:ℝ)≤lam :=
  exists_uniform_acceptedClockSlack (249/250) (639781503/320000000) (255/128) T
    frozen_specified_capacity_gap hT

end FrozenCapacity
end NoThreeLine

#print axioms NoThreeLine.gamma16_card_and_lineCount
#print axioms NoThreeLine.FrozenCapacity.frozen_specified_capacity_slack
#print axioms NoThreeLine.FrozenCapacity.exists_uniform_frozenClockSlack

