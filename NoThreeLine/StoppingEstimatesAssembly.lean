import NoThreeLine.ScheduledOutsideRiskMax
import NoThreeLine.ScheduledStarEarlySmall
import NoThreeLine.ScheduledStarCanonicalTail
import NoThreeLine.ScheduledProxyPartition
import NoThreeLine.LongShortMeanBudget

/-! Simultaneous import of the actual all-time credit error, short-star
early/late estimates, proxy partition and deterministic common mean budget.
This is an integration check, not a proof of the missing long-record bridge,
the remaining stopping estimates, the full numerical input or Target. -/

#print axioms NoThreeLine.ShortStars.exists_uniform_earlyStar_tail_threshold
#print axioms NoThreeLine.BirthWitness.long_short_mean_le_normalizedPairSum
