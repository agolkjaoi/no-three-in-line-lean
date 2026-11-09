import NoThreeLine.ProtectedFirstSurvival
import NoThreeLine.FirstLineForbiddenLaw

/-! An actual first-event observation stopped at a deterministic local cut.
Before the cut it uses the actual candidate value; on survival it uses the
selected-flow value at the cut. The same first-forbidden law is retained. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedFirstCutValue {n : ℕ} (F : CandidateData n→ℝ) (u b : ℝ) (z : CandidateData n) : ℝ :=
  if z.1.1≤u then F z else b

theorem protectedFirstCutValue_integral {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (hN : occupancy s.val.1.physical.process L≤1)
    (hk : s.val.1.physical.clocks L≤K) (hd : ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true))
    (F : CandidateData n→ℝ) (hFm : Measurable F) (A : ℝ)
    (hFb : ∀z,‖augTimedLineLikelihood cfg ε M L (s,z)*F z‖≤A)
    (u b : ℝ) (hu : 0≤u) (hug : u≤augGuardTime cfg ε M (augTimedInput cfg s)) :
    (∫ω,protectedFirstCutValue F u b (WinnerMarkLaw.firstMarkedRace hn ω)
      ∂firstLineForbiddenLaw cfg ε M L hn s)=
      ∫t,(if t≤u then (∑q : Grid n,∫z,augTimedLineLikelihood cfg ε M L (s,((t,q),z))*F ((t,q),z)
          ∂markMeasure)/(n:ℝ)^2
        else selectedLineLikelihood cfg (augTimedInput cfg s).1.1 L u*b) ∂expMeasure ((n:ℝ)*cfg.B) := by
  classical
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  have hr : 0<(n:ℝ)*cfg.B := mul_pos hnR hB
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB hnR)
  letI := isProbabilityMeasure_expMeasure hr
  let μ := boardClockMeasure n (cfg.B/n)
  let ν := (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure)
  let W := fun z : CandidateData n=>augTimedLineLikelihood cfg ε M L (s,z)*F z
  let early := fun z : CandidateData n=>if z.1.1≤u then W z else 0
  let late := fun z : CandidateData n=>if u<z.1.1 then augTimedLineLikelihood cfg ε M L (s,z) else 0
  have hWm : Measurable W := (augTimedLineLikelihood_section_measurable cfg ε M L s).mul hFm
  have hem : Measurable early := hWm.piecewise
    (measurableSet_le measurable_fst.fst measurable_const) measurable_const
  have heb (z : CandidateData n) : ‖early z‖≤max A 0 := by
    dsimp only [early]
    split_ifs
    · exact (hFb z).trans (le_max_left _ _)
    · simpa using le_max_right A 0
  have hei : Integrable early ν := (integrable_const (max A 0)).mono' hem.aestronglyMeasurable (ae_of_all _ heb)
  have heiμ : Integrable (fun ω=>early (WinnerMarkLaw.firstMarkedRace hn ω)) μ :=
    (integrable_const (max A 0)).mono' (hem.comp (WinnerMarkLaw.firstMarkedRace_measurable hn)).aestronglyMeasurable
      (ae_of_all _ (fun ω=>heb _))
  have hlm : Measurable late := (augTimedLineLikelihood_section_measurable cfg ε M L s).piecewise
    (measurableSet_lt measurable_const measurable_fst.fst) measurable_const
  have hlb (z : CandidateData n) : ‖late z‖≤(2/(2-K))^2 := by
    dsimp only [late]
    split_ifs
    · rw [Real.norm_eq_abs,abs_of_nonneg (augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s hN hk z).1]
      exact (augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s hN hk z).2
    · simpa using sq_nonneg (2/(2-K))
  have hliμ : Integrable (fun ω=>late (WinnerMarkLaw.firstMarkedRace hn ω)) μ :=
    (integrable_const _).mono' (hlm.comp (WinnerMarkLaw.firstMarkedRace_measurable hn)).aestronglyMeasurable
      (ae_of_all _ (fun ω=>hlb _))
  have hs := augTimedLineLikelihood_survival_mean cfg ε M K hKcfg hK L hsp hn hB hm s hN hk hd u hu hug
  have hs' : (∫ω,late (WinnerMarkLaw.firstMarkedRace hn ω) ∂μ)=
      Real.exp (-((n:ℝ)*cfg.B*u))*selectedLineLikelihood cfg (augTimedInput cfg s).1.1 L u := hs
  have he := WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB early hei
  let e := fun t=>(∑q : Grid n,∫z,early ((t,q),z) ∂markMeasure)/(n:ℝ)^2
  have heiE : Integrable e (expMeasure ((n:ℝ)*cfg.B)) := by
    apply hei.integral_prod_left.integral_prod_left.congr
    exact ae_of_all _ (fun t=>BoardWinnerLaw.uniformGrid_integral hn _)
  have het (t : ℝ) : e t=if t≤u then
      (∑q : Grid n,∫z,W ((t,q),z) ∂markMeasure)/(n:ℝ)^2 else 0 := by
    dsimp only [e,early]
    split_ifs <;> simp
  let b' := selectedLineLikelihood cfg (augTimedInput cfg s).1.1 L u*b
  have htail : Integrable ((Ioi u).indicator (fun _ : ℝ=>b')) (expMeasure ((n:ℝ)*cfg.B)) :=
    (integrable_const _).indicator measurableSet_Ioi
  have hfun : (fun t=>if t≤u then (∑q : Grid n,∫z,W ((t,q),z) ∂markMeasure)/(n:ℝ)^2 else b')=
      (fun t=>e t+(Ioi u).indicator (fun _ : ℝ=>b') t) := by
    funext t
    rw [het]
    by_cases ht : t≤u
    · simp [ht,not_lt.mpr ht]
    · simp [ht,lt_of_not_ge ht]
  rw [firstLineForbiddenLaw,savedCreditMeasure_integral _ _
    (firstLineLikelihood_measurable cfg ε M L hn s)
    (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s hN hk _).1)]
  have hp : (fun ω=>augTimedLineLikelihood cfg ε M L (s,WinnerMarkLaw.firstMarkedRace hn ω)*
      protectedFirstCutValue F u b (WinnerMarkLaw.firstMarkedRace hn ω))=
      (fun ω=>early (WinnerMarkLaw.firstMarkedRace hn ω)+b*late (WinnerMarkLaw.firstMarkedRace hn ω)) := by
    funext ω
    dsimp only [protectedFirstCutValue,early,late,W]
    by_cases ht : (WinnerMarkLaw.firstMarkedRace hn ω).1.1≤u
    · simp [ht,not_lt.mpr ht]
    · simp [ht,lt_of_not_ge ht,mul_comm]
  rw [hp,integral_add heiμ (hliμ.const_mul b),integral_const_mul,hs',he]
  change (∫t,e t ∂expMeasure ((n:ℝ)*cfg.B))+_=
    ∫t,(if t≤u then (∑q : Grid n,∫z,W ((t,q),z) ∂markMeasure)/(n:ℝ)^2 else b') ∂expMeasure ((n:ℝ)*cfg.B)
  rw [hfun,integral_add heiE htail,integral_indicator measurableSet_Ioi,setIntegral_const,smul_eq_mul,
    expMeasure_real_Ioi ((n:ℝ)*cfg.B) u hr hu]
  dsimp only [b']
  ring

end NoThreeLine
#print axioms NoThreeLine.protectedFirstCutValue_integral
