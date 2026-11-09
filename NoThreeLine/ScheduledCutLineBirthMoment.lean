import NoThreeLine.ScheduledCutPhysicalLeafMoment
import NoThreeLine.ScheduledCutUnitWitness
import NoThreeLine.LineBirthIndicatorMoment

/-! Actual non-frozen scheduled-cut selected-witness and full-board line
leaf moment. The original inherited records and current active indicators
are preserved. No later terminal point law is substituted for the cut law. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments

theorem initial_scheduledCutPoint_boardLineLeafPower_bound {n : ℕ} {B : ℝ}
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p∈L.val) (hzL : z∈L.val) (hpz : p≠z)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k N : ℕ) (t : ℝ) (ht : t∈Set.Icc (0:ℝ) (cs N).horizon) (hBL : B≤(L.val.card:ℝ)) :
    (∫ω,boardLineLeafPower mask L p z k (scheduledCutWitness cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t)≤
      (scheduledLeafUnitPrice cs start e N t z/(1-ε)^(k+2).choose 2)*
        ((∑q∈lineLeafSites L p z,mask q)^k+physicalRepeatErrorConstant k*B*(L.val.card:ℝ)^(k-1)) := by
  classical
  have hmem (q : lineLeafSites L p z) : q.val∈L.val ∧ q.val≠p ∧ q.val≠z := by
    have hh := Finset.mem_erase.mp q.property
    have hj := Finset.mem_erase.mp hh.2
    exact ⟨hj.2,hj.1,hh.1⟩
  have hcard : (Fintype.card (lineLeafSites L p z):ℝ)≤L.val.card := by
    exact_mod_cast (show Fintype.card (lineLeafSites L p z)≤L.val.card by
      simpa using lineLeafSites_card_le L p z)
  have hh := initial_scheduledCutPoint_lineLeafPower_length_bound
    (fun q : lineLeafSites L p z=>q.val) Subtype.val_injective (fun q=>mask q.val)
    (fun q=>hm q.val) L p z Γ hL hpL hzL (fun q=>(hmem q).1) hpz
    (fun q=>(hmem q).2.1) (fun q=>(hmem q).2.2) cs ε M deadline start hn hB e hΓ hK hε0 hε k N t ht
    (L.val.card:ℝ) hBL hcard
  have he : (fun ω=>boardLineLeafPower mask L p z k (scheduledCutWitness cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N (ω,t)))=
      (fun ω=>lineLeafPower (fun q : lineLeafSites L p z=>q.val) (fun q=>mask q.val) L p z k
        (scheduledCutWitness cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))) := by
    funext ω
    exact boardLineLeafPower_eq_subtype mask L p z k _ B (scheduledCutWitness_valid cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))
  rw [he]
  simpa only [Finset.sum_coe_sort] using hh

theorem initial_scheduledCutWitness_selectedLine_eq {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p z : Grid n) (hn : 0<n) (hB : 1≤B)
    (N k : ℕ) (t : ℝ) (ω : BoardClockPath n) (mask : Grid n→ℝ) (L : LineIndex n) :
    selectedLineLeafPower mask L p z k
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))=
    boardLineLeafPower mask L p z k
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn (initialGoodPhaseObservation B hB deadline start) N (ω,t)) := by
  rw [boardLineLeafPower,scheduledCutWitness_unit_retained]
  unfold selectedLineLeafPower
  by_cases hp : p∈(scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn (initialGoodPhaseObservation B hB deadline start) N (ω,t)).augmented.physical.process.activeEvents
  · simp only [hp,true_and,if_true]
    split_ifs <;> simp
  · simp only [hp,false_and,if_false]

theorem initial_scheduledCutPoint_selectedLineLeafPower_bound {n : ℕ} {B : ℝ}
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p∈L.val) (hzL : z∈L.val) (hpz : p≠z)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k N : ℕ) (t : ℝ) (ht : t∈Set.Icc (0:ℝ) (cs N).horizon) (hBL : B≤(L.val.card:ℝ)) :
    (∫ω,selectedLineLeafPower mask L p z k
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t)≤
      ((((∑j∈Finset.range N,(cs j).horizon*(cs j).mask z)+t*(cs N).mask z)/n)/(1-ε)^(k+2).choose 2)*
        ((∑q∈lineLeafSites L p z,mask q)^k+physicalRepeatErrorConstant k*B*(L.val.card:ℝ)^(k-1)) := by
  have hh := initial_scheduledCutPoint_boardLineLeafPower_bound mask hm L p z Γ hL hpL hzL hpz
    cs ε M deadline start hn hB (unitBirthRetention n) hΓ hK hε0 hε k N t ht hBL
  simp_rw [initial_scheduledCutWitness_selectedLine_eq]
  simpa only [scheduledLeafUnitPrice,scheduled_unitBirth_price] using hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_boardLineLeafPower_bound
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutWitness_selectedLine_eq
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_selectedLineLeafPower_bound
