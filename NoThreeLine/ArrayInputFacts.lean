import Mathlib.Data.List.OfFn

/-! Preserve an array's literal order without reducing a separate lookup at
each index when comparing its finite enumeration with a certificate list. -/
set_option autoImplicit false
namespace NoThreeLine

theorem array_ofFn_getD {α : Type*} {n : ℕ} (a : Array α) (fallback : α)
    (h : a.size = n) :
    List.ofFn (fun i : Fin n => a.getD i.val fallback) = a.toList := by
  subst n
  have he : (fun i : Fin a.size => a.getD i.val fallback) =
      (fun i : Fin a.toList.length => a.toList[i.val]) := by
    funext i
    rw [← Array.getElem_eq_getD fallback]
    rfl
  rw [he]
  exact List.ofFn_getElem

end NoThreeLine

#print axioms NoThreeLine.array_ofFn_getD
