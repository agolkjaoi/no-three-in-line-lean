import NoThreeLine.Phase15301Compressed2Data
import NoThreeLine.BenchmarkFastRanges

/-! Rectangle entries [0,32), using the exact matched input table. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Compressed2Chunk00
open BenchmarkPrefix BenchmarkNatTree

def boxList : List (GridBox × ℕ) := (Phase15301Compressed2Data.entries.toList.drop 0).take 32

def subtree000000 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.branch (.branch (.uniform 313955077) (.uniform 490015823)) (.branch (.uniform 312999627) (.uniform 206500221))) (.branch (.branch (.uniform 218087980) (.uniform 360605740)) (.branch (.uniform 461917238) (.uniform 530582158)))) (.branch (.branch (.branch (.uniform 437481692) (.uniform 511251292)) (.branch (.uniform 461196557) (.uniform 500025365))) (.branch (.branch (.uniform 425731449) (.uniform 416941059)) (.branch (.uniform 212521008) (.uniform 179201716))))) (.branch (.branch (.branch (.branch (.uniform 313955077) (.uniform 490015823)) (.branch (.uniform 312999627) (.uniform 206500221))) (.branch (.branch (.uniform 218087980) (.uniform 360605740)) (.branch (.uniform 461917238) (.uniform 530582158)))) (.branch (.branch (.branch (.uniform 437481692) (.uniform 511251292)) (.branch (.uniform 461196557) (.uniform 500025365))) (.branch (.branch (.uniform 425731449) (.uniform 416941059)) (.branch (.uniform 405023045) (.uniform 179201716))))))

def subtree000001 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.branch (.branch (.uniform 313955077) (.uniform 490015823)) (.branch (.uniform 312999627) (.uniform 206500221))) (.branch (.branch (.uniform 218087980) (.uniform 360605740)) (.branch (.uniform 461917238) (.uniform 530582158)))) (.branch (.branch (.branch (.uniform 437481692) (.uniform 511251292)) (.branch (.uniform 461196557) (.uniform 500025365))) (.branch (.branch (.uniform 425731449) (.uniform 416941059)) (.branch (.uniform 405023045) (.uniform 179201716))))) (.branch (.branch (.branch (.branch (.uniform 313955077) (.uniform 490015823)) (.branch (.uniform 312999627) (.uniform 206500221))) (.branch (.branch (.uniform 218087980) (.uniform 360605740)) (.branch (.uniform 461917238) (.uniform 530582158)))) (.branch (.branch (.branch (.uniform 437481692) (.uniform 511251292)) (.branch (.uniform 461196557) (.uniform 500025365))) (.branch (.branch (.uniform 425731449) (.uniform 416941059)) (.branch (.uniform 405023045) (.uniform 179201716))))))

def subtree000010 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.branch (.branch (.uniform 313955077) (.uniform 490015823)) (.branch (.uniform 312999627) (.uniform 206500221))) (.branch (.branch (.uniform 218087980) (.uniform 360605740)) (.branch (.uniform 461917238) (.uniform 530582158)))) (.branch (.branch (.branch (.uniform 437481692) (.uniform 511251292)) (.branch (.uniform 461196557) (.uniform 500025365))) (.branch (.branch (.uniform 425731449) (.uniform 416941059)) (.branch (.uniform 405023045) (.uniform 179201716))))) (.branch (.branch (.branch (.branch (.uniform 313955077) (.uniform 490015823)) (.branch (.uniform 312999627) (.uniform 206500221))) (.branch (.branch (.uniform 218087980) (.uniform 360605740)) (.branch (.uniform 461917238) (.uniform 530582158)))) (.branch (.branch (.branch (.uniform 437481692) (.uniform 511251292)) (.branch (.uniform 461196557) (.uniform 500025365))) (.branch (.branch (.uniform 425731449) (.uniform 416941059)) (.branch (.uniform 405023045) (.uniform 179201716))))))

def subtree000011 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.branch (.branch (.uniform 313955077) (.uniform 490015823)) (.branch (.uniform 312999627) (.uniform 206500221))) (.branch (.branch (.uniform 218087980) (.uniform 360605740)) (.branch (.uniform 461917238) (.uniform 530582158)))) (.branch (.branch (.branch (.uniform 437481692) (.uniform 511251292)) (.branch (.uniform 461196557) (.uniform 500025365))) (.branch (.branch (.uniform 425731449) (.uniform 416941059)) (.branch (.uniform 405023045) (.uniform 179201716))))) (.branch (.branch (.branch (.branch (.uniform 313955077) (.uniform 490015823)) (.branch (.uniform 312999627) (.uniform 206500221))) (.branch (.branch (.uniform 218087980) (.uniform 360605740)) (.branch (.uniform 461917238) (.uniform 530582158)))) (.branch (.branch (.branch (.uniform 437481692) (.uniform 511251292)) (.branch (.uniform 461196557) (.uniform 500025365))) (.branch (.branch (.uniform 425731449) (.uniform 416941059)) (.branch (.branch (.uniform 405023045) (.branch (.uniform 405023045) (.branch (.uniform 405023045) (.uniform 212521008)))) (.uniform 179201716))))))

def subtree000100 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.branch (.branch (.uniform 490015823) (.uniform 81567028)) (.branch (.uniform 135972718) (.uniform 120556141))) (.branch (.branch (.uniform 212739470) (.uniform 206343479)) (.branch (.uniform 278208253) (.uniform 192933303)))) (.branch (.branch (.branch (.uniform 244426983) (.uniform 175999440)) (.branch (.uniform 275747543) (.uniform 0))) (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 155962693)))) (.branch (.branch (.branch (.uniform 212521008) (.uniform 0)) (.uniform 0)) (.uniform 0)))))) (.branch (.branch (.branch (.branch (.uniform 490015823) (.uniform 81567028)) (.branch (.uniform 135972718) (.uniform 120556141))) (.branch (.branch (.uniform 212739470) (.uniform 206343479)) (.branch (.uniform 278208253) (.uniform 192933303)))) (.branch (.branch (.branch (.uniform 244426983) (.uniform 175999440)) (.branch (.uniform 275747543) (.uniform 0))) (.uniform 0))))

def subtree000101 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.branch (.branch (.uniform 490015823) (.uniform 81567028)) (.branch (.uniform 135972718) (.uniform 120556141))) (.branch (.branch (.uniform 212739470) (.uniform 206343479)) (.branch (.uniform 278208253) (.uniform 192933303)))) (.branch (.branch (.branch (.uniform 244426983) (.uniform 175999440)) (.branch (.uniform 275747543) (.uniform 0))) (.uniform 0))) (.branch (.branch (.branch (.branch (.uniform 490015823) (.uniform 81567028)) (.branch (.uniform 135972718) (.uniform 120556141))) (.branch (.branch (.uniform 212739470) (.uniform 206343479)) (.branch (.uniform 278208253) (.uniform 192933303)))) (.branch (.branch (.branch (.uniform 244426983) (.uniform 175999440)) (.branch (.uniform 275747543) (.uniform 0))) (.uniform 0))))

def subtree000110 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.branch (.branch (.uniform 490015823) (.uniform 81567028)) (.branch (.uniform 135972718) (.uniform 120556141))) (.branch (.branch (.uniform 212739470) (.uniform 206343479)) (.branch (.uniform 278208253) (.uniform 192933303)))) (.branch (.branch (.branch (.uniform 244426983) (.uniform 175999440)) (.branch (.uniform 275747543) (.uniform 0))) (.uniform 0))) (.branch (.branch (.branch (.branch (.uniform 490015823) (.uniform 81567028)) (.branch (.uniform 135972718) (.uniform 120556141))) (.branch (.branch (.uniform 212739470) (.uniform 206343479)) (.branch (.uniform 278208253) (.uniform 192933303)))) (.branch (.branch (.branch (.uniform 244426983) (.uniform 175999440)) (.branch (.uniform 275747543) (.uniform 0))) (.uniform 0))))

def subtree000111 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.branch (.branch (.uniform 490015823) (.uniform 81567028)) (.branch (.uniform 135972718) (.uniform 120556141))) (.branch (.branch (.uniform 212739470) (.uniform 206343479)) (.branch (.uniform 278208253) (.uniform 192933303)))) (.branch (.branch (.branch (.uniform 244426983) (.uniform 175999440)) (.branch (.uniform 275747543) (.uniform 0))) (.uniform 0))) (.branch (.branch (.branch (.branch (.uniform 490015823) (.uniform 81567028)) (.branch (.uniform 135972718) (.uniform 120556141))) (.branch (.branch (.uniform 212739470) (.uniform 206343479)) (.branch (.uniform 278208253) (.uniform 192933303)))) (.branch (.branch (.branch (.uniform 244426983) (.uniform 175999440)) (.branch (.uniform 275747543) (.uniform 0))) (.uniform 0))))

def tree : BenchmarkNatTree :=
  (.branch (.branch (.branch (.branch (.branch (.branch subtree000000 subtree000001) (.branch subtree000010 subtree000011)) (.branch (.branch subtree000100 subtree000101) (.branch subtree000110 subtree000111))) (.uniform 0)) (.uniform 0)) (.uniform 0))

theorem checked : checkRanges 14 (.uniform 0) (boxesRanges boxList) tree=true := by
  apply checkRanges_of_fast
  decide +kernel

end NoThreeLine.Phase15301Compressed2Chunk00
#print axioms NoThreeLine.Phase15301Compressed2Chunk00.checked
