# AI use and attribution

This research and formalization have involved substantial use of OpenAI ChatGPT/Codex and AI reviews supplied by the project maintainer.

AI systems contributed mathematical proposals and derivations, proof organization, numerical programs, exact-arithmetic checks, Lean definitions and proofs, build orchestration, documentation and review. Separate AI contexts reviewed portions of the work. These reviews are not independent human peer review and do not provide an additional formal guarantee.

The human maintainer selected the research direction, requested revisions and experiments, and directed the work as a hobby project. This statement does not attribute every mathematical or programming step to human authorship.

The English manuscripts added on 10 November 2026 were assembled and checked with ChatGPT/Codex from the preparation notes, followups and later 481-phase dossier. AI work included translation, new mathematical exposition and derivations, checker review, exact-arithmetic checking, full finite replay, packaging and PDF layout review.

[Version 0.2](docs/paper/481-phase/) presents an ordinary mathematical, computer-assisted proof of the `1.501 n` lower bound for all sufficiently large integer grids. Its finite input was rebuilt and replayed across all 481 phases and 242,176 positive type/cells. The stochastic arguments are natural-language proofs in the manuscript; the finite replay checks the geometric input and does not certify those arguments automatically. Version 0.1 had a conditional numerical application, and that limitation should not be confused with the stated scope of Version 0.2.

No independent human peer review or complete formal verification of Version 0.2 is claimed. The separate 3,242-module Lean snapshot is unchanged, and it does not prove the final `Target`. Separate AI reviews and a fresh execution are recorded as those activities, not as independent human authorship or human peer review.

Lean compilation checks the formal statements with their actual hypotheses. It does not automatically establish that those statements express the intended mathematical problem, that unverified inputs satisfy their premises, or that all research-note claims are correct.

No named author, affiliation or personal contact information is supplied for the original project material. Existing third-party attributions are retained where applicable. Publication under a GitHub account would identify the hosting account; this statement is not a claim of anonymous hosting.
