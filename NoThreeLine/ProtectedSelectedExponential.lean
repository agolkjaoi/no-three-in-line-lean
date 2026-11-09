import NoThreeLine.ProtectedWholeExponentialGenerator
import NoThreeLine.WeightedExponentialCompensation
import NoThreeLine.ProtectedCenteredGenerator

/-! The exponential compensated whole observable on the actual selected
curve has nonpositive killed-candidate generator. Both source and energy
are the actual elapsed primitives; no stochastic exponential law is assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem protectedObservable_exp_shift_generator_bound {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ)
    (positive : Grid n→Grid n→Bool) (L : LineIndex n)
    (F : ExtendedState n→(Grid n→ℝ)→ℝ) (θ A D S V : ℝ)
    (hg : θ*Real.exp (θ*F e saved)*(D-S)+
      protectedObservableExternalRate e saved Γ mask positive L (fun v a=>Real.exp (θ*F v a))≤
        (θ^2/2)*Real.exp (θ*F e saved)*V) :
    θ*Real.exp (θ*F e saved-A)*(D-S)+
      protectedObservableExternalRate e saved Γ mask positive L (fun v a=>Real.exp (θ*F v a-A))≤
        (θ^2/2)*Real.exp (θ*F e saved-A)*V := by
  have hh := mul_le_mul_of_nonneg_left hg (Real.exp_pos (-A)).le
  rw [protectedObservableExternalRate_exp_shift]
  have he : Real.exp (-A)*Real.exp (θ*F e saved)=Real.exp (θ*F e saved-A) := by
    rw [←Real.exp_add]
    congr 1
    ring
  rw [←he]
  calc
    _ = Real.exp (-A)*(θ*Real.exp (θ*F e saved)*(D-S)+
        protectedObservableExternalRate e saved Γ mask positive L
          (fun v a=>Real.exp (θ*F v a))) := by ring
    _ ≤ Real.exp (-A)*((θ^2/2)*Real.exp (θ*F e saved)*V) := hh
    _ = _ := by ring

def selectedCreditEnergyIntegral {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (E : Finset (Grid n)) : ℝ→ℝ :=
  sourcePrimitive (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E)

def selectedEntropyEnergyIntegral {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (E : Finset (Grid n)) : ℝ→ℝ :=
  sourcePrimitive (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E cfg.B)

theorem selectedCreditEnergy_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (E : Finset (Grid n)) :
    Continuous (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E) :=
  (protectedCreditEnergyRate_withCoordinates_continuous x.val cfg.directions cfg.mask L E).comp
    (selectedLedgerCurve_continuous cfg x)

theorem selectedEntropyEnergy_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (E : Finset (Grid n)) :
    Continuous (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E cfg.B) :=
  (protectedEntropyEnergyRate_withCoordinates_continuous x.val cfg.directions cfg.mask L E cfg.B).comp
    (selectedLedgerCurve_continuous cfg x)

theorem selectedProtectedExponential_generator_core {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (F : ExtendedState n→(Grid n→ℝ)→ℝ) (U W : ℝ→ℝ)
    (θ D S V : ℝ) (positive : Grid n→Grid n→Bool) (t : ℝ)
    (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x))
    (hF : HasDerivAt (fun u=>F (selectedTrajectory cfg (x,u)) saved) D t)
    (hU : HasDerivAt U S t) (hW : HasDerivAt W V t)
    (hg : θ*Real.exp (θ*F (selectedTrajectory cfg (x,t)) saved)*(D-S)+
      protectedObservableExternalRate (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask positive L
        (fun v a=>Real.exp (θ*F v a))≤(θ^2/2)*Real.exp (θ*F (selectedTrajectory cfg (x,t)) saved)*V) :
    ∃v,HasDerivAt (fun u=>selectedLineLikelihood cfg x L u*
      Real.exp (θ*(F (selectedTrajectory cfg (x,u)) saved-U u)-(θ^2/2)*W u)) v t ∧
      v+((n:ℝ)*cfg.B)*(selectedLineLikelihood cfg x L t*
        protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B positive
          (fun e a=>Real.exp (θ*(F e a-U t)-(θ^2/2)*W t))-
        selectedLineLikelihood cfg x L t*Real.exp (θ*(F (selectedTrajectory cfg (x,t)) saved-U t)-(θ^2/2)*W t))≤0 := by
  have hZ := selectedLineLikelihood_hasDerivAt cfg x he K hKcfg hK L hs hsp hN hk t ht
  refine ⟨_,weighted_exponential_hasDerivAt _ _ _ _ t θ _ D S V hZ hF hU hW,?_⟩
  have hcan := protectedObservableCandidateMean_generator L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask
    cfg.B hn hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩) (selectedTrajectory_valid cfg x he t ⟨ht.1.le,ht.2.le⟩) positive
    (fun e a=>Real.exp (θ*(F e a-U t)-(θ^2/2)*W t))
  have hfun : (fun e a=>Real.exp (θ*(F e a-U t)-(θ^2/2)*W t))=
      (fun e a=>Real.exp (θ*F e a-(θ*U t+(θ^2/2)*W t))) := by
    funext e a
    congr 1
    ring
  have hshift := protectedObservable_exp_shift_generator_bound (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask
    positive L F θ (θ*U t+(θ^2/2)*W t) D S V hg
  have heq : θ*F (selectedTrajectory cfg (x,t)) saved-(θ*U t+(θ^2/2)*W t)=
      θ*(F (selectedTrajectory cfg (x,t)) saved-U t)-(θ^2/2)*W t := by ring
  rw [←hfun,heq] at hshift
  exact weighted_exponential_generator_nonpos _ _ _ _ _ _ _ _ _ θ (Real.exp_pos _).le hshift hcan

theorem selectedProtectedCreditExponential_generator {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (θ : ℝ) (hθ : 0≤θ) (positive : Grid n→Grid n→Bool) (t : ℝ) (ht : t∈Ioo 0 (selectedGuardTime cfg x)) :
    ∃v,HasDerivAt (fun u=>selectedLineLikelihood cfg x L u*
      Real.exp (θ*(protectedCreditTotal L E (selectedTrajectory cfg (x,u)) saved-selectedCreditSourceIntegral cfg x L E u)-
        (θ^2/2)*selectedCreditEnergyIntegral cfg x L E u)) v t ∧
      v+((n:ℝ)*cfg.B)*(selectedLineLikelihood cfg x L t*
        protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B positive
          (fun e a=>Real.exp (θ*(protectedCreditTotal L E e a-selectedCreditSourceIntegral cfg x L E t)-
            (θ^2/2)*selectedCreditEnergyIntegral cfg x L E t))-
        selectedLineLikelihood cfg x L t*Real.exp (θ*(protectedCreditTotal L E (selectedTrajectory cfg (x,t)) saved-
          selectedCreditSourceIntegral cfg x L E t)-(θ^2/2)*selectedCreditEnergyIntegral cfg x L E t))≤0 := by
  exact selectedProtectedExponential_generator_core cfg x he K hKcfg hK L saved hn hB hm hs hsp hN hk
    (protectedCreditTotal L E) (selectedCreditSourceIntegral cfg x L E) (selectedCreditEnergyIntegral cfg x L E)
    θ _ _ _ positive t ht
    (selectedProtectedCreditTotal_hasDerivAt cfg x he L E saved hs hsp hN t ht)
    (sourcePrimitive_hasDerivAt _ (selectedCreditSource_continuous cfg x L E) t)
    (sourcePrimitive_hasDerivAt _ (selectedCreditEnergy_continuous cfg x L E) t)
    (protectedCreditTotal_exp_compensated_generator _ saved cfg.directions cfg.mask positive L E cfg.B K θ
      (selectedTrajectory_valid cfg x he t ⟨ht.1.le,ht.2.le⟩) hs hN
      (selectedCurve_specifiedClock_le cfg x he K hKcfg L hsp hN hk t ⟨ht.1.le,ht.2.le⟩) hK
      cfg.mask_nonneg hθ hE hsp)

theorem selectedProtectedEntropyExponential_generator {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (θ : ℝ) (hθ : 0≤θ) (positive : Grid n→Grid n→Bool) (t : ℝ) (ht : t∈Ioo 0 (selectedGuardTime cfg x)) :
    ∃v,HasDerivAt (fun u=>selectedLineLikelihood cfg x L u*
      Real.exp (θ*(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,u)) saved-selectedEntropySourceIntegral cfg x L E saved u)-
        (θ^2/2)*selectedEntropyEnergyIntegral cfg x L E u)) v t ∧
      v+((n:ℝ)*cfg.B)*(selectedLineLikelihood cfg x L t*
        protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B positive
          (fun e a=>Real.exp (θ*(protectedEntropyTotal L E cfg.B e a-selectedEntropySourceIntegral cfg x L E saved t)-
            (θ^2/2)*selectedEntropyEnergyIntegral cfg x L E t))-
        selectedLineLikelihood cfg x L t*Real.exp (θ*(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,t)) saved-
          selectedEntropySourceIntegral cfg x L E saved t)-(θ^2/2)*selectedEntropyEnergyIntegral cfg x L E t))≤0 := by
  exact selectedProtectedExponential_generator_core cfg x he K hKcfg hK L saved hn hB hm hs hsp hN hk
    (protectedEntropyTotal L E cfg.B) (selectedEntropySourceIntegral cfg x L E saved) (selectedEntropyEnergyIntegral cfg x L E)
    θ _ _ _ positive t ht
    (selectedProtectedEntropyTotal_hasDerivAt cfg x he L E saved K hKcfg hK hs hsp hN hk hB t ht)
    (sourcePrimitive_hasDerivAt _ (selectedEntropySource_continuous cfg x L E saved hB) t)
    (sourcePrimitive_hasDerivAt _ (selectedEntropyEnergy_continuous cfg x L E) t)
    (protectedEntropyTotal_exp_compensated_generator _ saved cfg.directions cfg.mask positive L E cfg.B K θ hB
      (selectedTrajectory_valid cfg x he t ⟨ht.1.le,ht.2.le⟩) hs hN
      (selectedCurve_specifiedClock_le cfg x he K hKcfg L hsp hN hk t ⟨ht.1.le,ht.2.le⟩) hK
      cfg.mask_nonneg hθ hE hsp)

end NoThreeLine
#print axioms NoThreeLine.selectedProtectedCreditExponential_generator
#print axioms NoThreeLine.selectedProtectedEntropyExponential_generator
