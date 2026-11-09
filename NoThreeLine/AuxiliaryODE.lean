import NoThreeLine.ProcessODE
import NoThreeLine.LineDrift

/-! Actual finite line clocks in a fixed discrete phase. We use a polynomial
extension of Lambda/a_N outside the stopping region, prove agreement inside
the region, and obtain local solutions for the full weight/clock/credit system.
No boundary hitting or concatenated stochastic law is asserted here. -/
set_option autoImplicit false
open Set Metric
open scoped BigOperators NNReal
noncomputable section

namespace NoThreeLine.AuxiliaryODE
open PrimitiveLines GridLines LineDrift

def boardLines (n : ℕ) : Finset (Finset (Grid n)) := by
  classical
  exact Finset.univ.biUnion (fun p : Grid n => linesThrough p)

abbrev LineIndex (n : ℕ) := ↥(boardLines n)
abbrev Coordinates (n : ℕ) :=
  (Grid n → ℝ) × ((LineIndex n → ℝ) × (LineIndex n → ℝ))

def specified {n : ℕ} (Γ : Finset ZPoint) (L : LineIndex n) : Prop :=
  ∃ p∈L.val, L.val∈designatedLines Γ p

instance {n : ℕ} (Γ : Finset ZPoint) (L : LineIndex n) : Decidable (specified Γ L) :=
  inferInstanceAs (Decidable (∃ p∈L.val, L.val∈designatedLines Γ p))

def occupancy {n : ℕ} (s : ProcessState n) (L : LineIndex n) : ℕ :=
  (s.selected∩L.val).card

def phaseRate {n : ℕ} (s : ProcessState n) (mask w : Grid n → ℝ) (q : Grid n) : ℝ :=
  if s.stopped=false ∧ (s.accounts q).status=.active then mask q*w q/n else 0

def lineIntensity {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ)
    (z : Coordinates n) (L : LineIndex n) : ℝ := ∑ q∈L.val, phaseRate s mask z.1 q

/-- The manuscript's a_N(k), used only with N=0,1 and k<2. -/
def protection (N : ℕ) (k : ℝ) : ℝ := (2-(N:ℝ))/(2-k)

def clockRHS {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (z : Coordinates n) (L : LineIndex n) : ℝ :=
  if s.stopped=false ∧ specified Γ L ∧ occupancy s L≤1 then
    lineIntensity s mask z L*(2-z.2.1 L)/(2-(occupancy s L:ℝ)) else 0

def lineCreditRHS {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (z : Coordinates n) (L : LineIndex n) : ℝ :=
  if s.stopped=false ∧ ¬specified Γ L ∧ occupancy s L=1 then
    -(z.2.2 L)*lineIntensity s mask z L else 0

def vectorField {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (z : Coordinates n) : Coordinates n :=
  (s.compensatedVectorField Γ mask z.1,
   (fun L => clockRHS s Γ mask z L, fun L => lineCreditRHS s Γ mask z L))

/-- The closed upper guards and the positive weight lower side of the actual
stopping region. Initial strict guards are imposed separately when needed. -/
def StoppingRegion {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (B K ρ : ℝ) (z : Coordinates n) : Prop :=
  (∀ p, (s.accounts p).status=.active → 0<z.1 p ∧ z.1 p≤B) ∧
  (∀ L, specified Γ L → occupancy s L≤1 → 0≤z.2.1 L ∧ z.2.1 L≤K) ∧
  (∀ L, ¬specified Γ L → occupancy s L=1 → ρ≤z.2.2 L ∧ z.2.2 L≤1)

theorem phaseRate_at_state {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ) (q : Grid n) :
    phaseRate s mask (fun p => (s.accounts p).weight) q=s.birthRate mask q := rfl

theorem lineIntensity_at_state {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ)
    (k r : LineIndex n → ℝ) (L : LineIndex n) :
    lineIntensity s mask ((fun p => (s.accounts p).weight),(k,r)) L =
      ∑ q∈L.val, s.birthRate mask q := rfl

theorem designated_is_boardLine {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (L : Finset (Grid n)) (hL : L∈designatedLines Γ p) : L∈boardLines n := by
  classical
  exact Finset.mem_biUnion.mpr ⟨p,Finset.mem_univ p,(Finset.mem_inter.mp hL).2⟩

theorem designated_specified {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (L : LineIndex n) (hL : L.val∈designatedLines Γ p) : specified Γ L :=
  ⟨p,root_mem_designated Γ p L.val hL,hL⟩

theorem directionLine_rebase {n : ℕ} (p r : Grid n) (d : ZPoint)
    (hr : r∈directionLine p d) : directionLine p d=directionLine r d := by
  apply Finset.ext
  intro q
  simp only [directionLine,mem_gridLinePoints]
  have hr' := (mem_gridLinePoints (gridEmbed p) d r).mp hr
  have he : det d (gridEmbed q-gridEmbed r) =
      det d (gridEmbed q-gridEmbed p)-det d (gridEmbed r-gridEmbed p) := by
    dsimp [det]
    ring
  rw [he,hr',sub_zero]

theorem boardLine_has_other {n : ℕ} (L : LineIndex n) (p : Grid n) :
    ∃ q∈L.val, p≠q := by
  classical
  obtain ⟨r,_,hL⟩ := Finset.mem_biUnion.mp L.property
  obtain ⟨q,hq,he⟩ := Finset.mem_image.mp hL
  have hrq : r≠q := fun h => (Finset.mem_erase.mp hq).1 h.symm
  by_cases hpr : p=r
  · refine ⟨q,?_,hpr ▸ hrq⟩
    rw [←he]
    exact right_mem_lineThrough r q
  · refine ⟨r,?_,hpr⟩
    rw [←he]
    exact left_mem_lineThrough r q

/-- The global physical-line clock classification is exactly the S1
classification at every root on the line. -/
theorem specified_iff_designated {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (L : LineIndex n) (hp : p∈L.val) : specified Γ L ↔ L.val∈designatedLines Γ p := by
  classical
  constructor
  · rintro ⟨r,_,hrL⟩
    obtain ⟨d,hd,he⟩ := Finset.mem_image.mp (Finset.mem_inter.mp hrL).1
    have hdp : p∈directionLine r d := by simpa only [he] using hp
    have he' : directionLine p d=L.val := (directionLine_rebase r p d hdp).symm.trans he
    obtain ⟨q,hq,hpq⟩ := boardLine_has_other L p
    have hdq : q∈directionLine p d := by simpa only [he'] using hq
    have heL : L.val=lineThrough p q := he'.symm.trans
      (directionLine_eq_lineThrough p q d (Finset.mem_filter.mp hd).2 hpq hdq)
    apply Finset.mem_inter.mpr
    constructor
    · exact Finset.mem_image.mpr ⟨d,hd,he'⟩
    · rw [heL]
      exact lineThrough_mem_linesThrough p q hpq
  · exact designated_specified Γ p L

theorem protection_pos (N : ℕ) (k : ℝ) (hN : N≤1) (hk : k<2) : 0<protection N k := by
  have hNr : (N:ℝ)≤1 := by exact_mod_cast hN
  unfold protection
  exact div_pos (by linarith) (by linarith)

theorem clockRHS_eq_manuscript {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (L : LineIndex n)
    (hs : s.stopped=false) (hsp : specified Γ L) (hN : occupancy s L≤1)
    (hk : z.2.1 L<2) :
    clockRHS s Γ mask z L=lineIntensity s mask z L/protection (occupancy s L) (z.2.1 L) := by
  have hNr : (occupancy s L:ℝ)≤1 := by exact_mod_cast hN
  have hden : (2-(occupancy s L:ℝ))≠0 := by linarith
  have hkden : 2-z.2.1 L≠0 := by linarith
  simp only [clockRHS,hs,hsp,hN,and_self,if_true,protection]
  field_simp

theorem clockRHS_eq_manuscript_in_region {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (B K ρ : ℝ) (z : Coordinates n) (L : LineIndex n)
    (hs : s.stopped=false) (hsp : specified Γ L) (hN : occupancy s L≤1)
    (hK : K<2) (hz : StoppingRegion s Γ B K ρ z) :
    clockRHS s Γ mask z L=lineIntensity s mask z L/protection (occupancy s L) (z.2.1 L) :=
  clockRHS_eq_manuscript s Γ mask z L hs hsp hN (lt_of_le_of_lt (hz.2.1 L hsp hN).2 hK)

theorem lineCreditRHS_eq_manuscript {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (L : LineIndex n)
    (hs : s.stopped=false) (hsp : ¬specified Γ L) (hN : occupancy s L=1) :
    lineCreditRHS s Γ mask z L= -(z.2.2 L)*lineIntensity s mask z L := by
  simp [lineCreditRHS,hs,hsp,hN]

theorem clocks_frozen_after_two {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (L : LineIndex n) (hN : 2≤occupancy s L) :
    clockRHS s Γ mask z L=0 ∧ lineCreditRHS s Γ mask z L=0 := by
  have h0 : ¬occupancy s L≤1 := by omega
  have h1 : occupancy s L≠1 := by omega
  simp [clockRHS,lineCreditRHS,h0,h1]

theorem vectorField_stopped {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (hs : s.stopped=true) :
    vectorField s Γ mask z=0 := by
  ext p <;> simp [vectorField,ProcessState.compensatedVectorField,clockRHS,lineCreditRHS,hs]

theorem phaseRate_nonneg_in_region {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (B K ρ : ℝ) (z : Coordinates n)
    (hm : ∀ p, 0≤mask p) (hz : StoppingRegion s Γ B K ρ z) (q : Grid n) :
    0≤phaseRate s mask z.1 q := by
  unfold phaseRate
  split_ifs with h
  · exact div_nonneg (mul_nonneg (hm q) (hz.1 q h.2).1.le) (Nat.cast_nonneg _)
  · exact le_rfl

theorem lineIntensity_nonneg_in_region {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (B K ρ : ℝ) (z : Coordinates n)
    (hm : ∀ p, 0≤mask p) (hz : StoppingRegion s Γ B K ρ z) (L : LineIndex n) :
    0≤lineIntensity s mask z L :=
  Finset.sum_nonneg (fun q _ => phaseRate_nonneg_in_region s Γ mask B K ρ z hm hz q)

theorem clockRHS_nonneg_in_region {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (B K ρ : ℝ) (z : Coordinates n)
    (hm : ∀ p, 0≤mask p) (hK : K<2) (hz : StoppingRegion s Γ B K ρ z)
    (L : LineIndex n) : 0≤clockRHS s Γ mask z L := by
  unfold clockRHS
  split_ifs with h
  · have hk := (hz.2.1 L h.2.1 h.2.2).2
    have hN : (occupancy s L:ℝ)≤1 := by exact_mod_cast h.2.2
    exact div_nonneg (mul_nonneg (lineIntensity_nonneg_in_region s Γ mask B K ρ z hm hz L)
      (by linarith)) (by linarith)
  · exact le_rfl

theorem lineCreditRHS_nonpos_in_region {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (B K ρ : ℝ) (z : Coordinates n)
    (hm : ∀ p, 0≤mask p) (hρ : 0≤ρ) (hz : StoppingRegion s Γ B K ρ z)
    (L : LineIndex n) : lineCreditRHS s Γ mask z L≤0 := by
  unfold lineCreditRHS
  split_ifs with h
  · have hr := (hz.2.2 L h.2.1 h.2.2).1
    exact mul_nonpos_of_nonpos_of_nonneg (by linarith)
      (lineIntensity_nonneg_in_region s Γ mask B K ρ z hm hz L)
  · exact le_rfl

theorem phaseRate_contDiff {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ) (q : Grid n) :
    ContDiff ℝ 1 (fun z : Coordinates n => phaseRate s mask z.1 q) := by
  unfold phaseRate
  split_ifs <;> fun_prop

theorem lineIntensity_contDiff {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ)
    (L : LineIndex n) : ContDiff ℝ 1 (fun z : Coordinates n => lineIntensity s mask z L) := by
  apply ContDiff.sum
  intro q _
  exact phaseRate_contDiff s mask q

theorem clockRHS_contDiff {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (L : LineIndex n) :
    ContDiff ℝ 1 (fun z : Coordinates n => clockRHS s Γ mask z L) := by
  unfold clockRHS
  split_ifs
  · exact ((lineIntensity_contDiff s mask L).mul (by fun_prop)).div_const _
  · fun_prop

theorem lineCreditRHS_contDiff {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (L : LineIndex n) :
    ContDiff ℝ 1 (fun z : Coordinates n => lineCreditRHS s Γ mask z L) := by
  unfold lineCreditRHS
  split_ifs
  · exact (by fun_prop : ContDiff ℝ 1 (fun z : Coordinates n => -(z.2.2 L))).mul
      (lineIntensity_contDiff s mask L)
  · fun_prop

theorem vectorField_contDiff {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) : ContDiff ℝ 1 (vectorField s Γ mask) := by
  apply ContDiff.prodMk
  · exact (s.compensatedVectorField_contDiff Γ mask).comp (by fun_prop)
  · apply ContDiff.prodMk
    · exact contDiff_pi.mpr (fun L => clockRHS_contDiff s Γ mask L)
    · exact contDiff_pi.mpr (fun L => lineCreditRHS_contDiff s Γ mask L)

/-- Jointly continuous local flow for the actual weights and all actual line
clocks. The agreement theorem above identifies the clock RHS throughout the
stopping region with the frozen manuscript. -/
theorem local_extended_flow {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z₀ : Coordinates n) (t₀ : ℝ) :
    ∃ r > (0:ℝ), ∃ ε > (0:ℝ), ∃ φ : (Coordinates n × ℝ) → Coordinates n,
      (∀ z∈closedBall z₀ r, φ (z,t₀)=z ∧
        ∀ t∈Icc (t₀-ε) (t₀+ε), HasDerivWithinAt (fun t => φ (z,t))
          (vectorField s Γ mask (φ (z,t))) (Icc (t₀-ε) (t₀+ε)) t) ∧
      ContinuousOn φ (closedBall z₀ r ×ˢ Icc (t₀-ε) (t₀+ε)) := by
  have hf := (vectorField_contDiff s Γ mask).contDiffAt (x:=z₀)
  obtain ⟨ε,hε,a,r,L,K,hr,hpl⟩ := IsPicardLindelof.of_contDiffAt_one hf
  obtain ⟨φ,hφ,hcont⟩ := (hpl t₀).exists_forall_mem_closedBall_eq_hasDerivWithinAt_continuousOn
  exact ⟨r,hr,ε,hε,φ,hφ,hcont⟩

theorem vectorField_weight_S1_at_state {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (k r : LineIndex n → ℝ) (p : Grid n)
    (hs : s.Valid) (hstop : s.stopped=false) (hp : (s.accounts p).status=.active) :
    (vectorField s Γ mask ((fun q => (s.accounts q).weight),(k,r))).1 p =
      (s.accounts p).weight *
        (s.birthRate mask p + outsideHazard Γ s.selected p s.activeEvents (s.birthRate mask) +
          ∑ L∈designatedLines Γ p,
            ((∑ q∈L, s.birthRate mask q)-s.birthRate mask p)*b (s.selected∩L).card) := by
  change s.compensatedVectorField Γ mask (fun q => (s.accounts q).weight) p = _
  rw [s.compensatedVectorField_at_state Γ mask p,
    state_continuousDrift_S1 s Γ mask p hs hstop hp]

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.clockRHS_eq_manuscript_in_region
#print axioms NoThreeLine.AuxiliaryODE.vectorField_contDiff
#print axioms NoThreeLine.AuxiliaryODE.local_extended_flow
#print axioms NoThreeLine.AuxiliaryODE.vectorField_weight_S1_at_state
#print axioms NoThreeLine.AuxiliaryODE.clockRHS_nonneg_in_region
#print axioms NoThreeLine.AuxiliaryODE.lineCreditRHS_nonpos_in_region
#print axioms NoThreeLine.AuxiliaryODE.specified_iff_designated
