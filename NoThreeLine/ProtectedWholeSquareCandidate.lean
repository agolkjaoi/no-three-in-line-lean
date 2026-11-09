import NoThreeLine.ProtectedWholeGenerator

/-! Exact actual candidate mean and selected likelihood derivative for
the squares of whole saved-credit and whole saved-entropy sums. -/
set_option autoImplicit false
noncomputable section
open Set
namespace NoThreeLine
open AuxiliaryODE

def protectedCreditSquareSource {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) : ℝ :=
  2*protectedCreditTotal L E e saved*protectedCreditTotalSource e mask L E+
    protectedExternalEventRate e mask L (fun q=>(protectedExternalDeletion e Γ L E q)^2)

def protectedEntropySquareSource {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ) : ℝ :=
  2*protectedEntropyTotal L E B e saved*protectedEntropyTotalSource e saved Γ mask L E B+
    protectedExternalEventRate e mask L (fun q=>(protectedEntropyDeletion e Γ L E q B)^2)

theorem protectedCreditSquare_candidate_compensation {n : ℕ} (L : LineIndex n) (E : Finset (Grid n))
    (e : ExtendedState n) (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (hn : 0<n) (hB : 0<B) (hm : ∀q,0≤mask q ∧ mask q≤1) (hw : e.Valid B)
    (positive : Grid n→Grid n→Bool) (hs : e.process.stopped=false)
    (hE : E⊆L.val) (hsp : specified Γ L) :
    2*protectedCreditTotal L E e saved*protectedCreditTotalDrift e Γ mask L E+
      lineIntensity e.process mask e.coordinates L*(protectedCreditTotal L E e saved)^2+
      ((n:ℝ)*B)*(protectedObservableCandidateMean L e saved Γ mask B positive
        (fun v a=>(protectedCreditTotal L E v a)^2)-(protectedCreditTotal L E e saved)^2)=
      protectedCreditSquareSource e saved Γ mask L E := by
  rw [protectedObservableCandidateMean_generator L e saved Γ mask B hn hB hm hw positive]
  have h := protectedCreditTotal_square_generator e saved Γ mask positive L E hw.1 hs hE hsp
  rw [protectedCreditTotal_jumpSquare_eq_deletion e saved Γ mask positive L E hw.1 hs] at h
  unfold protectedCreditSquareSource
  linarith only [h]

theorem protectedEntropySquare_candidate_compensation {n : ℕ} (L : LineIndex n) (E : Finset (Grid n))
    (e : ExtendedState n) (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (hn : 0<n) (hB : 0<B) (hm : ∀q,0≤mask q ∧ mask q≤1) (hw : e.Valid B)
    (positive : Grid n→Grid n→Bool) (hs : e.process.stopped=false)
    (hE : E⊆L.val) (hsp : specified Γ L) :
    2*protectedEntropyTotal L E B e saved*protectedEntropyTotalDrift e saved Γ mask L E B+
      lineIntensity e.process mask e.coordinates L*(protectedEntropyTotal L E B e saved)^2+
      ((n:ℝ)*B)*(protectedObservableCandidateMean L e saved Γ mask B positive
        (fun v a=>(protectedEntropyTotal L E B v a)^2)-(protectedEntropyTotal L E B e saved)^2)=
      protectedEntropySquareSource e saved Γ mask L E B := by
  rw [protectedObservableCandidateMean_generator L e saved Γ mask B hn hB hm hw positive]
  have h := protectedEntropyTotal_square_generator e saved Γ mask positive L E B hB hw.1 hs hE hsp
  rw [protectedEntropyTotal_jumpSquare_eq_deletion e saved Γ mask positive L E B hw.1 hs] at h
  unfold protectedEntropySquareSource
  linarith only [h]

theorem selectedProtectedCreditSquare_likelihood_generator {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (positive : Grid n→Grid n→Bool) (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>selectedLineLikelihood cfg x L u*(protectedCreditTotal L E (selectedTrajectory cfg (x,u)) saved)^2)
      (selectedLineLikelihood cfg x L t*(
        protectedCreditSquareSource (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L E-
        ((n:ℝ)*cfg.B)*(protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B positive
          (fun v a=>(protectedCreditTotal L E v a)^2)-(protectedCreditTotal L E (selectedTrajectory cfg (x,t)) saved)^2))) t := by
  have hl := selectedLineLikelihood_hasDerivAt cfg x he K hKcfg hK L hs hsp hN hk t ht
  have hc := selectedProtectedCreditTotal_square_hasDerivAt cfg x he L E saved hs hsp hN t ht
  have hg := protectedCreditSquare_candidate_compensation L E (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B hn hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
    (selectedTrajectory_valid cfg x he t ⟨ht.1.le,ht.2.le⟩) positive hs hE hsp
  apply (hl.mul hc).congr_deriv
  change (lineIntensity (selectedTrajectory cfg (x,t)).process cfg.mask (selectedTrajectory cfg (x,t)).coordinates L*
    selectedLineLikelihood cfg x L t)*(protectedCreditTotal L E (selectedTrajectory cfg (x,t)) saved)^2+
    selectedLineLikelihood cfg x L t*(2*protectedCreditTotal L E (selectedTrajectory cfg (x,t)) saved*
      protectedCreditTotalDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E)=_
  have hgm := congrArg (fun v : ℝ=>selectedLineLikelihood cfg x L t*v) hg
  nlinarith only [hgm]

theorem selectedProtectedEntropySquare_likelihood_generator {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (positive : Grid n→Grid n→Bool) (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>selectedLineLikelihood cfg x L u*(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,u)) saved)^2)
      (selectedLineLikelihood cfg x L t*(
        protectedEntropySquareSource (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L E cfg.B-
        ((n:ℝ)*cfg.B)*(protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B positive
          (fun v a=>(protectedEntropyTotal L E cfg.B v a)^2)-(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,t)) saved)^2))) t := by
  have hl := selectedLineLikelihood_hasDerivAt cfg x he K hKcfg hK L hs hsp hN hk t ht
  have hc := selectedProtectedEntropyTotal_square_hasDerivAt cfg x he L E saved K hKcfg hK hs hsp hN hk hB t ht
  have hg := protectedEntropySquare_candidate_compensation L E (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B hn hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
    (selectedTrajectory_valid cfg x he t ⟨ht.1.le,ht.2.le⟩) positive hs hE hsp
  apply (hl.mul hc).congr_deriv
  change (lineIntensity (selectedTrajectory cfg (x,t)).process cfg.mask (selectedTrajectory cfg (x,t)).coordinates L*
    selectedLineLikelihood cfg x L t)*(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,t)) saved)^2+
    selectedLineLikelihood cfg x L t*(2*protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,t)) saved*
      protectedEntropyTotalDrift (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L E cfg.B)=_
  have hgm := congrArg (fun v : ℝ=>selectedLineLikelihood cfg x L t*v) hg
  nlinarith only [hgm]

end NoThreeLine
#print axioms NoThreeLine.protectedCreditSquare_candidate_compensation
#print axioms NoThreeLine.protectedEntropySquare_candidate_compensation
#print axioms NoThreeLine.selectedProtectedCreditSquare_likelihood_generator
#print axioms NoThreeLine.selectedProtectedEntropySquare_likelihood_generator
