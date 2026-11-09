import NoThreeLine.RestartedCrossingSectionSplit
import NoThreeLine.ScheduledProtectedPhaseTail

/-! Spend one share of the restart gap in the actual unfinished phase,
and the same share in each subsequent scheduled phase. -/
set_option autoImplicit false
set_option maxHeartbeats 2650000
noncomputable section
open MeasureTheory
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

def protectedUniformPhaseGapTail {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (A : ℝ→ℝ)
    (hn : 0<n) (J : ℕ) (lo hi step tail : ℝ) : Prop :=
  ∀ i<J,∀b : ℝ,lo≤b → b+step≤hi →
    ∀v : ProtectedTimedState (cs i).config,
      occupancy v.1.val.1.physical.process L=N → v.1.val.1.physical.clocks L≤K →
      v.1.val.1.AuxReady (cs i).directions ε M → (∀q∈L.val,0≤v.2 q ∧ v.2 q≤2*B) →
      protectedStateTotal (cs i).config L E A v≤b →
      (phaseLineForbiddenLaw (cs i).config ε M K L N hn v.1).real
        (protectedActualExceedance (cs i).config ε M L N E A hn v (b+step))≤tail

theorem scheduledRemainderSection_crossing_le_finite_phase {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (p : Grid n)
    (hn : 0<n) (hB : 0<B) (j J : ℕ) (hj : j<J)
    (Γ : Finset ZPoint) (hΓ : ∀i,(cs i).directions=Γ)
    (hKcfg : ∀i,(cs i).K≤K) (hK : K<2) (hsp : ∀i,specified (cs i).directions L)
    (a : ProtectedPhaseState n B)
    (ho : occupancy a.1.val.physical.process L=N) (hk : a.1.val.physical.clocks L≤K)
    (hs : a.1.val.AuxReady (cs j).directions ε M) (hsv : ∀q∈L.val,0≤a.2.1 q ∧ a.2.1 q≤2*B)
    (lo hi step tail : ℝ) (hstep : 0≤step) (htail : 0≤tail)
    (hgap : lo+(J:ℝ)*step≤hi) (hcredit : scheduledRestartEntryTotal cs L E A (j,a)≤lo)
    (hphase : protectedUniformPhaseGapTail cs ε M K L N E A hn J lo hi step tail) :
    (savedCreditMeasure (boardClockMeasure n (B/n))
      (fun w=>scheduledRemainderDensity cs ε M K deadline start L N hn J ((j,a),w))).real
      {w | (scheduledCrossingRemainderPair cs ε M deadline start L N E A hn hi J ((j,a),w)).1.2=true}≤
        tail+(2/(2-K))^2*((J-(j+1):ℕ):ℝ)*tail := by
  let k := J-(j+1)
  let mid := lo+step
  let cut := mid+(k:ℝ)*step
  have hlim (i : ℕ) (hiJ : i≤J) : lo+(i:ℝ)*step≤hi := by
    exact (add_le_add le_rfl (mul_le_mul_of_nonneg_right (by exact_mod_cast hiJ) hstep)).trans hgap
  have hm : mid≤hi := by simpa only [mid,Nat.cast_one,one_mul] using hlim 1 (by omega)
  have hcut : cut≤hi := by
    have he : cut=lo+((k+1:ℕ):ℝ)*step := by simp only [cut,mid,Nat.cast_add,Nat.cast_one]; ring
    rw [he]
    exact hlim (k+1) (by dsimp [k]; omega)
  have hfirst := hphase j hj lo le_rfl hm (unpackProtectedTimed (cs j).config a) ho hk hs hsv hcredit
  apply scheduledRemainderSection_crossing_le_split cs ε M K deadline start L N hN E A hA p hn hB j J hj
    hKcfg hK hsp a ho hk hs hsv mid cut hi tail ((2/(2-K))^2*(k:ℝ)*tail) hm hcut
    (mul_nonneg (mul_nonneg (sq_nonneg _) (Nat.cast_nonneg _)) htail) hfirst
  intro v hvo hvk hvs hvsv hvcredit
  let ds := fun i=>cs (j+1+i)
  let t := phaseEndpoint cs start (j+1)
  change (scheduledLineForbiddenLaw ds ε M K deadline t hn L N v.1 k).real
    (scheduledProtectedExceedance ds ε M deadline t L N E A hn cut k v)≤_
  have hvs' : v.1.val.AuxReady Γ ε M := by rw [←hΓ j]; exact hvs
  apply scheduledLineForbidden_crossing_le_finite_phase ds ε M K deadline t L N hN E A hA p hn hB k
    v Γ (fun _=>hΓ _) (fun _=>hKcfg _) hK (fun _=>hsp _) hvo hvk hvsv hvs'
    mid step tail hstep htail hvcredit
  intro i hik w hwo hwk hws hwsv hwcredit
  have hlo : lo≤mid+(i:ℝ)*step :=
    (le_add_of_nonneg_right hstep).trans (le_add_of_nonneg_right (mul_nonneg (Nat.cast_nonneg _) hstep))
  have he : mid+(i:ℝ)*step+step=mid+((i+1:ℕ):ℝ)*step := by push_cast; ring
  have hhi : mid+(i:ℝ)*step+step≤hi := by
    rw [he]
    exact (add_le_add le_rfl (mul_le_mul_of_nonneg_right (by exact_mod_cast Nat.succ_le_of_lt hik)
      hstep)).trans hcut
  have hh := hphase (j+1+i) (by dsimp [k] at hik; omega) (mid+(i:ℝ)*step)
    hlo hhi w hwo hwk hws hwsv hwcredit
  simpa only [he] using hh

end NoThreeLine

#print axioms NoThreeLine.scheduledRemainderSection_crossing_le_finite_phase

