# Thesis fact inventory for the presentation

This file is the evidence base for the second presentation round. The final thesis remains the primary source of truth and was not modified. The contribution inventory is used only to distinguish Fady Samaan's documented work from the remaining thesis work.

## Sources reviewed

- `metadata.typ`
- `content/abstract_en.typ`
- `content/introduction.typ`
- `content/background.typ`
- `content/related_work.typ`
- `content/requirements.typ`
- `content/system_design.typ`
- `content/implementation.typ`
- `content/evaluation.typ`
- `content/summary.typ`
- `Fady-contribution-history/fady-contribution-inventory.md`
- All diagram PNG and JSON files in `figures/`

## Presentation metadata

| Item | Fact |
| --- | --- |
| English title | Enhance Usability of the Educational Modeling Software Apollon |
| Degree | Master |
| Program | Information Systems/Informatik |
| Authors | Fady Samaan and Ravi Tamang |
| Supervisor | Felix Dietrich, M.Sc. |
| Examiner | Prof. Dr. Stephan Krusche |
| Presentation date in thesis metadata | 8 July 2026 |
| Submission date | 13 July 2026 |

## Thesis in one sentence

The thesis improves Apollon as one maintained modeling ecosystem across the reusable library, standalone web application, mobile/iOS application, Artemis, Athena, the VS Code extension, and export services.

The presentation must therefore not describe the work vaguely as an improvement for generic "educational systems." Artemis is the concrete learning platform and should be named whenever its modeling, quiz, assessment, team-modeling, or Athena feedback workflows are discussed.

## Ecosystem facts

| Environment | Role in the thesis | Responsibilities that remain outside the Apollon library |
| --- | --- | --- |
| Apollon library | Reusable editor, diagram model behavior, rendering, runtime callbacks, React embedding API, and collaboration-awareness presentation | It does not own persistence, authentication, authorization, course data, collaboration transport, or deployment policy. |
| Standalone web application | Browser-based diagram creation and management, local/shared routing, sharing, version history, and export entry points | It owns application navigation, local/shared diagram workflows, and calls to standalone services. |
| Mobile/iOS application | Runs the standalone workflow in a Capacitor shell and connects exports to native file handling | It owns platform file handling and app-local service access. |
| Artemis | Embeds Apollon in modeling exercises, drag-and-drop quiz creation, assessment views, and team modeling | Artemis owns courses, users, permissions, exercises, submissions, quiz data, assessment records, persistence, and team-session infrastructure. |
| Athena | Consumes serialized Apollon models for semi-automated feedback generation | Athena selects parsers for supported model versions; it does not embed the editor. |
| VS Code extension | Hosts the maintained editor and renderer for workspace files | It owns the extension-host and workspace-file integration. |
| Conversion service | Generates server-side derived artifacts, especially PDF | It receives a diagram model, renders without an interactive browser, and returns an artifact without changing the source model. |

Apollon supports thirteen UML and modeling diagram types. The documented export formats are SVG, PNG, PDF, PPTX, and JSON.

## Problem statement

The problem has three connected layers:

1. Editing friction diverted attention from modeling decisions. Examples include difficult edge correction, manual layout work, limited navigation, and repeated actions.
2. Collaborative sessions synchronized diagram data but provided insufficient awareness of who was present, where collaborators were working, and what they selected or dragged.
3. The ecosystem was fragmented. Standalone Apollon, mobile/iOS, Artemis, Athena, and VS Code depended on different editor behavior or model versions, while legacy integrations still had to preserve existing exercises and stored diagrams.

The central thesis argument is that usability and integration cannot be treated separately because a change to the shared editor can affect individual modeling, team modeling, quizzes, assessment, Athena feedback, mobile workflows, IDE editing, and export artifacts.

## Objectives from the thesis

The thesis states four verb-led objectives:

1. **Improve modeling and application usability.** Simplify diagram editing, navigation, mobile use, and export workflows.
2. **Support collaborative modeling.** Make collaborator activity visible in shared sessions and provide reusable awareness for standalone shared modeling and Artemis team modeling.
3. **Enhance Apollon for educational systems.** Improve the maintained editor while preserving modeling exercises, quiz workflows, assessment, feedback generation, and existing diagram formats.
4. **Improve diagram portability.** Produce dependable visual representations and export artifacts across environments.

For the presentation, objective 3 should be made concrete without changing its meaning. The planned wording is:

> Preserve Artemis, Athena, and VS Code workflows while adopting maintained Apollon.

This explicitly names the systems involved and avoids the vague phrase "educational systems." The status slide must reuse the same presentation wording and ordering.

## Functional requirements

### Diagram editing

- Adjust stepped edge paths with bend handles.
- Drag manually placed waypoints.
- Reconnect an existing edge instead of deleting and recreating it.
- Adapt connection controls to element size, geometry, and zoom.
- Show line jumps where orthogonal edges cross.
- Keep horizontal and vertical edge labels readable.

### Editor and library interaction

- Show alignment guides, including for nested elements.
- Delete selected elements with the keyboard.
- Reorder class attributes and methods.
- Provide scroll lock for hosts that need to prevent unintended canvas movement.
- Provide reusable React components and hooks for embedding Apollon.

### Collaboration

- Show collaborator cursors with participant identity.
- Highlight elements selected or dragged by another participant.
- Follow another participant's viewport.
- Reuse awareness presentation in standalone Apollon and Artemis team modeling.
- Keep cursor, identity, selection, drag, and viewport awareness transient rather than persisting it in the diagram model.

### Standalone web application

- Start from a diagram overview rather than a blank editor.
- List local and shared diagrams.
- Use stable routes for local and shared diagrams.
- Preserve old shared links through redirects.
- Search, filter, sort, favorite, duplicate, delete, and share diagrams.
- Offer grid and table views, infinite scrolling, thumbnails, and clear shared-link error handling.

The thesis screenshot of the standalone home page is outdated. It must not be used in the presentation. The current interface should be shown only in the live demo or a new current screenshot if one is captured later.

### Mobile/iOS

- Export PNG, PDF, JSON, and SVG through platform file handling.
- Export animatable PPTX presentations.
- Use Capacitor and app-local services where desktop-browser assumptions do not hold.

### Artemis

- Replace legacy Apollon with the maintained integration.
- Preserve modeling exercise behavior.
- Preserve team modeling and expose collaboration awareness there.
- Restore drag-and-drop quiz creation from selected diagram elements.
- Support nested selections such as class attributes and methods.
- Generate aligned quiz backgrounds, draggable cut-outs, and drop locations.
- Preserve assessment interaction and structured-grading compatibility.

### Athena

- Process the earlier and current supported Apollon model formats during the migration period.
- Validate current models in the Athena playground.

### VS Code extension

- Move the extension into the Apollon monorepo and release process.
- Render workspace diagrams with the maintained Apollon library.

### Export and rendering

- Generate PDF on the server without launching an interactive browser.
- Use JSDOM and React Flow server-side rendering instead of the earlier Playwright-based conversion path.
- Provide web-oriented and compatibility-oriented SVG output.
- Resolve CSS-variable and fallback-color assumptions for external SVG consumers.
- Improve text bounds and clipping.
- Fix notation-specific output for class, component, deployment, SFC, and Petri-net diagrams.
- Support visual export checks and snapshot-based regression detection.

## Architecture facts

The architectural boundary is the most important design claim:

- Shared editor behavior belongs in the Apollon library.
- Standalone, mobile, Artemis, and VS Code configure and host that behavior.
- Artemis and standalone Apollon own their own persistence and session infrastructure.
- Athena consumes serialized models but does not embed the editor.
- Collaboration awareness is a separate transient event stream.
- Derived exports are artifacts; the diagram model remains the editable source of truth.

Persistence paths differ by host:

- Standalone local diagrams: browser `localStorage`.
- Standalone local version history: IndexedDB.
- Standalone shared diagrams and versions: Redis Stack through the standalone server.
- Collaboration presence: in-memory/session state through the WebSocket relay.
- Artemis diagrams: Artemis-side persistence with exercises and submissions.
- Mobile local diagrams: WebView `localStorage` and IndexedDB.
- VS Code diagrams: `.apollon` workspace files.

## Implemented results by objective

### Objective 1 - modeling and application usability

- Step-edge bending, waypoint dragging, endpoint reconnection, and preservation of manual waypoints where possible.
- Zoom-adaptive and geometry-aware connection handles.
- Line jumps for readable crossings.
- Straight-line correction, larger selectable areas, compact routing, and manual edge-label placement.
- Alignment guides, keyboard deletion, class member reordering, scroll lock, and editor UI cleanup.
- React embedding API for host applications.
- Standalone home page, routing, local/shared management, filtering, sorting, favorites, sharing, thumbnails, grid/table views, and error states.
- Mobile/iOS export and native file handling, including animatable PPTX.

### Objective 2 - collaborative modeling

- Remote selection and drag highlighting.
- Live cursors with participant names and colors.
- Viewport following.
- Reusable awareness presentation moved into the library.
- Reuse in standalone shared modeling and Artemis team modeling.
- Explicit separation between transient awareness and persisted diagram content.

### Objective 3 - Artemis, Athena, and VS Code compatibility

- Artemis adopted the maintained Apollon integration for the Artemis 9.0 release window.
- Modeling exercises, quiz workflows, assessment views, and team modeling were preserved.
- Drag-and-drop quiz generation was repaired and extended to nested class members.
- Quiz cut-outs, backgrounds, and drop locations share the same coordinates.
- Assessment interaction and structured-grading usage limits were repaired where serialization changes affected them.
- Athena was updated for earlier and current supported Apollon models.
- The VS Code extension moved into the monorepo and adopted the maintained renderer.

### Objective 4 - portability

- Server-side PDF conversion through JSDOM and React Flow.
- Compatibility-oriented and web-oriented SVG modes.
- Flat SVG export as one implementation step.
- Text-bound, clipping, fallback-color, marker, label, and notation-specific rendering fixes.
- Visual export tests to catch regressions that compile successfully but render incorrectly.

## Development chronology

| Month in 2026 | Main completed work |
| --- | --- |
| February | iOS export, VS Code migration, server-side PDF work begins |
| March | Alignment and editing fixes, SVG compatibility and rendering, server conversion |
| April | Artemis migration, Athena compatibility, first quiz-generation fixes |
| May | Nested quiz selections, assessment compatibility, iOS PPTX, collaboration awareness |
| June | Standalone home page, library-level awareness, Artemis team modeling, edge overhaul, editor UI modernization |

## Evaluation facts

The evaluation is qualitative and formative, not a controlled comparative usability study.

Evidence sources include:

- Thesis proposal and roadmap.
- Existing GitHub issues and previously reported usability problems.
- Developers who use or integrate the Apollon library.
- Students and teaching contexts, including introductory courses and iPraktikum.
- Instructors, tutors, and Artemis developers.
- Realistic think-aloud walkthroughs.
- Integration tests and problems discovered during implementation.

Positive recurring feedback concerned:

- Line jumps and edge readability.
- Collaboration awareness.
- Export behavior.
- Standalone navigation and diagram management.

Remaining friction concerned:

- Precise layout control.
- Keyboard shortcuts and discoverability.
- Selection and click-versus-drag behavior.
- Styling flexibility.
- Sharing semantics and ownership.
- Broader UML notation support.

The presentation must not claim quantified improvements in completion time, error rate, or satisfaction. The thesis explicitly states that these were not measured statistically.

## Future work

The strongest future-work themes are:

1. Systematically evaluate the implemented edge and layout refinements across diagram types, sizes, and user groups.
2. Add stronger persistence and ownership through optional login, persistent shared diagrams, clearer sharing modes, local file-system integration, and Git-friendly workflows.
3. Deepen Artemis and teaching support through review comments, assessment-oriented collaboration, PlantUML interoperability, swim lanes, broader UML notation, and tutorials.
4. Add advanced but discoverable editing features such as multiline text, stereotypes, colors, layers, command palettes, duplication shortcuts, and code generation.
5. Continue export hardening and distinguish editable model exchange from print-oriented output.

## Contribution provenance

The author-provided attribution rule is: the documented items in `Fady-contribution-history/` belong to Fady; thesis contributions not documented there belong to Ravi unless they were shared.

Fady's documented major clusters are:

- Edge interaction and diagram usability.
- Standalone dashboard, routing, and UI modernization.
- Server-side PDF and SVG/export correctness.
- Artemis quiz generation, nested selections, and assessment fixes.
- Contributions to the Artemis Apollon migration.
- Release and ecosystem maintenance.

The presentation tells the joint thesis story and does not visually split every result by author. This provenance should be used for speaker handoffs and questions about individual implementation responsibility.

## Reusable thesis visuals

| Visual | Diagram type or purpose | Presentation use |
| --- | --- | --- |
| `requirements-use-case-model.png` | Use-case model | Scope and actors; main deck or appendix |
| `requirements-analysis-object-model.png` | Analysis object model | Domain boundary; appendix |
| `requirements-editing-activity-model.png` | Activity model | Persisted versus transient flow; appendix |
| `standalone-collaboration-communication.png` | Communication diagram | Collaboration data and awareness; appendix or collaboration section |
| `apollon-standalone-decomposition.png` | Component diagram | Standalone subsystem architecture |
| `apollon-artemis-integration.png` | Component diagram | Artemis, Athena, and conversion integration |
| `apollon-deployment-and-persistence-architecture.png` | Deployment diagram | Execution nodes and persistence; appendix |
| `edge-step-bend-handles.png` | Feature evidence | Edge editing slide |
| `edge-line-jumps.png` | Feature evidence | Edge readability slide |
| `collaboration-selection-highlighting.png` | Feature evidence | Collaboration slide |
| `collaboration-follow-viewport.png` | Feature evidence | Collaboration slide |

All formal diagrams have Apollon JSON source files. The architecture slide can therefore be re-exported as native PowerPoint elements and animated later. In this round, animation is intentionally deferred, and diagrams must be scaled uniformly so they are not stretched.

