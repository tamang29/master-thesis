# Apollon-native diagram plan (standalone checklist)

Supported types (authoritative, fetched 2026-07-23 from https://ls1intum.github.io/Apollon/ — "13 diagram types"): Class, Object, Activity, Use Case, Communication, Component, Deployment, Petri Net, Reachability Graph, Syntax Tree, Flowchart, BPMN, SFC. Exports: SVG, PNG, PDF, JSON; PPTX via the web app. Constraint to respect: Apollon activity diagrams have **no swimlanes** (the thesis itself lists swimlanes as future work) — corpus-style swimlane activity models must be redesigned lane-free, not faked.

Anti-forcing test — a diagram stays only if all four hold: (a) carries information the audience needs; (b) a committee member would expect/benefit from it; (c) differs in type from its neighbors or is a justified progressive build; (d) removing it leaves a real gap.

## Main story

| Stage | Apollon type | What only this diagram conveys | Anti-forcing verdict | JSON source |
| --- | --- | --- | --- | --- |
| Context / ecosystem (slide 2 or 3) | **Component** | Two applications + three integrations reuse one library; Artemis first among integrations | **Pass**, conditional: keep it *light* (top-level subsystems only) and place it after the problem — corpus never opens with a formal model (0/17) | `presentation-research/diagrams/apollon-products-and-integrations.json` ✓ |
| Scope / actors (after objectives) | **Use Case** | One model serves individual, collaborative, and teaching work; existing/modified/added status | **Pass** — corpus-rewarded (10/17), committee-expected. Must be re-staged full-width landscape (currently 30% ink width) | `figures/requirements-use-case-model.json` ✓ |
| Collaboration / awareness (O2) | **Communication** | The two message streams in one session: persisted CRDT model updates vs transient awareness (cursor/selection/drag/viewport) through the relay | **Pass with obligation** — 0/17 corpus precedent, so it earns its place only if legible: full band + 2-step build or simplification. Unique O2 information + dogfoods a native type the corpus never shows | `figures/standalone-collaboration-communication.json` ✓ |
| Artemis integration (O3) | **Component** | The boundary claim: Artemis owns teaching workflows, Apollon owns editor behavior | **Pass** — the corpus's near-universal type (15/17), carries the thesis's central architecture claim | `presentation-research/diagrams/artemis-apollon-integration-focus.json` ✓ |
| Quiz generation (O3) | **Activity** | Selection → nested resolution → background/cut-outs/drop locations in one coordinate system | **Pass** — different type from neighbors, explains the repaired pipeline end-to-end; lane-free design already matches Apollon's capability | `presentation-research/diagrams/artemis-quiz-generation-activity.json` ✓ |

Main-story total: 5 formal diagrams, 4 distinct types — at the corpus maximum (median 3 diagrams, 2–3 types) but each passes the test; do not add more to the main story.

## Appendix

| Stage | Apollon type | Purpose | Verdict | JSON source |
| --- | --- | --- | --- | --- |
| Domain / awareness data | **Class** (analysis object model) | Diagram data vs session awareness stay separate entities | **Pass (appendix)** — corpus split 4 main / 1 appendix among 5 users; Ostertag parks his AOM in the appendix too. Optional: reduced excerpt in O2 section | `figures/requirements-analysis-object-model.json` ✓ |
| Standalone architecture | **Component** | Standalone hosts editor, collaboration, persistence | Pass (appendix) | `figures/apollon-standalone-decomposition.json` ✓ |
| Deployment & persistence | **Deployment** | Each host owns the data it persists (localStorage/IndexedDB/Redis/Artemis/VS Code files) | Pass (appendix) — corpus reward weak (2/17), appendix is the right home | `figures/apollon-deployment-and-persistence-architecture.json` ✓ |
| Editing flow (O1) | **Activity** | Correction stays inside the modeling flow | Pass (appendix) — main-story O1 evidence is better carried by screenshots; corpus parks activity models in the appendix in 4/9 cases | `figures/requirements-editing-activity-model.json` ✓ |
| UI navigation (spare) | Use Case/Activity | Standalone navigation model | **Hold** — only if a committee question is anticipated; otherwise omit from the deck entirely | `figures/requirements-ui-navigation-model.json` ✓ |

## Explicitly rejected (anti-forcing failures)

- **Petri net / BPMN / SFC / Reachability / Syntax tree / Object diagram anywhere** — no audience information need; would exist only to raise the Apollon-type count. Fail (a), (d).
- **Chart of usability gains** — evaluation is qualitative/formative; hard constraint forbids quantified claims. Fail (a) and truthfulness.
- **Flowchart of the export pipeline** — the demo shows export live; duplicate. Fail (d).
- **Sequence diagram of collaboration** — corpus never uses one (0/17) and Apollon has no sequence type; the communication diagram covers it. Not applicable.
- **State machine** (corpus: Jakubczyk only) — no lifecycle story in this thesis needs one; also not Apollon-native. Fail (a); would require a non-Apollon tool.
- **Gantt/timeline as diagram** — appendix timeline stays a styled list (v3 s27), matching corpus practice; forcing it into Apollon would distort it.

## Non-native needs and honest choices

- Swimlane activity models (corpus favorite): redesign lane-free in Apollon rather than faking lanes; if lanes are essential to a future slide, accept a non-Apollon visual and say so.
- All planned diagrams have saved Apollon JSON sources and are exportable as SVG/PPTX (editable, on-brand). None require external tooling. Flagged: none.
