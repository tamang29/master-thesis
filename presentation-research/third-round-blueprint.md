# Third-round presentation blueprint

## Narrative decision

The presentation tells one concrete story: improving the shared Apollon foundation made collaboration understandable and allowed Artemis to adopt maintained Apollon without losing its modeling, quiz, assessment, or team-modeling workflows. VS Code and Athena are supporting integrations, in that order. Mobile demonstrates that the same diagram remains usable outside a desktop browser.

The standalone server's conversion service is an internal implementation component, not a peer application or integration. It is therefore absent from the ecosystem and Artemis integration diagrams in the main presentation.

## Exact objectives

The objective and status slides must repeat these four verb-led sentences exactly and in the same order:

1. Improve modeling and application usability.
2. Support collaborative modeling.
3. Migrate Artemis to maintained Apollon without breaking teaching workflows.
4. Improve diagram portability across web, mobile, and integrations.

Supporting evidence may name VS Code and Athena, but their names must not replace Artemis in the primary migration objective.

## Main story, 20 slides

| # | Takeaway title | Primary evidence |
| ---: | --- | --- |
| 1 | Enhance Usability of the Educational Modeling Software Apollon | TUM title treatment; logoless |
| 2 | Two applications and three integrations reuse one Apollon library | Apollon-authored component diagram; Artemis, VS Code, Athena ordered by importance |
| 3 | Shared editing worked, but collaborators could not read each other's intent | Three concrete problem layers |
| 4 | Four objectives guided the thesis | Exact verb-led objective wording |
| 5 | The thesis changes the editor and the workflows around it | Apollon use-case model |
| 6 | Editing interactions became direct and predictable | Bend, reconnect, line-jump evidence |
| 7 | Collaboration now exposes intent, not only the final model | Selection, named cursor, viewport-follow evolution |
| 8 | Awareness stays transient while model changes remain persistent | Apollon collaboration communication model |
| 9 | Live demo | Current home, collaboration/editing interaction, JSON/PPTX export |
| 10 | Artemis owns teaching workflows; Apollon owns editor behavior | Apollon-authored component diagram |
| 11 | Artemis moved to maintained Apollon without losing its core workflows | Modeling, quiz, assessment, team modeling outcomes |
| 12 | One aligned pipeline turns diagram selections into a quiz | Apollon-authored activity model |
| 13 | Assessment and team modeling needed compatibility fixes, not a second editor | Structured grading and awareness reuse |
| 14 | VS Code and Athena reuse the same model foundation | VS Code first; Athena brief and explicitly tied to AI feedback |
| 15 | The same diagram also works on a landscape tablet | Current landscape iPad view and mobile export formats |
| 16 | Feedback supports the direction, not a measured usability gain | Qualitative evidence and limitations |
| 17 | All four objectives are realized within the thesis scope | Exact objective wording reused |
| 18 | Every model in this deck was built with Apollon | Hosted editor, import JSON, export PPTX, retain JSON source |
| 19 | The next gains are product-level | Evaluation, ownership/persistence, deeper Artemis support |
| 20 | One maintained Apollon now supports the full workflow | Questions |

## Demo decision

The live demo appears on slide 9, approximately 45 percent through the deck. This matches the corpus median better than an end-only demo and gives the audience concrete product context before the Artemis architecture section.

Demo sequence:

1. Open the current Apollon home page in landscape view.
2. Import a realistic saved JSON diagram.
3. Demonstrate one editing or collaboration interaction.
4. Export the diagram as editable PPTX.
5. Return to the deck for the Artemis integration explanation.

## Apollon diagram policy

Every formal model used in the presentation has an Apollon JSON source and is validated in the live Apollon editor. New presentation-specific models live in `presentation-research/diagrams/`; thesis models remain in `figures/`. The final deck may use high-resolution Apollon renders while retaining the JSON source for editing and a PPTX export path for later manual animation.

New models:

- `apollon-products-and-integrations.json`: applications, shared library, and the Artemis/VS Code/Athena integration hierarchy. No conversion-service peer and no connectors.
- `artemis-apollon-integration-focus.json`: Artemis modules and their clean dependency boundary to the maintained Apollon library.
- `artemis-quiz-generation-activity.json`: selection-to-quiz workflow as an activity model.

## Fixed UML stage

Use one full-width stage for all formal diagrams:

- Left: 64 px.
- Top: 140 px.
- Width: 1152 px.
- Height: 510 px.
- Center the diagram uniformly inside this rectangle and preserve its aspect ratio.
- Keep title, section label, and footer at identical coordinates on every diagram slide.
- Do not add prose beside dense diagrams.
- Keep legends inside the stage.
- If a later PowerPoint animation is added, duplicate the same slide and change only emphasis; never move or rescale elements between builds.

## Visual and wording rules

- 16:9 TUM presentation style.
- TUM wordmark only; no Apollon A logo.
- Artemis is always named directly rather than described as a generic educational system.
- Artemis is the dominant integration; VS Code is second; Athena is brief and described as the AI-feedback integration.
- Current standalone home imagery only; no outdated thesis home screenshot.
- One claim per slide, large visuals, and short spoken titles.
- No quantitative usability claim beyond the qualitative formative evidence in the thesis.
- Architecture animation remains a deliberate manual follow-up; this deck preserves stable element coordinates for it.
