import NoThreeLine.ScheduleUnionBatch00000Integrable

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 400000
open MeasureTheory NoThreeLine.FinitePhase
open scoped BigOperators
noncomputable section
namespace NoThreeLine.ScheduleUnionBatch00000Schedule
open ScheduleUnionBatch00000

theorem literal_vector_relation4 {α β γ δ : Type*} {n : ℕ}
    (P : α → β → γ → δ → Prop) (a : α) (b : β) (c : γ) (d : δ)
    (v : Fin n → α) (w : Fin n → β) (x : Fin n → γ) (y : Fin n → δ)
    (h : P a b c d) (hv : ∀ i, P (v i) (w i) (x i) (y i)) :
    ∀ i, P (Matrix.vecCons a v i) (Matrix.vecCons b w i)
      (Matrix.vecCons c x i) (Matrix.vecCons d y i) := Fin.cases h hv

def phaseMasses (i : Fin 32) : ℝ := ![phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31] i

theorem phaseMasses_eq (i : Fin 32) :
    singlePhaseMass (duration i) (rootType i) (fields i) = phaseMasses i := by
  exact (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    319013231 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass0
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass1
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    319013231 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass2
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    319013231 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass3
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass4
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    319013231 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass5
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass6
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass7
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass8
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass9
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass10
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass11
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass12
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass13
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass14
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass15
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass16
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass17
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass18
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass19
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass20
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass21
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass22
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass23
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass24
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass25
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass26
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass27
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    314864438 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass28
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    148355083 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass29
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    314864438 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass30
    _ _ _ _ (by rfl) (literal_vector_relation4 (fun (d : ℕ) (r : Fin 4) (f : ℝ × ℝ → ℝ) (m : ℝ) => singlePhaseMass ((d : ℝ)/100000000) r f = m)
    314864438 0 (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real) (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) phaseMass31
    _ _ _ _ (by rfl) (fun i => Fin.elim0 i))))))))))))))))))))))))))))))))) i

theorem actual_schedule_mass : actualSchedule.typedInputMass rootType fields =
    (10182534583/3276800000000 : ℝ) := by
  unfold actualSchedule
  rw [scheduleOfDurations_mass duration duration_positive rootType fields fields_integrable]
  simp_rw [phaseMasses_eq]
  have hl : List.ofFn phaseMasses = [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31] := by rfl
  have he : (∑ i, phaseMasses i) = batchActualMass := by
    rw [← Fin.sum_ofFn,hl]
    rfl
  rw [he,actual_batch_mass]

end NoThreeLine.ScheduleUnionBatch00000Schedule

#print axioms NoThreeLine.ScheduleUnionBatch00000Schedule.actual_schedule_mass
