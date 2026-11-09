import NoThreeLine.ReferenceLists

/-! Generic ordinal embedding, so concrete schedule lists need not reduce
while proving monotonicity of their reference index. -/
set_option autoImplicit false
namespace NoThreeLine.FrozenReference

def indexOfLength {N : ℕ} (h : N ≤ 15348) (i : Fin N) : Fin 15348 :=
  ⟨i.val,lt_of_lt_of_le i.isLt h⟩

theorem indexOfLength_strictMono {N : ℕ} (h : N ≤ 15348) : StrictMono (indexOfLength h) := by
  intro i j hij
  exact hij

end NoThreeLine.FrozenReference

#print axioms NoThreeLine.FrozenReference.indexOfLength_strictMono
