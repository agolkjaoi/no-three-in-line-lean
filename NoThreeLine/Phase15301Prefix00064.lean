import NoThreeLine.BenchmarkPrefixAccumulator

/-! Proposed checkpoint after exactly 64 frozen phases. Its equality to
the actual common-table updates is kernel checked below. This is a prefix
coefficient theorem, not yet the compressed geometric-field identity. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Prefix00064
open BenchmarkPrefix BenchmarkNatTree

def subtree00010111 : BenchmarkNatTree :=
  (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.branch (.branch (.uniform 0) (.uniform 294935223)) (.branch (.uniform 294935223) (.uniform 0))) (.uniform 0)) (.uniform 0)))) (.uniform 0)))

def subtree00011000 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.uniform 246335762) (.uniform 0)) (.uniform 0)))) (.uniform 0)) (.branch (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 294935223))))) (.branch (.branch (.uniform 246335762) (.branch (.branch (.uniform 246335762) (.uniform 0)) (.uniform 0))) (.uniform 0)))) (.uniform 0)))

def subtree00011001 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 294935223))))) (.branch (.branch (.uniform 246335762) (.branch (.uniform 246335762) (.uniform 0))) (.uniform 0)))) (.uniform 0)) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.uniform 246335762) (.branch (.uniform 246335762) (.branch (.uniform 246335762) (.uniform 0)))) (.uniform 0)))) (.uniform 0)))

def subtree00011010 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.branch (.branch (.uniform 0) (.uniform 246335762)) (.uniform 246335762)) (.uniform 246335762)) (.uniform 0)))) (.uniform 0)) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.branch (.uniform 0) (.uniform 246335762)) (.uniform 246335762)) (.branch (.branch (.branch (.uniform 314864438) (.uniform 0)) (.uniform 0)) (.uniform 0))))) (.uniform 0)))

def subtree00011011 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 246335762))) (.uniform 246335762)) (.branch (.branch (.uniform 314864438) (.uniform 0)) (.uniform 0))))) (.uniform 0)) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.uniform 246335762)) (.branch (.branch (.uniform 314864438) (.branch (.uniform 314864438) (.uniform 0))) (.uniform 0))))) (.uniform 0)))

def subtree00011100 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.uniform 314864438)) (.uniform 314864438))) (.branch (.uniform 148355083) (.uniform 0))))) (.uniform 0)) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 314864438))) (.branch (.uniform 148355083) (.branch (.branch (.uniform 148355083) (.uniform 0)) (.uniform 0)))))) (.uniform 0)))

def subtree00011101 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 314864438)))) (.branch (.uniform 148355083) (.branch (.uniform 148355083) (.uniform 0)))))) (.uniform 0)) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 148355083) (.branch (.uniform 148355083) (.branch (.uniform 148355083) (.uniform 0))))))) (.uniform 0)))

def subtree00011110 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.branch (.uniform 0) (.uniform 148355083)) (.uniform 148355083)) (.uniform 148355083))))) (.uniform 0)) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.uniform 148355083)) (.uniform 148355083))))) (.branch (.branch (.branch (.branch (.branch (.branch (.uniform 319013231) (.uniform 0)) (.uniform 0)) (.uniform 0)) (.uniform 0)) (.uniform 0)) (.uniform 0))))

def subtree00011111 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 148355083))) (.uniform 148355083))))) (.branch (.branch (.branch (.branch (.branch (.uniform 319013231) (.uniform 0)) (.uniform 0)) (.uniform 0)) (.uniform 0)) (.uniform 0))) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 148355083))))) (.branch (.branch (.branch (.branch (.branch (.uniform 319013231) (.branch (.uniform 319013231) (.uniform 0))) (.uniform 0)) (.uniform 0)) (.uniform 0)) (.uniform 0))))

def subtree00100000 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.uniform 319013231)) (.uniform 319013231)))))) (.branch (.branch (.branch (.branch (.uniform 148355083) (.uniform 0)) (.uniform 0)) (.uniform 0)) (.uniform 0))) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 319013231)))))) (.branch (.branch (.branch (.branch (.uniform 148355083) (.branch (.branch (.uniform 148355083) (.uniform 0)) (.uniform 0))) (.uniform 0)) (.uniform 0)) (.uniform 0))))

def subtree00100001 : BenchmarkNatTree :=
  (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 319013231))))))) (.branch (.branch (.branch (.branch (.uniform 148355083) (.branch (.uniform 148355083) (.uniform 0))) (.uniform 0)) (.uniform 0)) (.uniform 0))) (.branch (.uniform 0) (.branch (.branch (.branch (.branch (.uniform 148355083) (.branch (.uniform 148355083) (.branch (.uniform 148355083) (.uniform 0)))) (.uniform 0)) (.uniform 0)) (.uniform 0))))

def subtree00100010 : BenchmarkNatTree :=
  (.branch (.branch (.uniform 0) (.branch (.branch (.branch (.branch (.branch (.branch (.uniform 0) (.uniform 148355083)) (.uniform 148355083)) (.uniform 148355083)) (.uniform 0)) (.uniform 0)) (.uniform 0))) (.branch (.uniform 0) (.branch (.branch (.branch (.branch (.branch (.uniform 0) (.uniform 148355083)) (.uniform 148355083)) (.branch (.branch (.branch (.uniform 314864438) (.uniform 0)) (.uniform 0)) (.uniform 0))) (.uniform 0)) (.uniform 0))))

def subtree00100011 : BenchmarkNatTree :=
  (.branch (.branch (.uniform 0) (.branch (.branch (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 148355083))) (.uniform 148355083)) (.branch (.branch (.uniform 314864438) (.uniform 0)) (.uniform 0))) (.uniform 0)) (.uniform 0))) (.branch (.uniform 0) (.branch (.branch (.branch (.branch (.uniform 0) (.uniform 148355083)) (.branch (.branch (.uniform 314864438) (.branch (.uniform 314864438) (.uniform 0))) (.uniform 0))) (.uniform 0)) (.uniform 0))))

def subtree00100100 : BenchmarkNatTree :=
  (.branch (.branch (.uniform 0) (.branch (.branch (.branch (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.uniform 314864438)) (.uniform 314864438))) (.branch (.uniform 246335762) (.uniform 0))) (.uniform 0)) (.uniform 0))) (.branch (.uniform 0) (.branch (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 314864438))) (.branch (.uniform 246335762) (.branch (.branch (.uniform 246335762) (.uniform 0)) (.uniform 0)))) (.uniform 0)) (.uniform 0))))

def subtree00100101 : BenchmarkNatTree :=
  (.branch (.branch (.uniform 0) (.branch (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 314864438)))) (.branch (.uniform 246335762) (.branch (.uniform 246335762) (.uniform 0)))) (.uniform 0)) (.uniform 0))) (.branch (.uniform 0) (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 246335762) (.branch (.uniform 246335762) (.branch (.uniform 246335762) (.uniform 0))))) (.uniform 0)) (.uniform 0))))

def subtree00100110 : BenchmarkNatTree :=
  (.branch (.branch (.uniform 0) (.branch (.branch (.branch (.uniform 0) (.branch (.branch (.branch (.uniform 0) (.uniform 246335762)) (.uniform 246335762)) (.uniform 246335762))) (.uniform 0)) (.uniform 0))) (.branch (.uniform 0) (.branch (.branch (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.uniform 246335762)) (.uniform 246335762))) (.branch (.branch (.branch (.branch (.uniform 294935223) (.uniform 0)) (.uniform 0)) (.uniform 0)) (.uniform 0))) (.uniform 0))))

def subtree00100111 : BenchmarkNatTree :=
  (.branch (.branch (.uniform 0) (.branch (.branch (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 246335762))) (.uniform 246335762))) (.branch (.branch (.branch (.branch (.uniform 294935223) (.uniform 0)) (.uniform 0)) (.uniform 0)) (.uniform 0))) (.uniform 0))) (.branch (.uniform 0) (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.uniform 246335762))) (.uniform 0)) (.uniform 0))))

def subtree00101000 : BenchmarkNatTree :=
  (.branch (.branch (.uniform 0) (.branch (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.uniform 294935223)) (.branch (.uniform 294935223) (.uniform 0))))) (.uniform 0)) (.uniform 0))) (.uniform 0))

def tree : BenchmarkNatTree :=
  (.branch (.branch (.branch (.branch (.uniform 0) (.branch (.branch (.uniform 0) (.branch (.uniform 0) (.branch (.uniform 0) subtree00010111))) (.branch (.branch (.branch subtree00011000 subtree00011001) (.branch subtree00011010 subtree00011011)) (.branch (.branch subtree00011100 subtree00011101) (.branch subtree00011110 subtree00011111))))) (.branch (.branch (.branch (.branch (.branch subtree00100000 subtree00100001) (.branch subtree00100010 subtree00100011)) (.branch (.branch subtree00100100 subtree00100101) (.branch subtree00100110 subtree00100111))) (.branch (.branch (.branch subtree00101000 (.uniform 0)) (.uniform 0)) (.uniform 0))) (.uniform 0))) (.uniform 0)) (.uniform 0))

theorem checked : checkUpdates 16 (.uniform 0)
    (intervalUpdates 0 64 (by decide)) tree = true := by decide +kernel

theorem represents : Represents 64 (by decide) tree :=
  represents_step 0 64 (by decide) (.uniform 0) tree represents_zero checked

end NoThreeLine.Phase15301Prefix00064

#print axioms NoThreeLine.Phase15301Prefix00064.represents
