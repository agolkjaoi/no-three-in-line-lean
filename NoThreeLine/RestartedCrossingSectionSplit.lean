import NoThreeLine.RestartedCrossingDensityFactor
import NoThreeLine.TimedCrossingBoundaryRegion
import NoThreeLine.MarkedProductSectionTail

/-! Under the actual restarted law, add the unfinished phase tail and
the ordinary suffix tail. Normalize the suffix separately at each
surviving boundary, using the exact density product. -/
set_option autoImplicit false
set_option maxHeartbeats 3000000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem scheduledRemainderSection_crossing_le_split {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (p : Grid n)
    (hn : 0<n) (hB : 0<B) (j J : ℕ) (hj : j<J)
    (hKcfg : ∀i,(cs i).K≤K) (hK : K<2) (hsp : ∀i,specified (cs i).directions L)
    (a : ProtectedPhaseState n B)
    (ho : occupancy a.1.val.physical.process L=N) (hk : a.1.val.physical.clocks L≤K)
    (hs : a.1.val.AuxReady (cs j).directions ε M) (hsv : ∀q∈L.val,0≤a.2.1 q ∧ a.2.1 q≤2*B)
    (mid cut hi firstTail suffixTail : ℝ) (hm : mid≤hi) (hc : cut≤hi) (htail : 0≤suffixTail)
    (hfirst : let s := unpackProtectedTimed (cs j).config a
      (phaseLineForbiddenLaw (cs j).config ε M K L N hn s.1).real
        (protectedActualExceedance (cs j).config ε M L N E A hn s mid)≤firstTail)
    (hsuffix : ∀v : ProtectedPhaseState n B,
      occupancy v.1.val.physical.process L=N → v.1.val.physical.clocks L≤K →
      v.1.val.AuxReady (cs j).directions ε M → (∀q∈L.val,0≤v.2.1 q ∧ v.2.1 q≤2*B) →
      protectedPhaseTotal L E A v≤mid →
      let ds := fun i=>cs (j+1+i)
      let t := phaseEndpoint cs start (j+1)
      let k := J-(j+1)
      (scheduledLineForbiddenLaw ds ε M K deadline t hn L N v.1 k).real
        (scheduledProtectedExceedance ds ε M deadline t L N E A hn cut k v)≤suffixTail) :
    (savedCreditMeasure (boardClockMeasure n (B/n))
      (fun w=>scheduledRemainderDensity cs ε M K deadline start L N hn J ((j,a),w))).real
      {w | (scheduledCrossingRemainderPair cs ε M deadline start L N E A hn hi J ((j,a),w)).1.2=true}≤
        firstTail+suffixTail := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let cfg := (cs j).config
  let s := unpackProtectedTimed cfg a
  let ds := fun i=>cs (j+1+i)
  let t := phaseEndpoint cs start (j+1)
  let k := J-(j+1)
  let F := fun w=>timedCrossingPhasePair cs ε M deadline start L N E A hn mid j (s,w)
  let G := fun x : (ProtectedPhaseState n B×Bool)×BoardClockPath n=>
    scheduledCrossingTail ds ε M deadline t L N E A hn cut 0 k (x.1.1,x.2)
  let V := validLineStageValue (B:=B) K L N
  let W := fun x : ProtectedPhaseState n B×Bool=>validLineStageDensity K L N a.1 x.1.1
  let R := fun x : (ProtectedPhaseState n B×Bool)×BoardClockPath n=>
    lineStageBoundaryDensity K L N x.1.1.1 (G x).1.1.1
  let Q := savedCreditMeasure μ
    (fun w=>scheduledRemainderDensity cs ε M K deadline start L N hn J ((j,a),w))
  letI : IsProbabilityMeasure Q := scheduledRemainderSection_probability cs ε M K deadline start
    hn hB hKcfg hK L hsp N hN J (j,a)
  have hF : Measurable F :=
    (timedCrossingPhasePair_measurable cs ε M deadline start L N E A hA hn mid j).comp
      (measurable_const.prodMk measurable_id)
  have hG : Measurable G := (scheduledCrossingTail_measurable ds ε M deadline t L N E A hA hn cut 0 k).comp
    (measurable_fst.fst.prodMk measurable_snd)
  have hW : Measurable W := (validLineStageDensity_measurable K L N a.1).comp measurable_fst.fst
  have hWb (x : ProtectedPhaseState n B×Bool) := validLineStageDensity_bounds K hK L N hN a.1 x.1.1 hk
  have hR : Measurable R := by
    have he : Measurable (fun x : (ProtectedPhaseState n B×Bool)×BoardClockPath n=>V x.1.1.1) :=
      (validLineStageValue_measurable K L N).comp measurable_fst.fst.fst
    exact Measurable.ite (he.eq_const 0).setOf measurable_const
      (((validLineStageValue_measurable K L N).comp hG.fst.fst.fst).div he)
  have hphys (x : (ProtectedPhaseState n B×Bool)×BoardClockPath n) :
      (G x).1.1.1=recycledPhaseState ds ε M deadline t hn x.1.1.1 k x.2 :=
    congrArg (fun z : (ℕ×ValidAugmentedState n B)×BoardClockPath n=>z.1.2)
      (scheduledCrossingTail_physical_projection ds ε M deadline t L N E A hn cut 0 k (x.1.1,x.2))
  have hRw (x : (ProtectedPhaseState n B×Bool)×BoardClockPath n)
      (hx : occupancy x.1.1.1.val.physical.process L=N ∧ x.1.1.1.val.physical.clocks L≤K) :
      R x=scheduledLineStageDensity ds ε M K deadline t hn L N x.1.1.1 k x.2 := by
    change lineStageBoundaryDensity K L N x.1.1.1 (G x).1.1.1=_
    rw [lineStageBoundaryDensity_eq K L N _ _ hx.1 hx.2,hphys]
    rfl
  have hRz (x : (ProtectedPhaseState n B×Bool)×BoardClockPath n)
      (hx : ¬(occupancy x.1.1.1.val.physical.process L=N ∧ x.1.1.1.val.physical.clocks L≤K)) : R x=1 := by
    have hz : V x.1.1.1=0 := by simp [V,validLineStageValue,hx]
    simp [R,lineStageBoundaryDensity,hz,V]
  have hRb (x : (ProtectedPhaseState n B×Bool)×BoardClockPath n) :
      0≤R x ∧ R x≤max 1 ((2/(2-K))^2) := by
    by_cases hx : occupancy x.1.1.1.val.physical.process L=N ∧ x.1.1.1.val.physical.clocks L≤K
    · rw [hRw x hx]
      have hb := validLineStageDensity_bounds K hK L N hN x.1.1.1
        (recycledPhaseState ds ε M deadline t hn x.1.1.1 k x.2) hx.2
      exact ⟨hb.1,hb.2.trans (le_max_right _ _)⟩
    · rw [hRz x hx]
      exact ⟨zero_le_one,le_max_left _ _⟩
  have hRmean (x : ProtectedPhaseState n B×Bool) : (∫w,R (x,w) ∂μ)=1 := by
    by_cases hx : occupancy x.1.1.val.physical.process L=N ∧ x.1.1.val.physical.clocks L≤K
    · simp_rw [fun w : BoardClockPath n=>hRw (x,w) hx]
      exact scheduledLineStageDensity_mean_one ds ε M K deadline t hn hB
        (fun i=>hKcfg _) hK L (fun i=>hsp _) N hN x.1.1 hx.1 hx.2 k
    · simp_rw [fun w : BoardClockPath n=>hRz (x,w) hx]
      simp
  have hWden (w : BoardClockPath n) : W (F w).1=terminalLineStageDensity cfg ε M K L N hn s.1 w :=
    (timedCrossingPhasePair_terminalDensity cs ε M K deadline start L N E A hn mid j s w).symm
  have hWmean : (∫w,W (F w).1 ∂μ)=1 := by
    simp_rw [hWden]
    exact terminalLineStageDensity_mean_one cfg ε M K (hKcfg _) hK L (hsp _) N hN hn hB
      (cs j).mask_le_one s.1 ho hk
  have hsec (w : BoardClockPath n) (hw : 0<W (F w).1) (hflag : (F w).1.2=false) :
      (savedCreditMeasure μ (fun u=>R ((F w).1,u))).real {u | (G ((F w).1,u)).1.2=true}≤suffixTail := by
    let v := (F w).1.1
    have hv : occupancy v.1.val.physical.process L=N ∧ v.1.val.physical.clocks L≤K := by
      by_contra hh
      have hz : V v.1=0 := by simp [V,validLineStageValue,hh]
      change 0<Real.exp (-specifiedClockHazardPotential N (a.1.val.physical.clocks L))*V v.1 at hw
      rw [hz,mul_zero] at hw
      exact (lt_irrefl 0) hw
    have hr := timedCrossingPhasePair_auxReady_saved cs ε M deadline start L N E A hn mid j (hsp _) s hs hsv w
    have hb := timedCrossingPhasePair_total_le_of_no_flag cs ε M deadline start L N E A hn mid j s w hv.1 hflag
    have he : (fun u=>R ((F w).1,u))=scheduledLineStageDensity ds ε M K deadline t hn L N v.1 k := by
      funext u
      exact hRw ((F w).1,u) hv
    rw [he]
    exact hsuffix v hv.1 hv.2 hr.1 hr.2 hb
  have hsplit := markedProductSection_event_le μ F hF
    (timedCrossingPhasePair_map cs ε M deadline start L N E A hA hn hB mid j s)
    W hW _ hWb R hR _ hRb hWmean hRmean (fun x=>(G x).1.2) hG.fst.snd suffixTail htail hsec
  have hd : (fun w=>W (F w).1*R (F w))=
      (fun w=>scheduledRemainderDensity cs ε M K deadline start L N hn J ((j,a),w)) := by
    funext w
    rw [hWden,scheduledRemainderDensity_factor cs ε M K deadline start L N E A hn mid j J hj
      (hKcfg _) (hsp _) hN a ho hk w]
    change _ * lineStageBoundaryDensity K L N (F w).1.1.1 (G (F w)).1.1.1 =
      _ * lineStageBoundaryDensity K L N (F w).1.1.1 _
    rw [hphys]
  have he : {w | (F w).1.2=true}=protectedActualExceedance cfg ε M L N E A hn s mid := by
    ext w
    exact timedCrossingPhasePair_flag cs ε M deadline start L N E A hn mid j s w
  rw [hd,show (fun w=>W (F w).1)=terminalLineStageDensity cfg ε M K L N hn s.1 from funext hWden,he] at hsplit
  have hsub : {w | (scheduledCrossingRemainderPair cs ε M deadline start L N E A hn hi J ((j,a),w)).1.2=true}
      ⊆ {w | ((F w).1.2 || (G (F w)).1.2)=true} := by
    intro w hw
    let q := timedCrossingPhasePair cs ε M deadline start L N E A hn hi j (s,w)
    change (scheduledCrossingRemainderPair cs ε M deadline start L N E A hn hi J ((j,a),w)).1.2=true at hw
    simp only [scheduledCrossingRemainderPair,if_pos hj,crossingAppend,Bool.or_eq_true] at hw
    change q.1.2=true ∨
      (scheduledCrossingTail cs ε M deadline start L N E A hn hi (j+1) k (q.1.1,q.2)).1.2=true at hw
    change ((F w).1.2 || (G (F w)).1.2)=true
    rw [Bool.or_eq_true]
    rcases hw with h | h
    · exact Or.inl (timedCrossingPhasePair_flag_antitone cs ε M deadline start L N E A hn mid hi hm j s w h)
    · have hb := timedCrossingPhasePair_boundary_congr cs ε M deadline start L N E A hn hi mid j (s,w)
      change (q.1.1,q.2)=((F w).1.1,(F w).2) at hb
      rw [hb] at h
      have ht : (F w).2∈scheduledProtectedExceedance ds ε M deadline t L N E A hn hi k (F w).1.1 := by
        change (scheduledCrossingTail ds ε M deadline t L N E A hn hi 0 k ((F w).1.1,(F w).2)).1.2=true
        rw [show scheduledCrossingTail ds ε M deadline t L N E A hn hi 0 k ((F w).1.1,(F w).2) =
            scheduledCrossingTail cs ε M deadline start L N E A hn hi (j+1) k ((F w).1.1,(F w).2) by
          simpa only [Nat.add_zero] using scheduledCrossingTail_suffix cs ε M deadline start
            L N E A hn hi (j+1) 0 k ((F w).1.1,(F w).2)]
        exact h
      exact Or.inr (scheduledProtectedExceedance_antitone_threshold ds ε M deadline t L N E A p hn k (F w).1.1 hc ht)
  have hmQ := ENNReal.toReal_mono (measure_ne_top Q _) (measure_mono (μ:=Q) hsub)
  exact hmQ.trans (hsplit.trans (add_le_add hfirst le_rfl))

end NoThreeLine

#print axioms NoThreeLine.scheduledRemainderSection_crossing_le_split

