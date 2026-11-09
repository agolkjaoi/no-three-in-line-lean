import NoThreeLine.FullCertificate

/-! The finite field and signed-edge checks are independent of the query root
box. Reuse them only with the same R,w,E,M and a newly checked ordered box. -/
set_option autoImplicit false
namespace NoThreeLine

theorem fullDataCheck_change_root {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q Q' : QRect) (M : ℚ)
    (hd : fullDataCheck R w E Q M=true)
    (hQ : Q'.x0≤Q'.x1 ∧ Q'.y0≤Q'.y1) : fullDataCheck R w E Q' M=true := by
  simp only [fullDataCheck,decide_eq_true_eq] at hd ⊢
  rcases hd with ⟨hM,hU,hw,hs,hE,hm,_⟩
  exact ⟨hM,hU,hw,hs,hE,hm,hQ⟩

end NoThreeLine

#print axioms NoThreeLine.fullDataCheck_change_root
