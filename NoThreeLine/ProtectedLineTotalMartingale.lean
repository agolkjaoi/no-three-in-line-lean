import NoThreeLine.ProtectedCompensatedTerminal

/-! Finite summation gives the actual whole specified-line compensation
martingale, with all saved retirement values and elapsed sources retained. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem compensatedProtectedLine_martingale {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (ho : occupancy s.1.val.1.physical.process L=N)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈L.val,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Martingale (fun k ω=>∑p∈L.val,compensatedProtectedCredit cfg ε M L p hn s k ω)
      (protectedStateFiltration cfg ε M L hn s) (phaseLineForbiddenLaw cfg ε M K L N hn s.1) := by
  classical
  let F := protectedStateFiltration cfg ε M L hn s
  let Q := phaseLineForbiddenLaw cfg ε M K L N hn s.1
  have hsum (P : Finset (Grid n)) :
      (∀p∈P,Martingale (compensatedProtectedCredit cfg ε M L p hn s) F Q)→
      Martingale (fun k ω=>∑p∈P,compensatedProtectedCredit cfg ε M L p hn s k ω) F Q := by
    induction P using Finset.induction_on with
    | empty =>
        intro _
        simp only [Finset.sum_empty]
        exact martingale_zero ℝ F Q
    | @insert a P ha ih =>
        intro h
        have hp := ih (fun p hp=>h p (Finset.mem_insert_of_mem hp))
        have had := (h a (Finset.mem_insert_self _ _)).add hp
        change Martingale (fun k ω=>compensatedProtectedCredit cfg ε M L a hn s k ω+
          ∑p∈P,compensatedProtectedCredit cfg ε M L p hn s k ω) F Q at had
        simpa only [Finset.sum_insert ha] using had
  exact hsum L.val (fun p hp=>compensatedProtectedCredit_martingale cfg ε M K hKcfg hK L hsp N hN
    p hp hn hB hm s ho hk (hsv p hp))

end NoThreeLine

#print axioms NoThreeLine.compensatedProtectedLine_martingale
