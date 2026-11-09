import NoThreeLine.SourceNestedCut
import NoThreeLine.WitnessTwoCuts
import NoThreeLine.TwoCutLeafPoint
import NoThreeLine.ScheduledCutFutureTower

/-! Integration check: the original nested-cut hierarchy, the repaired
two-cut estimate, the leaf point law and full-future one-cut tower coexist. -/
#check NoThreeLine.BirthWitness.sourceCutTerminal_add
#check NoThreeLine.BirthWitness.sourceCutTerminal_add_commuted
#check NoThreeLine.BirthWitness.source_free_two_cuts_le_ae_earlier
#check NoThreeLine.BirthWitness.two_cutPoint_rootLeaf_le_ae_earlier
