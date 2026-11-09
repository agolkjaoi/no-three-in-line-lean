import NoThreeLine.MixedGeneratorAssembly
import NoThreeLine.SelectedEtaFlow
import Mathlib.Data.Nat.Choose.Cast

/-! A fixed orientation represents each unordered distinct label pair
exactly once. Its actual eta product has multiplicative derivative even
when one of its factors is zero. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.EtaPairProduct
open AuxiliaryODE PrimitiveLines MixedConnection

def pairRank {n : ℕ} : Grid n ≃ Fin (Fintype.card (Grid n)) := Fintype.equivFin _

def labelPairs {n : ℕ} (L : Finset (Grid n)) : Finset (Grid n × Grid n) :=
  (L.product L).filter (fun p=>pairRank p.1<pairRank p.2)

theorem mem_labelPairs {n : ℕ} (L : Finset (Grid n)) (a b : Grid n) :
    (a,b)∈labelPairs L ↔ a∈L ∧ b∈L ∧ pairRank a<pairRank b := by
  simp only [labelPairs,Finset.mem_filter,Finset.product_eq_sprod,Finset.mem_product]
  tauto

theorem labelPairs_ne {n : ℕ} (L : Finset (Grid n)) (p : Grid n × Grid n)
    (hp : p∈labelPairs L) : p.1≠p.2 := by
  have h := (mem_labelPairs L p.1 p.2).mp hp
  intro he
  simpa only [he,lt_self_iff_false] using h.2.2

theorem sum_labelPairs {n : ℕ} (L : Finset (Grid n)) (f : Grid n → Grid n → ℝ) :
    (∑ p∈labelPairs L,f p.1 p.2)=
      ∑ a∈L,∑ b∈L,if pairRank a<pairRank b then f a b else 0 := by
  simp only [labelPairs,Finset.sum_filter,Finset.product_eq_sprod,Finset.sum_product]

theorem sum_labelPairs_half {n : ℕ} (L : Finset (Grid n)) (f : Grid n → Grid n → ℝ)
    (hsym : ∀a b,f a b=f b a) (hdiag : ∀a,f a a=0) :
    (∑ p∈labelPairs L,f p.1 p.2)=(∑ a∈L,∑ b∈L,f a b)/2 := by
  have hp (a b : Grid n) : f a b=
      (if pairRank a<pairRank b then f a b else 0)+
      (if pairRank b<pairRank a then f b a else 0) := by
    rcases lt_trichotomy (pairRank a) (pairRank b) with h | h | h
    · simp [h,not_lt_of_ge h.le]
    · have he : a=b := pairRank.injective h
      subst b
      simp [hdiag]
    · simp [h,not_lt_of_ge h.le,hsym]
  have hrev : (∑ a∈L,∑ b∈L,if pairRank b<pairRank a then f b a else 0)=
      ∑ a∈L,∑ b∈L,if pairRank a<pairRank b then f a b else 0 := Finset.sum_comm
  have hsum : (∑ a∈L,∑ b∈L,f a b)=2*(∑ p∈labelPairs L,f p.1 p.2) := by
    calc
      _ = ∑ a∈L,∑ b∈L,((if pairRank a<pairRank b then f a b else 0)+
          (if pairRank b<pairRank a then f b a else 0)) := by
        apply Finset.sum_congr rfl
        intro a _
        exact Finset.sum_congr rfl (fun b _=>hp a b)
      _ = _ := by
        simp_rw [Finset.sum_add_distrib]
        rw [hrev,sum_labelPairs]
        ring
  linarith

theorem labelPairs_card {n : ℕ} (L : Finset (Grid n)) : (labelPairs L).card=L.card.choose 2 := by
  have hpair : (∑ p∈labelPairs L,if p.1=p.2 then (0:ℝ) else 1)=((labelPairs L).card:ℝ) := by
    calc
      _ = ∑ _p∈labelPairs L,(1:ℝ) :=
        Finset.sum_congr rfl (fun p hp=>if_neg (labelPairs_ne L p hp))
      _ = _ := by simp
  have hi (a : Grid n) (ha : a∈L) :
      (∑ b∈L,if a=b then (0:ℝ) else 1)=(L.card:ℝ)-1 := by
    calc
      _ = ∑ b∈L,(1-(if a=b then (1:ℝ) else 0)) := by
        apply Finset.sum_congr rfl
        intro b _
        by_cases hab : a=b <;> simp [hab]
      _ = _ := by rw [Finset.sum_sub_distrib]; simp [ha]
  have hhalf := sum_labelPairs_half L (fun a b=>if a=b then (0:ℝ) else 1)
    (fun a b=>by simp [eq_comm]) (fun a=>by simp)
  rw [hpair] at hhalf
  have hdouble : (∑ a∈L,∑ b∈L,if a=b then (0:ℝ) else 1)=(L.card:ℝ)*((L.card:ℝ)-1) := by
    calc
      _ = ∑ _a∈L,((L.card:ℝ)-1) := Finset.sum_congr rfl (fun a ha=>hi a ha)
      _ = _ := by simp [nsmul_eq_mul]; ring
  rw [hdouble,← Nat.cast_choose_two] at hhalf
  exact_mod_cast hhalf

def etaProduct {n : ℕ} (L : Finset (Grid n)) (η : EtaCoordinates n) : ℝ :=
  ∏ p∈labelPairs L,η p.1 p.2

def pairRateSum {n : ℕ} (L : Finset (Grid n)) (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) : ℝ :=
  ∑ p∈labelPairs L,pairRate s Γ mask z p.1 p.2

theorem pairRate_diagonal {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (p : Grid n) : pairRate s Γ mask z p p=0 := by
  simp [pairRate,commonChange,orientedArea]

theorem pairRateSum_half {n : ℕ} (L : Finset (Grid n)) (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) :
    pairRateSum L s Γ mask z=(∑ a∈L,∑ b∈L,pairRate s Γ mask z a b)/2 :=
  sum_labelPairs_half L (pairRate s Γ mask z) (pairRate_symm s Γ mask z) (pairRate_diagonal s Γ mask z)

theorem etaProduct_nonneg {n : ℕ} (L : Finset (Grid n)) (η : EtaCoordinates n)
    (hη : ∀a b,0≤η a b) : 0≤etaProduct L η :=
  Finset.prod_nonneg (fun p _=>hη p.1 p.2)

theorem etaProduct_floor {n : ℕ} (L : Finset (Grid n)) (η : EtaCoordinates n) (ε : ℝ)
    (hε : ε≤1) (hη : ∀a∈L,∀b∈L,a≠b→1-ε≤η a b) :
    (1-ε)^L.card.choose 2≤etaProduct L η := by
  have h := Finset.prod_le_prod (s:=labelPairs L) (f:=fun _=>1-ε) (g:=fun p=>η p.1 p.2)
    (fun _ _=>sub_nonneg.mpr hε) (fun p hp=>hη p.1 ((mem_labelPairs L p.1 p.2).mp hp).1
      p.2 ((mem_labelPairs L p.1 p.2).mp hp).2.1 (labelPairs_ne L p hp))
  simpa only [Finset.prod_const,labelPairs_card,etaProduct] using h

theorem etaProduct_hasDerivAt {n : ℕ} (L : Finset (Grid n)) (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (η : ℝ → EtaCoordinates n) (t : ℝ)
    (hd : HasDerivAt η (etaRHS s Γ mask z (η t)) t) :
    HasDerivAt (fun u=>etaProduct L (η u)) (etaProduct L (η t)*(-pairRateSum L s Γ mask z)) t := by
  have h := hasDerivAt_prod_multiplicative (labelPairs L) (fun p u=>η u p.1 p.2)
    (fun p=>-pairRate s Γ mask z p.1 p.2) t
    (fun p _=>hasDerivAt_pi.mp (hasDerivAt_pi.mp hd p.1) p.2)
  simpa only [Finset.sum_neg_distrib,etaProduct,pairRateSum] using h

theorem etaAlong_product_hasDerivAt {n : ℕ} (L : Finset (Grid n)) (s : ProcessState n)
    (Γ : Finset ZPoint) (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (hz : Continuous z)
    (η₀ : EtaCoordinates n) (t : ℝ) :
    HasDerivAt (fun u=>etaProduct L (etaAlong s Γ mask z η₀ u))
      (etaProduct L (etaAlong s Γ mask z η₀ t)*(-pairRateSum L s Γ mask (z t))) t :=
  etaProduct_hasDerivAt L s Γ mask (z t) _ t (etaAlong_hasDerivAt s Γ mask z hz η₀ t)

theorem selectedEtaProduct_hasDerivAt {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (L : Finset (Grid n)) (t : ℝ) :
    HasDerivAt (fun u=>etaProduct L (selectedEtaCurve cfg (x,u)))
      (etaProduct L (selectedEtaCurve cfg (x,t)) *
        (-pairRateSum L x.1.val.process cfg.directions cfg.mask (selectedCurve cfg (x.1,t)))) t :=
  etaProduct_hasDerivAt L x.1.val.process cfg.directions cfg.mask _ _ t
    (selectedEtaCurve_hasDerivAt cfg x t)

end NoThreeLine.EtaPairProduct

#print axioms NoThreeLine.EtaPairProduct.labelPairs_card
#print axioms NoThreeLine.EtaPairProduct.pairRateSum_half
#print axioms NoThreeLine.EtaPairProduct.etaProduct_floor
#print axioms NoThreeLine.EtaPairProduct.selectedEtaProduct_hasDerivAt
