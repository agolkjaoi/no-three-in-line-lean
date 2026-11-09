import NoThreeLine.WeightedSquareCentering
import NoThreeLine.ProtectedObservableCentering
import NoThreeLine.ProtectedWholeEnergy

/-! Center the actual whole protected credit/entropy by its own source
integral.  The resulting square has exactly the whole jump energy as
its generator; no scalar derivative of entropy at zero is introduced. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE

def selectedCreditSourceIntegral {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (E : Finset (Grid n)) : ℝ→ℝ :=
  sourcePrimitive (fun t=>protectedCreditTotalSource (selectedTrajectory cfg (x,t)) cfg.mask L E)

def selectedEntropySourceIntegral {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) : ℝ→ℝ :=
  sourcePrimitive (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask L E cfg.B)

theorem selectedCreditSource_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (E : Finset (Grid n)) :
    Continuous (fun t=>protectedCreditTotalSource (selectedTrajectory cfg (x,t)) cfg.mask L E) :=
  continuous_finsetSum _ (fun p _=>selectedProtectedSource_continuous cfg x L p)

theorem selectedEntropySource_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hB : 0<cfg.B) :
    Continuous (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask L E cfg.B) :=
  continuous_finsetSum _ (fun p _=>(protectedEntropySource_withCoordinates_continuous
    x.val saved cfg.directions cfg.mask L p cfg.B hB).comp (selectedLedgerCurve_continuous cfg x))

theorem selectedCreditSourceIntegral_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (E : Finset (Grid n)) : Continuous (selectedCreditSourceIntegral cfg x L E) :=
  sourcePrimitive_continuous _ (selectedCreditSource_continuous cfg x L E)

theorem selectedEntropySourceIntegral_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hB : 0<cfg.B) :
    Continuous (selectedEntropySourceIntegral cfg x L E saved) :=
  sourcePrimitive_continuous _ (selectedEntropySource_continuous cfg x L E saved hB)

theorem selectedProtectedCreditCentered_likelihood_generator {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (positive : Grid n→Grid n→Bool) (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>selectedLineLikelihood cfg x L u*
      (protectedCreditTotal L E (selectedTrajectory cfg (x,u)) saved-selectedCreditSourceIntegral cfg x L E u)^2)
      (selectedLineLikelihood cfg x L t*(protectedCreditEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E-
        ((n:ℝ)*cfg.B)*(protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
          cfg.directions cfg.mask cfg.B positive
          (fun v a=>(protectedCreditTotal L E v a-selectedCreditSourceIntegral cfg x L E t)^2)-
        (protectedCreditTotal L E (selectedTrajectory cfg (x,t)) saved-selectedCreditSourceIntegral cfg x L E t)^2))) t := by
  have hv := selectedTrajectory_valid cfg x he t ⟨ht.1.le,ht.2.le⟩
  have hcan := protectedObservableCandidateMean_generator L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B hn hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩) hv positive
    (fun v a=>(protectedCreditTotal L E v a-selectedCreditSourceIntegral cfg x L E t)^2)
  rw [protectedObservableExternalRate_centered_square,
    protectedCreditTotal_jumpSquare_eq_deletion _ saved cfg.directions cfg.mask positive L E hv.1 hs] at hcan
  exact weighted_centered_square_hasDerivAt _ _ _ t ((n:ℝ)*cfg.B) _ _ _ _ _ _
    (selectedLineLikelihood_hasDerivAt cfg x he K hKcfg hK L hs hsp hN hk t ht)
    (selectedProtectedCreditTotal_hasDerivAt cfg x he L E saved hs hsp hN t ht)
    (sourcePrimitive_hasDerivAt _ (selectedCreditSource_continuous cfg x L E) t)
    (protectedCreditTotal_generator _ saved cfg.directions cfg.mask positive L E hv.1 hs hE hsp) hcan

theorem selectedProtectedEntropyCentered_likelihood_generator {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (positive : Grid n→Grid n→Bool) (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>selectedLineLikelihood cfg x L u*
      (protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,u)) saved-selectedEntropySourceIntegral cfg x L E saved u)^2)
      (selectedLineLikelihood cfg x L t*(protectedEntropyEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E cfg.B-
        ((n:ℝ)*cfg.B)*(protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
          cfg.directions cfg.mask cfg.B positive
          (fun v a=>(protectedEntropyTotal L E cfg.B v a-selectedEntropySourceIntegral cfg x L E saved t)^2)-
        (protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,t)) saved-selectedEntropySourceIntegral cfg x L E saved t)^2))) t := by
  have hv := selectedTrajectory_valid cfg x he t ⟨ht.1.le,ht.2.le⟩
  have hcan := protectedObservableCandidateMean_generator L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B hn hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩) hv positive
    (fun v a=>(protectedEntropyTotal L E cfg.B v a-selectedEntropySourceIntegral cfg x L E saved t)^2)
  rw [protectedObservableExternalRate_centered_square,
    protectedEntropyTotal_jumpSquare_eq_deletion _ saved cfg.directions cfg.mask positive L E cfg.B hv.1 hs] at hcan
  exact weighted_centered_square_hasDerivAt _ _ _ t ((n:ℝ)*cfg.B) _ _ _ _ _ _
    (selectedLineLikelihood_hasDerivAt cfg x he K hKcfg hK L hs hsp hN hk t ht)
    (selectedProtectedEntropyTotal_hasDerivAt cfg x he L E saved K hKcfg hK hs hsp hN hk hB t ht)
    (sourcePrimitive_hasDerivAt _ (selectedEntropySource_continuous cfg x L E saved hB) t)
    (protectedEntropyTotal_generator _ saved cfg.directions cfg.mask positive L E cfg.B hB hv.1 hs hE hsp) hcan

end NoThreeLine
#print axioms NoThreeLine.selectedProtectedCreditCentered_likelihood_generator
#print axioms NoThreeLine.selectedProtectedEntropyCentered_likelihood_generator
