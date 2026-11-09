import NoThreeLine.ScheduledActualWeightCapTailSmall
import NoThreeLine.EtaCausePointTail
import NoThreeLine.VirtualCausePointTail
import NoThreeLine.SpecifiedClockFrozenParameters

/-! Specialize the actual weight, eta and virtual cause bounds to the
same frozen directions, guard scales and point law. The weight estimate
retains the deterministic root-deadline pair input. -/
set_option autoImplicit false
set_option maxHeartbeats 2450000
noncomputable section
open MeasureTheory Filter
open scoped Topology
namespace NoThreeLine.FrozenCapacity
open AuxiliaryODE BirthWitness FinitePhase FiniteDirections FiniteWitnessMoments

theorem exists_uniform_frozen_weight_eta_virtual_small (T a d γ ζ κ : ℝ)
    (hT : 0≤T) (ha : 0≤a) (had : a<d) (hdγ : d<γ) (hγ : γ<1)
    (hζ : 0<ζ) (hζd : ζ<1-d) (hκ : 0<κ) :
    ∃n0 : ℕ,∃h02 : 2≤n0,∀n (hn0 : n0≤n),
      let hn : 0<n := by omega
      let B := (n:ℝ)^d
      let hB : 1≤B := Real.one_le_rpow (by exact_mod_cast (show 1≤n by omega)) (ha.trans had.le)
      let ε := (n:ℝ)^(-ζ)
      let M := (n:ℝ)^γ
      ∀ (J : ℕ) (s : Schedule J) (mask : Fin J→Grid n→ℝ)
        (hmask : ∀j q,0≤mask j q ∧ mask j q≤1) (p : Grid n),
      s.total≤T → 0<scheduleProcessDeadline s mask p →
      normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p))≤a*Real.log n →
      let cs := scheduleSharedPhases s mask hmask gamma16 B (255/128) (1/8)
      let deadline := scheduleProcessDeadline s mask
      let e := augInitialState B hB deadline 0
      let μ := phasePointMeasure cs ε M deadline 0 hn hB p J
      μ.real (scheduledActualWeightCapBefore cs ε M deadline 0 hn e p J)≤κ ∧
      μ.real (scheduledBoundaryCauseBefore cs ε M deadline 0 hn e p .eta J)≤κ ∧
      μ.real (scheduledBoundaryCauseBefore cs ε M deadline 0 hn e p .virtual J)≤κ := by
  let K : ℝ := 255/128
  let ρ : ℝ := 1/8
  let δ : ℝ := 1/256
  let ξ := min (d/2) ((1-d-ζ)/4)
  let r := (a+d)/2
  have hd : 0<d := ha.trans_lt had
  have hξ : 0<ξ := lt_min (by linarith) (by linarith)
  have hξd : ξ<d := (min_le_left _ _).trans_lt (by linarith)
  have hξ1 := hξd.trans (hdγ.trans hγ)
  have hξgap : 0<1-d-2*ξ-ζ := by
    have h : ξ≤(1-d-ζ)/4 := min_le_right _ _
    linarith
  have hr : 0<r := by dsimp [r]; linarith
  have har : a<r := by dsimp [r]; linarith
  have hrd : r<d := by dsimp [r]; linarith
  obtain ⟨nW,hnW,hW⟩ := exists_uniform_actual_weightCap_tail_threshold gamma16
    K T ξ ρ δ d γ ζ a r κ hξ hξ1 hdγ hγ hζ ha hr har hrd hκ
    (by norm_num [K]) (by norm_num [K]) (by norm_num [ρ]) (by norm_num [δ])
    (by norm_num [δ]) (by norm_num [δ,ρ]) (by norm_num [δ,K])
  obtain ⟨_,_,nE,_,hE⟩ := etaCause_uniform_point_polynomial_tail gamma16 K ρ δ T ξ d ζ 1
    hT hξ hζ hξgap (by norm_num [K]) (by norm_num [K]) (by norm_num [ρ]) (by norm_num [δ])
    (by norm_num [δ]) (by norm_num [δ,ρ]) (by norm_num [δ,K])
  obtain ⟨_,_,nV,_,hV⟩ := virtualCause_uniform_point_polynomial_tail gamma16 K ρ δ T ξ d γ 1
    hξ hξd hdγ (by norm_num [K]) (by norm_num [K]) (by norm_num [ρ]) (by norm_num [δ])
    (by norm_num [δ]) (by norm_num [δ,ρ]) (by norm_num [δ,K])
  obtain ⟨nA,hA⟩ := eventually_atTop.mp
    (((tendsto_nat_rpow_negative 1 (by norm_num)).eventually (gt_mem_nhds hκ)).and
      ((tendsto_nat_rpow_negative ζ hζ).eventually (gt_mem_nhds (show (0:ℝ)<1/2 by norm_num))))
  refine ⟨max nW (max nE (max nV nA)),hnW.trans (le_max_left _ _),?_⟩
  intro n hnn
  dsimp only
  intro J s mask hmask p htime huse hpair
  have hnWn : nW≤n := (le_max_left _ _).trans hnn
  have hnEn : nE≤n := (le_max_left _ _).trans ((le_max_right _ _).trans hnn)
  have hnVn : nV≤n := (le_max_left _ _).trans ((le_max_right _ _).trans ((le_max_right _ _).trans hnn))
  have hnAn : nA≤n := (le_max_right _ _).trans ((le_max_right _ _).trans ((le_max_right _ _).trans hnn))
  have hn : 0<n := by omega
  let B := (n:ℝ)^d
  have hB : 1≤B := Real.one_le_rpow (by exact_mod_cast (show 1≤n by omega)) hd.le
  let ε := (n:ℝ)^(-ζ)
  let M := (n:ℝ)^γ
  let cs := scheduleSharedPhases s mask hmask gamma16 B K ρ
  let deadline := scheduleProcessDeadline s mask
  have hΓ : ∀j,(cs j).directions=gamma16 := scheduleSharedPhases_directions s mask hmask gamma16 B K ρ
  have hKcs (j : ℕ) : (cs j).K≤K := by dsimp [cs,scheduleSharedPhases]; split <;> exact le_rfl
  have hρcs (j : ℕ) : ρ≤(cs j).rho := by dsimp [cs,scheduleSharedPhases]; split <;> exact le_rfl
  have htime' : phaseEndpoint cs 0 J-0≤T := by
    rw [show phaseEndpoint cs 0 J=s.total from scheduleSharedPhases_total s mask hmask gamma16 B K ρ,sub_zero]
    exact htime
  have hA₁ : (n:ℝ)^(-(1:ℝ))≤κ := (hA n hnAn).1.le
  have hA₂ : ε≤1/2 := (hA n hnAn).2.le
  have hε : 0≤ε := Real.rpow_nonneg (Nat.cast_nonneg n) _
  obtain ⟨k,hk,hdeadline⟩ := s.exists_prefix_total_deadline (fun j=>mask j p)
  have hinit := augInitialState_active_of_before_deadline B hB deadline 0 p huse
  have hWeight := hW n hnWn J s mask hmask M p k hk hinit hdeadline htime hpair
  have hEta := hE n hnEn B M cs deadline 0 hn hB p p J J le_rfl hΓ hKcs hρcs htime'
  have hVirt := hV n hnVn B ε cs deadline 0 hn hB p p J J le_rfl hΓ hKcs hρcs hε hA₂ htime'
  exact ⟨hWeight.le,hEta.trans hA₁,hVirt.trans hA₁⟩

end NoThreeLine.FrozenCapacity

#print axioms NoThreeLine.FrozenCapacity.exists_uniform_frozen_weight_eta_virtual_small

