import NoThreeLine.PhysicalLeafPointMoment

/-! Specialize physical leaves to the actual finite board line with p and z
removed. In a retained-witness product, removing z does not change the active
leaf sum: an active z has retained value zero. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments

def lineLeafSites {n : ℕ} (L : LineIndex n) (p z : Grid n) : Finset (Grid n) := (L.val.erase p).erase z

def boardLineLeafPower {n : ℕ} (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n)
    (k : ℕ) (a : WitnessState n) : ℝ :=
  if p∈a.augmented.physical.process.activeEvents then
    a.retained z*(a.augmented.physical.lineCredits L*
      ∑q∈L.val.erase p,mask q*activeLeafWeight q a)^k else 0

theorem boardLineLeafPower_eq_subtype {n : ℕ} (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n)
    (k : ℕ) (a : WitnessState n) (B : ℝ) (ha : a.Valid B) :
    boardLineLeafPower mask L p z k a=
      lineLeafPower (fun q : lineLeafSites L p z=>q.val) (fun q=>mask q.val) L p z k a := by
  classical
  unfold boardLineLeafPower lineLeafPower
  rw [Finset.sum_coe_sort (lineLeafSites L p z) (fun q=>mask q*activeLeafWeight q a)]
  by_cases hp : p∈a.augmented.physical.process.activeEvents
  · rw [if_pos hp,if_pos hp]
    by_cases hz : a.retained z=0
    · rw [hz,zero_mul,zero_mul]
    · have hzact : z∉a.augmented.physical.process.activeEvents :=
        fun h=>hz (retained_active_zero a B ha z h)
      have hzero : mask z*activeLeafWeight z a=0 := by rw [activeLeafWeight,if_neg hzact,mul_zero]
      have hs : (∑q∈lineLeafSites L p z,mask q*activeLeafWeight q a)=
          ∑q∈L.val.erase p,mask q*activeLeafWeight q a := by
        unfold lineLeafSites
        by_cases hmem : z∈L.val.erase p
        · have hh := Finset.sum_erase_add (L.val.erase p) (fun q=>mask q*activeLeafWeight q a) hmem
          simpa only [hzero,add_zero] using hh
        · rw [Finset.erase_eq_of_notMem hmem]
      rw [hs]
  · rw [if_neg hp,if_neg hp]

theorem lineLeafSites_card_le {n : ℕ} (L : LineIndex n) (p z : Grid n) :
    (lineLeafSites L p z).card≤L.val.card :=
  (Finset.card_erase_le : ((L.val.erase p).erase z).card≤(L.val.erase p).card).trans Finset.card_erase_le

theorem initial_rootPhasePoint_boardLineLeafPower_bound {n : ℕ} {B : ℝ}
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p∈L.val) (hzL : z∈L.val) (hpz : p≠z)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k N : ℕ) (hBL : B≤(L.val.card:ℝ)) :
    (∫ω,boardLineLeafPower mask L p z k (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)
      ∂phasePointMeasure cs ε M deadline start hn hB p N)≤
      (accumulatedPhaseUnitPrice cs start e N z/(1-ε)^(k+2).choose 2)*
        ((∑q∈lineLeafSites L p z,mask q)^k+physicalRepeatErrorConstant k*B*(L.val.card:ℝ)^(k-1)) := by
  classical
  have hmem (q : lineLeafSites L p z) : q.val∈L.val ∧ q.val≠p ∧ q.val≠z := by
    have hh := Finset.mem_erase.mp q.property
    have hj := Finset.mem_erase.mp hh.2
    exact ⟨hj.2,hj.1,hh.1⟩
  have hcard : (Fintype.card (lineLeafSites L p z):ℝ)≤L.val.card := by
    exact_mod_cast (show Fintype.card (lineLeafSites L p z)≤L.val.card by
      simpa using lineLeafSites_card_le L p z)
  have hh := initial_rootPhasePoint_lineLeafPower_length_bound
    (fun q : lineLeafSites L p z=>q.val) Subtype.val_injective (fun q=>mask q.val)
    (fun q=>hm q.val) L p z Γ hL hpL hzL (fun q=>(hmem q).1) hpz
    (fun q=>(hmem q).2.1) (fun q=>(hmem q).2.2) cs ε M deadline start hn hB e hΓ hK hε0 hε k N
    (L.val.card:ℝ) hBL hcard
  have he : (fun ω=>boardLineLeafPower mask L p z k (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω))=
      (fun ω=>lineLeafPower (fun q : lineLeafSites L p z=>q.val) (fun q=>mask q.val) L p z k
        (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)) := by
    funext ω
    exact boardLineLeafPower_eq_subtype mask L p z k _ B (initialRootPhaseWitness_valid cs ε M deadline start p hn hB e N ω)
  rw [he]
  simpa only [Finset.sum_coe_sort] using hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.boardLineLeafPower_eq_subtype
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_boardLineLeafPower_bound
