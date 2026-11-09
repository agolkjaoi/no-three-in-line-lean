import NoThreeLine.SourceCutVolterra

/-! Actual initial conditions for the source hierarchy. Empty selected set,
weights at most one, and zero protection clocks imply the source-free base;
initially unselected witness labels give zero initial mixed value. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE MixedConnection EtaPairProduct EtaMixedGenerator

theorem goodMixed_eq_zero_of_unborn {n : ℕ} (cfg : FlowConfig n) (e : Retention n)
    (C D L : Finset (Grid n)) (s : GoodObservation cfg) (q : Grid n)
    (hqD : q∈D) (hq : q∉s.val.1.val.1.physical.process.selected) : goodMixed cfg e C D L s=0 := by
  have hv := observedWitness_valid cfg e s.val s.property.1
  have hq' : (observedWitness cfg e s.val).retained q=0 := hv.2.2 q hq
  unfold goodMixed mixed witnessProduct
  rw [Finset.prod_eq_zero hqD hq',zero_mul]

theorem goodMixed_empty_le_one_of_initial {n : ℕ} (cfg : FlowConfig n) (e : Retention n)
    (C L : Finset (Grid n)) (s : GoodObservation cfg)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀p,(s.val.1.val.1.physical.process.accounts p).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) : goodMixed cfg e C ∅ L s≤1 := by
  let a := s.val.1.val.1
  have hv : a.Valid cfg.B := s.val.1.property.1
  have hphi : phi cfg.directions C a.physical≤1 := by
    by_cases hC : C⊆a.physical.process.activeEvents
    · have hconn : connectionProduct cfg.directions C a.physical≤1 := by
        apply Finset.prod_le_one (fun J _=>lineConnection_nonneg _ cfg.directions C cfg.B hv.1 hC J)
        intro J _
        unfold lineConnection
        split_ifs
        · have hN : occupancy a.physical.process J=0 := by simp [occupancy,a,hS]
          simp [hN,hk J,protection,a]
        · exact pow_le_one₀ (hv.1.2.1.2.2 J).1 (hv.1.2.1.2.2 J).2
      have hroot : rootWeightProduct C a.physical≤1 :=
        Finset.prod_le_one (fun p _=>(hv.1.2.1.1 p).1) (fun p _=>hw p)
      rw [phi,if_pos hC]
      simpa only [one_mul] using mul_le_mul hroot hconn
        (Finset.prod_nonneg (fun J _=>lineConnection_nonneg _ cfg.directions C cfg.B hv.1 hC J)) zero_le_one
    · simp only [phi,if_neg hC,zero_le_one]
  have hη : etaProduct L a.eta≤1 := Finset.prod_le_one
    (fun p _=>(hv.2 p.1 p.2).1) (fun p _=>(hv.2 p.1 p.2).2)
  change mixed cfg.directions C ∅ L (observedWitness cfg e s.val)≤1
  rw [mixed_empty]
  change etaProduct L a.eta*phi cfg.directions C a.physical≤1
  simpa only [one_mul] using mul_le_mul hη hphi (phi_nonneg _ cfg.directions C cfg.B hv.1) zero_le_one

theorem elapsedMixedMean_empty_le {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hK : cfg.K<2) (hCL : C⊆L) (s : GoodObservation cfg) (t : ℝ)
    (ht : t∈Icc (0:ℝ) s.val.1.val.2) :
    elapsedMixedMean cfg ε M start e C ∅ L hn s t≤goodMixed cfg e C ∅ L s := by
  simpa only [elapsedHierarchyMean,Finset.sum_empty,intervalIntegral.integral_zero,add_zero] using
    elapsedMixedMean_volterra cfg ε M start e C ∅ L hn hB hm hK hCL (Finset.disjoint_empty_right C) s t ht

theorem elapsedMixedMean_unborn_volterra {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodObservation cfg)
    (q : Grid n) (hqD : q∈D) (hq : q∉s.val.1.val.1.physical.process.selected)
    (t : ℝ) (ht : t∈Icc (0:ℝ) s.val.1.val.2) :
    elapsedMixedMean cfg ε M start e C D L hn s t≤
      ∫u in (0:ℝ)..t,elapsedHierarchyMean cfg ε M start e C D L hn s u := by
  simpa only [goodMixed_eq_zero_of_unborn cfg e C D L s q hqD hq,zero_add] using
    elapsedMixedMean_volterra cfg ε M start e C D L hn hB hm hK hCL hCD s t ht

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.goodMixed_empty_le_one_of_initial
#print axioms NoThreeLine.BirthWitness.elapsedMixedMean_unborn_volterra
