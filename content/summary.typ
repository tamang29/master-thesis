= Summary <summary-chapter>

== Status

This thesis improved Apollon across its reusable editor and the application and host contexts that depend on it. The outcomes correspond to the four objectives: modeling and application usability, collaborative modeling, educational integration, and diagram portability.

The work followed an iterative development process in which integration tests and qualitative feedback refined the requirements. The result is a coordinated set of improvements across these objectives rather than a single isolated feature release.

=== Realized Goals

The first objective was to improve modeling and application usability. More controllable and readable edges addressed avoidable correction work, while recurring editing controls addressed smaller sources of friction. The standalone home page and routing established a diagram-management workflow, and mobile file handling extended export beyond desktop-browser assumptions.

The second objective was to support collaborative modeling. Selection, cursor, participant, and viewport cues make collaborator activity visible and were moved into the Apollon library for reuse in standalone and Artemis sessions. This awareness remains transient session state, separate from the persisted diagram model.

The third objective was to enhance Apollon for educational systems. Artemis moved to the maintained integration while the required modeling, quiz, assessment, and team-modeling workflows continued to function, including targeted quiz and grading fixes. The VS Code extension likewise moved to the maintained renderer. A focused parser and playground update allowed Athena to consume the earlier and current serialized model formats required during the migration period; it was a compatibility update rather than a comparable refactor.

The fourth objective was to improve diagram portability. Server-side PDF generation and SVG and rendering fixes strengthened the production of derived visual artifacts, with visual checks helping to detect regressions. The persisted diagram model remains the source for later editing and conversion; these changes do not claim universal interoperability.

=== Remaining Limitations

The feedback-driven edge refinements were implemented after the walkthrough findings and were not evaluated in a controlled comparative study. Their effect on completion time, error rate, or perceived usability across diagram types therefore remains unquantified.

Persistence, ownership, and long-term project workflows remain open product directions. Strengthening them requires broader decisions about storage, identity, access policy, and collaboration behavior beyond editor-level improvements in the Apollon library.

Educational and review workflows also require deeper notation support and interoperability with surrounding tools. These additions need careful design so that more advanced teaching use does not make beginner workflows harder to approach.

Advanced editing and export hardening remain further limitations. Power-user controls and clearer sharing behavior must be balanced against the simplicity of the primary educational flow, while editable model exchange and visual export continue to impose different compatibility expectations.

== Conclusion

The thesis strengthened Apollon as a reusable educational modeling environment. Usability and integration proved connected: editing, collaboration, and export improvements become more valuable when the same behavior can be reused consistently across application contexts.

The central architectural lesson is to place reusable editor, model, rendering, callback, and awareness behavior in the Apollon library while hosts retain their workflows, persistence, access policy, sessions, and deployment. This boundary supported the move away from legacy behavior without transferring host responsibilities into the library. Qualitative feedback indicates that the direction addresses relevant workflows, but it does not replace a controlled usability study or imply that all usability problems are solved.

== Future Work

Future work should evaluate editor usability systematically across diagram types, sizes, and user groups. Deeper notation support and advanced editing controls should be developed without making the primary student workflow harder to learn.

Collaboration, persistence, ownership, and review form a second direction. Product-level work on these concerns should preserve the boundary between reusable awareness presentation and host-owned transport, storage, identity, and access policy.

Integration and portability form the third direction. Deeper educational review and assessment support, interoperability with textual and development workflows, and deterministic export should be pursued while keeping editable model exchange distinct from derived visual artifacts.
