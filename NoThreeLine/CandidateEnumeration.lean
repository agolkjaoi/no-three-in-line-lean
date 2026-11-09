import NoThreeLine.CandidateConsumption

/-! Repeated earliest-candidate restart enumerates exactly the original
site/index candidates in strictly increasing absolute time, almost surely.
The existing finite-arrival theorem supplies non-explosion. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped BigOperators

namespace NoThreeLine.CandidateEnumeration
open CandidateConsumption RestartPathIdentities BoardFirstCandidate BoardWinnerLaw WinnerMarkLaw

theorem scheduled_time_le_pending {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (k : ℕ) (q : Grid n) :
    elapsed hn ω (k+1) ≤ candidateTime (ω q).1 (siteCount hn ω k q) := by
  have hm := firstTime_le_firstWait hn (boardAfter hn k ω) q
  have hi := candidateTime_invariant hn ω k q 0
  simp only [Nat.zero_add, candidateTime_zero] at hi
  rw [firstWait_eq] at hm
  change elapsed hn ω k + firstTime hn (boardAfter hn k ω) ≤ _
  linarith

theorem scheduled_time_tendsto {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (hp : PositiveSteps hn ω)
    (hfin : ∀ T : ℝ, Set.Finite {z : Grid n × ℕ | candidateTime (ω z.1).1 z.2 ≤ T}) :
    Tendsto (fun k => elapsed hn ω (k+1)) atTop atTop := by
  apply tendsto_atTop.mpr
  intro T
  have hf : Set.Finite {k : ℕ | elapsed hn ω (k+1) ≤ T} := by
    have h := Set.Finite.preimage (scheduledIndex_injective hn ω hp).injOn (hfin T)
    simpa only [Set.preimage_setOf_eq, scheduled_time] using h
  filter_upwards [hf.eventually_cofinite_notMem.filter_mono atTop_le_cofinite] with k hk
  change ¬ elapsed hn ω (k+1) ≤ T at hk
  exact (lt_of_not_ge hk).le

theorem siteCount_unbounded {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (hdiv : Tendsto (fun k => elapsed hn ω (k+1)) atTop atTop)
    (hmono : ∀ q : Grid n, StrictMono (candidateTime (ω q).1)) (q : Grid n) (j : ℕ) :
    ∃ k, j < siteCount hn ω k q := by
  by_contra! hcount
  obtain ⟨k,hk⟩ := (hdiv.eventually (eventually_gt_atTop (candidateTime (ω q).1 j))).exists
  have hb := (scheduled_time_le_pending hn ω k q).trans ((hmono q).monotone (hcount k))
  exact (not_lt_of_ge hb) hk

theorem scheduledIndex_surjective {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (hdiv : Tendsto (fun k => elapsed hn ω (k+1)) atTop atTop)
    (hmono : ∀ q : Grid n, StrictMono (candidateTime (ω q).1)) :
    Surjective (scheduledIndex hn ω) := by
  classical
  rintro ⟨q,j⟩
  have hc := siteCount_unbounded hn ω hdiv hmono q j
  have hm : j < siteCount hn ω (Nat.find hc) q := Nat.find_spec hc
  have hm0 : Nat.find hc ≠ 0 := by
    intro he
    rw [he] at hm
    simp [siteCount] at hm
  obtain ⟨k,hk⟩ := Nat.exists_eq_succ_of_ne_zero hm0
  have hl : siteCount hn ω k q ≤ j :=
    Nat.le_of_not_gt (Nat.find_min hc (by omega))
  rw [hk] at hm
  change j < siteCount hn ω (k+1) q at hm
  have hb := (siteCount_step_le hn ω k q).2
  have hecount : siteCount hn ω k q = j := by omega
  have hwin : winner hn (boardAfter hn k ω) = q := by
    by_contra hne
    have hi : consumedAt hn (boardAfter hn k ω) q = 0 := by
      simp [consumedAt, Ne.symm hne]
    rw [siteCount, hi, Nat.add_zero] at hm
    omega
  refine ⟨k, ?_⟩
  simp [scheduledIndex, hwin, hecount]

def originalEvent {n : ℕ} (ω : BoardClockPath n) (z : Grid n × ℕ) : (ℝ × Grid n) × ℝ :=
  ((candidateTime (ω z.1).1 z.2,z.1),candidateMark ω z)

def absoluteEvent {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) (k : ℕ) : (ℝ × Grid n) × ℝ :=
  ((elapsed hn ω (k+1),winner hn (boardAfter hn k ω)),winnerMark hn (boardAfter hn k ω))

theorem absoluteEvent_eq_original {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) (k : ℕ) :
    absoluteEvent hn ω k = originalEvent ω (scheduledIndex hn ω k) := by
  unfold absoluteEvent originalEvent
  rw [scheduled_time, scheduled_mark]
  rfl

theorem absoluteEvent_range {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (hs : Surjective (scheduledIndex hn ω)) :
    Set.range (absoluteEvent hn ω) = Set.range (originalEvent ω) := by
  ext e
  constructor
  · rintro ⟨k,rfl⟩
    exact ⟨scheduledIndex hn ω k,(absoluteEvent_eq_original hn ω k).symm⟩
  · rintro ⟨z,rfl⟩
    obtain ⟨k,rfl⟩ := hs z
    exact ⟨k,absoluteEvent_eq_original hn ω k⟩

theorem exact_candidate_enumeration_ae {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂boardClockMeasure n rate,
      Bijective (scheduledIndex hn ω) ∧
      StrictMono (fun k => elapsed hn ω (k+1)) ∧
      Tendsto (fun k => elapsed hn ω (k+1)) atTop atTop ∧
      (∀ z : Grid n × ℕ, 0 < candidateTime (ω z.1).1 z.2) ∧
      Set.range (absoluteEvent hn ω) = Set.range (originalEvent ω) := by
  filter_upwards [positiveSteps_ae hn rate hr, boardCandidateTime_positive n rate hr,
    boardCandidateTime_nonexplosive n rate hr] with ω hp hmono hfin
  have hd := scheduled_time_tendsto hn ω hp hfin
  have hs := scheduledIndex_surjective hn ω hd (fun q => (hmono q).2.1)
  refine ⟨⟨scheduledIndex_injective hn ω hp,hs⟩,?_,hd,?_,absoluteEvent_range hn ω hs⟩
  · intro i j hij
    exact elapsed_strictMono hn ω hp (Nat.add_lt_add_right hij 1)
  · intro z
    exact (hmono z.1).1 z.2

end NoThreeLine.CandidateEnumeration

#print axioms NoThreeLine.CandidateEnumeration.exact_candidate_enumeration_ae
