import NoThreeLine.MixedBirthFactorization
import NoThreeLine.FlowPositivity

/-! Differentiate the actual D-empty mixed quantity along the actual
fixed-mode vector field. Products are treated without division by Phi,
weights or line credits, so zero factors cause no hidden exception. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.MixedConnection
open AuxiliaryODE PrimitiveLines

theorem hasDerivAt_prod_multiplicative {ι : Type*} (s : Finset ι) (f : ι → ℝ → ℝ)
    (g : ι → ℝ) (t : ℝ) (hf : ∀ i∈s,HasDerivAt (f i) (f i t*g i) t) :
    HasDerivAt (fun u=>∏ i∈s,f i u) ((∏ i∈s,f i t)*(∑ i∈s,g i)) t := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa using hasDerivAt_const t (1:ℝ)
  | @insert a s ha ih =>
    have hrest := ih (fun i hi=>hf i (Finset.mem_insert_of_mem hi))
    have h := (hf a (Finset.mem_insert_self _ _)).mul hrest
    simp only [Finset.prod_insert ha,Finset.sum_insert ha]
    exact h.congr_deriv (by ring)

theorem hasDerivAt_pow_multiplicative (f : ℝ → ℝ) (g t : ℝ) (m : ℕ)
    (hf : HasDerivAt f (f t*g) t) :
    HasDerivAt (fun u=>f u^m) (f t^m*((m:ℝ)*g)) t := by
  induction m with
  | zero => simpa using hasDerivAt_const t (1:ℝ)
  | succ m ih =>
    have h := ih.mul hf
    simp only [pow_succ,Nat.cast_add,Nat.cast_one]
    exact h.congr_deriv (by ring)

def connectionDamping {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (L : LineIndex n) : ℝ :=
  if specified Γ L then clockDamping s Γ mask z L else creditDamping s Γ mask z L

def connectionBase {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (z : Coordinates n) (L : LineIndex n) : ℝ :=
  if specified Γ L then (protection (occupancy e.process L) (z.2.1 L))⁻¹ else z.2.2 L

theorem connectionBase_hasDerivAt {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (t : ℝ)
    (hd : HasDerivAt z (vectorField e.process Γ mask (z t)) t) (L : LineIndex n) :
    HasDerivAt (fun u=>connectionBase e Γ (z u) L)
      (connectionBase e Γ (z t) L * (-connectionDamping e.process Γ mask (z t) L)) t := by
  by_cases hsp : specified Γ L
  · have hk := hasDerivAt_pi.mp hd.snd.fst L
    change HasDerivAt (fun u=>(z u).2.1 L) (clockRHS e.process Γ mask (z t) L) t at hk
    have h := (hk.const_sub 2).div_const (2-(occupancy e.process L:ℝ))
    simp only [connectionBase,connectionDamping,if_pos hsp,protection,inv_div]
    exact h.congr_deriv (by rw [clockRHS_eq_gap_mul]; simp only [div_eq_mul_inv]; ring)
  · have hr := hasDerivAt_pi.mp hd.snd.snd L
    change HasDerivAt (fun u=>(z u).2.2 L) (lineCreditRHS e.process Γ mask (z t) L) t at hr
    simp only [connectionBase,connectionDamping,if_neg hsp]
    exact hr.congr_deriv (lineCreditRHS_eq_mul e.process Γ mask (z t) L)

theorem lineConnection_hasDerivAt {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (t : ℝ)
    (hd : HasDerivAt z (vectorField e.process Γ mask (z t)) t) (L : LineIndex n) :
    HasDerivAt (fun u=>lineConnection Γ C (e.withCoordinates (z u)) L)
      (lineConnection Γ C (e.withCoordinates (z t)) L *
        (-((multiplicity C L-1:ℕ):ℝ)*connectionDamping e.process Γ mask (z t) L)) t := by
  have h := hasDerivAt_pow_multiplicative _ (-connectionDamping e.process Γ mask (z t) L) t
    (multiplicity C L-1) (connectionBase_hasDerivAt e Γ mask z t hd L)
  have he (u : ℝ) : lineConnection Γ C (e.withCoordinates (z u)) L=
      connectionBase e Γ (z u) L^(multiplicity C L-1) := by
    unfold lineConnection connectionBase
    split_ifs <;> rfl
  simp_rw [he]
  exact h.congr_deriv (by ring)

def phiGrowth {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint) (C : Finset (Grid n))
    (mask : Grid n → ℝ) (z : Coordinates n) : ℝ :=
  (∑ p∈C,s.perCapitaGrowth Γ mask z.1 p) +
    ∑ L : LineIndex n,-((multiplicity C L-1:ℕ):ℝ)*connectionDamping s Γ mask z L

theorem withCoordinates_activeEvents {n : ℕ} (e : ExtendedState n) (z : Coordinates n) :
    (e.withCoordinates z).process.activeEvents=e.process.activeEvents := rfl

theorem phi_flow_hasDerivAt {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (t : ℝ)
    (hd : HasDerivAt z (vectorField e.process Γ mask (z t)) t) :
    HasDerivAt (fun u=>phi Γ C (e.withCoordinates (z u)))
      (phi Γ C (e.withCoordinates (z t))*phiGrowth e.process Γ C mask (z t)) t := by
  by_cases hC : C⊆e.process.activeEvents
  · have hW : HasDerivAt (fun u=>rootWeightProduct C (e.withCoordinates (z u)))
        (rootWeightProduct C (e.withCoordinates (z t)) *
          ∑ p∈C,e.process.perCapitaGrowth Γ mask (z t).1 p) t := by
      apply hasDerivAt_prod_multiplicative
      intro p hp
      have hw := hasDerivAt_pi.mp hd.fst p
      change HasDerivAt (fun u=>(z u).1 p)
        (e.process.compensatedVectorField Γ mask (z t).1 p) t at hw
      rw [ProcessState.vectorField_eq_mul_perCapita] at hw
      exact hw
    have hL := hasDerivAt_prod_multiplicative (Finset.univ : Finset (LineIndex n))
      (fun L u=>lineConnection Γ C (e.withCoordinates (z u)) L)
      (fun L=>-((multiplicity C L-1:ℕ):ℝ)*connectionDamping e.process Γ mask (z t) L) t
      (fun L _=>lineConnection_hasDerivAt e Γ C mask z t hd L)
    simp only [phi,withCoordinates_activeEvents,if_pos hC,phiGrowth]
    exact (hW.mul hL).congr_deriv (by dsimp [connectionProduct]; ring)
  · simpa only [phi,withCoordinates_activeEvents,if_neg hC,zero_mul] using hasDerivAt_const t (0:ℝ)

end NoThreeLine.MixedConnection

#print axioms NoThreeLine.MixedConnection.connectionBase_hasDerivAt
#print axioms NoThreeLine.MixedConnection.lineConnection_hasDerivAt
#print axioms NoThreeLine.MixedConnection.phi_flow_hasDerivAt
