# Second-round presentation blueprint

## Communication job

By the end, the advisor, examiner, AET researchers, and thesis students should understand that the thesis improved one maintained Apollon foundation across concrete editor interactions and the workflows of standalone Apollon, mobile/iOS, Artemis, Athena, and VS Code - while preserving compatibility and keeping host responsibilities separate.

## Central takeaway

Apollon is not one editor screen. It is a shared modeling foundation, so an editor improvement becomes valuable only when it works consistently in standalone modeling, collaboration, mobile export, Artemis exercises and assessment, Athena feedback, VS Code, and visual exports.

## Presentation objectives

These four verb-led objectives are derived directly from the thesis but use more concrete system names:

1. **Improve modeling and application usability.**
2. **Support collaborative modeling.**
3. **Preserve Artemis, Athena, and VS Code workflows while adopting maintained Apollon.**
4. **Improve diagram portability across web, server, and iOS.**

The status slide must repeat these four sentences exactly, in the same order and colors.

## Main-deck structure

Target: 20 main slides for a 15-minute presentation including an approximately 3-minute live demo. Most slides are visual and need 30 to 50 seconds. Technical detail is moved to an appendix.

| # | Slide title / takeaway | Main content | Visual | Target time |
| ---: | --- | --- | --- | ---: |
| 1 | Enhance Usability of the Educational Modeling Software Apollon | Title, authors, supervisor, examiner, date | TUM title treatment; no Apollon logo | 0:15 |
| 2 | Apollon is more than an editor | Library, standalone, iOS, Artemis, Athena, VS Code, export services | Simple ecosystem map | 0:35 |
| 3 | Users were fighting the editor - and every host felt it differently | Editing friction, collaboration blind spots, fragmented integrations | Three concrete problem scenes | 0:40 |
| 4 | A shared foundation can remove friction once, everywhere | Shared behavior versus host-owned workflows | Reuse flow | 0:30 |
| 5 | Four objectives guided the thesis | The four presentation objectives | Four verb-led rows | 0:35 |
| 6 | The thesis changes the editor and the workflows around it | Actors and primary user goals | Large simplified use-case model | 0:30 |
| 7 | Edges became directly manipulable | Bend handles, waypoints, reconnection, line jumps, adaptive handles, compact routing, labels | Edge bend and line-jump evidence | 0:40 |
| 8 | Collaboration now shows who is doing what | Named cursors, remote selections/drags, viewport following, transient state | Selection and viewport evidence | 0:40 |
| 9 | Standalone Apollon became a diagram workspace | Home, routing, local/shared, search/filter/sort, favorites, sharing, versions | Screenshot-free workflow strip; current UI shown in demo | 0:30 |
| 10 | iOS can export the same diagram - including editable PPTX | PNG, PDF, JSON, SVG, PPTX, Capacitor file handling and app-local services | Logoless phone/export visual | 0:30 |
| 11 | Live demo | Current standalone home, one editing interaction, collaboration awareness if stable, PPTX export | Dark-blue demo separator | 3:00 |
| 12 | The library owns editor behavior; hosts own workflows and data | Standalone subsystem decomposition and responsibility boundary | Native editable component diagram, translated only | 0:35 |
| 13 | Artemis keeps the teaching workflow around the editor | Modeling exercises, team modeling, quizzes, assessment; Athena and conversion boundary | Large Apollon-Artemis component diagram | 0:35 |
| 14 | Artemis moved to maintained Apollon without dropping core workflows | Modeling, nested quiz selections, cut-outs/drop locations, assessment compatibility, team awareness | Four teaching-workflow outcomes | 0:40 |
| 15 | Athena and VS Code stayed on the same model foundation | Earlier/current Athena parsers; monorepo and maintained renderer for VS Code | Two linked host views | 0:35 |
| 16 | Export now works beyond the browser | JSDOM/React Flow PDF; SVG modes; text bounds, clipping, notation fixes; visual tests | Diagram-to-format flow | 0:40 |
| 17 | Feedback supports the direction - not a measured usability gain | Positive themes, remaining friction, qualitative/formative limitation | Balanced evidence/limitation view | 0:40 |
| 18 | All four objectives are realized within the thesis scope | Exact objective wording with realized status and short evidence | Same objective design with checks | 0:40 |
| 19 | The next gains are product-level | Evaluation, persistence/ownership, deeper Artemis/PlantUML/notation, advanced editing/export | Three future-work directions | 0:35 |
| 20 | One maintained Apollon now serves every workflow | Resolve the opening and invite discussion | Clean closing / questions | 0:15 |

## Live-demo plan

The visible slide should stay simple. The detailed sequence belongs in speaker notes and the backup recording:

1. Open the current standalone home page and select or import a realistic thesis diagram.
2. Demonstrate one high-value editing interaction: bend or reconnect an edge and show a crossing with a line jump.
3. If the collaboration session is stable, show a named cursor, remote selection, or viewport follow.
4. Export the diagram as PPTX and show that the diagram remains editable.

The old thesis home-page screenshot is excluded. A screencast should mirror this exact sequence as backup.

## Architecture treatment

- The standalone component diagram remains editable because it came from Apollon's PPTX export.
- Translate the diagram downward without changing its width or height. This preserves the exact exported aspect ratio and avoids any stretch.
- Do not implement PowerPoint animation in this round.
- Keep a note that the later manual animation should reveal editor reuse, collaboration transport, and persistence in that order.
- The Artemis integration diagram can remain a static high-resolution image in this round.

## Appendix

| Appendix slide | Purpose |
| --- | --- |
| Additional material | Section separator |
| Requirements traceability | Functional requirement groups and objective mapping |
| Analysis object model | Diagram data, selection, collaboration session, export, assessment, and feedback objects |
| Collaboration communication diagram | Separate persisted model updates from transient awareness events |
| Deployment and persistence | Browser, iOS, standalone server, Artemis server, VS Code, and their stores |
| Implementation timeline | February to June 2026 feature sequence |
| Contribution provenance | Fady inventory clusters and joint-thesis handoff reference |
| Full use-case model | Existing, modified, and added use cases with legend |

## Style rules

- 16:9 format.
- TUM blue, white, light blue, green, and orange from the supplied TUM template.
- Arial typography and TUM logo at the top right.
- No Apollon “A” logo; system identity is carried by wording and content.
- One primary claim per slide.
- Large visuals and low text density.
- Dark-blue separators for demo, appendix, and closing.
- Meaningful icons only; no decorative icon grid.
- Full-width diagrams with correct aspect ratio.
- Short, natural titles that can be spoken aloud.
- No unsupported quantitative usability claims.
