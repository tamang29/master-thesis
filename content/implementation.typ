= Implementation Details

#import "/utils/section_link.typ": section-link

This chapter describes how the requirements from Chapter 4 were implemented. The structure is more detailed than the requirements chapter because each requirement group produced several concrete implementation tasks across the Apollon ecosystem.

== Iterative Development Approach <impl-iterative>

The implementation followed the iterative requirements process described in #section-link(<req-iterative>) and the architectural decisions in #section-link(<arch-decisions>). Each mini project started with a requirement from the proposal or roadmap, continued with a first implementation, and was then validated in the relevant integration context. Problems found during integration became follow-up requirements and were addressed in another implementation cycle.

This process is visible throughout the project. The Artemis migration revealed missing Athena and quiz compatibility requirements. Collaboration awareness moved from the standalone application into the library when Artemis needed it for team modeling. The edge usability refactor was followed by line-jump and label-readability improvements, while the export service evolved from browser-based conversion to JSDOM and React Flow server-side rendering.

== Usability Implementation <impl-usability>

The usability work implements #section-link(<req-usability>) and follows the component split described in #section-link(<arch-mapping>). Editing interactions were implemented in the Apollon library, while application navigation and mobile file handling were implemented in the standalone and iOS application layers.

=== Edge Usability <impl-edge-usability>

Related requirement: #section-link(<req-edge-usability>).

Edge handling was implemented as a library-level usability project. The refactor improved edge usability and UI/UX, added step-edge bending, supported waypoint dragging, and integrated React Flow reconnection behavior. Dynamic edge handles based on the size of an element made connection targets more appropriate for different element shapes.

Follow-up work added line jumps for edge collisions and improved label behavior for vertical communication diagram edges. This reflects the iterative process from #section-link(<req-iterative>): the broader edge refactor improved manipulation first, and later diagram examples exposed readability problems that required additional fixes.

=== Alignment and Editing Controls <impl-app-usability>

Related requirement: #section-link(<req-app-usability>).

Alignment guides were added to reduce manual positioning effort. A later follow-up refined this behavior for nested elements after a bug revealed that simple alignment logic was not sufficient for more complex diagrams.

The editor also gained class attribute and method reordering, keyboard deletion behavior, scroll lock mode, and sidebar and export UI cleanup. These changes reduce small sources of friction that accumulate during repeated modeling tasks.

=== Library Embedability <impl-library-usability>

Related requirement: #section-link(<req-app-usability>).

The library was exposed more explicitly for React applications. This work reduced the amount of custom wrapper code required by consumers and helped keep the standalone application and Artemis closer to the same editor behavior.

=== iOS Export <impl-ios-export>

Related requirement: #section-link(<req-ios-mobile>).

The iOS application gained file export support for PNG, PDF, JSON, and SVG. Later work added animatable PPTX export for the iOS application. These features implement the mobile export requirements within the constraints of the Capacitor-based app.

=== Mobile Platform Support <impl-mobile-platform>

Related requirement: #section-link(<req-ios-mobile>).

The Capacitor application was extended with local server support for workflows that require app-local services. This made mobile export and related standalone workflows less dependent on desktop browser assumptions.

=== Standalone Home Page and Routing <impl-standalone-home>

Related requirement: #section-link(<req-standalone>).

The standalone web application was extended with a home page that lists local and shared diagrams. URL-based routing was added so users can open and share diagrams through stable routes instead of always starting from an empty editor.

== Collaboration Implementation <impl-collaboration>

The collaboration work implements #section-link(<req-collaboration>). It started in the standalone application and was then moved into the Apollon library so that Artemis could reuse the same awareness behavior for team modeling.

=== Collaboration Awareness <impl-collaboration-awareness>

Related requirement: #section-link(<req-workspace-awareness>).

Live cursors and a presence indicator were implemented first for collaborative standalone modeling. These features made it visible who was connected and where collaborators were currently working.

Viewport following extended the same awareness goal. It allows one user to follow another collaborator's viewport when synchronous modeling requires a shared focus.

=== Library Migration <impl-collaboration-library>

Related requirement: #section-link(<req-team-modeling>).

After the standalone implementation proved useful, collaboration awareness was moved into the library. This kept live cursors, presence information, selections, and viewport following out of the persisted diagram model while making them reusable by host applications.

=== Team Modeling in Artemis <impl-team-modeling>

Related requirement: #section-link(<req-team-modeling>).

The Artemis team modeling integration uses the shared collaboration layer from the library. This work connects Apollon awareness features to Artemis exercises and is represented by the open team modeling collaboration pull request.

== Ecosystem Integration Implementation <impl-ecosystem>

The ecosystem work implements #section-link(<req-ecosystem>). It focuses on replacing legacy Apollon usage and keeping downstream systems compatible with the new Apollon library and model format.

=== Artemis Migration <impl-artemis-migration>

Related requirement: #section-link(<req-artemis>).

Artemis replaced legacy Apollon with the new Apollon integration for the Artemis 9.0 release window. The migration preserved modeling exercise behavior while moving Artemis to the modernized Apollon library.

=== Quiz and Assessment for Artemis <impl-quiz-assessment>

Related requirement: #section-link(<req-artemis>).

For Artemis 9.1.1, the implementation restored Apollon drag-and-drop quiz behavior. It added element selection, fixed SVG rendering issues, and supported automatic diagram cut-outs for drag-and-drop exercises.

For Artemis 9.3, follow-up work added nested Apollon selections in quiz generation, updated the element selection highlighting color, fixed assessment popover interaction on double click, and addressed assessment scoring follow-up issues.

=== Athena Model Compatibility <impl-athena>

Related requirement: #section-link(<req-athena>).

Athena was updated to support Apollon v4 models for feedback generation. The parser logic was adapted so Athena must support all Apollon model versions, and the Athena playground was updated to use the latest Apollon version for validation.

This work was a direct result of the Artemis migration. Once Artemis used newer Apollon models, Athena also needed to process them to keep feedback workflows intact.

=== VS Code Extension Migration <impl-vscode>

Related requirement: #section-link(<req-vscode>).

The VS Code extension was moved into the Apollon monorepo and updated to the latest Apollon renderer. This reduced ecosystem fragmentation and kept IDE-based editing aligned with the standalone web application and embedded Artemis integration.

== Export and Rendering Implementation <impl-export-rendering>

The export and rendering work implements #section-link(<req-export-rendering>). It spans library rendering, standalone server conversion, and mobile export behavior.

=== Server-Side PDF Export <impl-server-pdf>

Related requirement: #section-link(<req-export-conversion>).

The standalone server gained functionality to receive diagram data and generate a PDF export. This supports export workflows that cannot be handled reliably as a purely client-side browser operation.

=== JSDOM and React Flow Server-Side Rendering <impl-jsdom-ssr>

Related requirement: #section-link(<req-export-conversion>).

The conversion service was changed from a Playwright-based implementation to JSDOM and React Flow server-side rendering. This made the conversion path better suited for server and container environments that should not depend on a full browser runtime.

=== SVG Export and Diagram Rendering <impl-svg-rendering>

Related requirement: #section-link(<req-svg-rendering>).

SVG export was improved through compatibility modes, a flat SVG exporter, visual export tests, text-bound fixes, clipping fixes, and diagram-specific rendering fixes. The rendering work covered class diagrams, component diagrams, SFC diagrams, and Petri nets as one combined SVG rendering requirement.

== Implementation Timeline <impl-timeline>

#table(
  columns: (auto, 1fr, 1.3fr, auto),
  inset: 5pt,
  align: (left, left, left, center),
  table.header([Month], [Feature Area], [Key Deliverables], [Status]),
  [February 2026], [iOS app and mobile export], [iOS file export for PNG, PDF, JSON, and SVG], [Done],
  [February 2026], [VS Code extension], [Migration into Apollon monorepo and renderer update], [Done],
  [March 2026], [App usability], [Alignment guides and follow-up fixes], [Done],
  [April 2026], [Artemis integration], [Replace legacy Apollon with new Apollon], [Done],
  [April 2026], [Athena integration], [Apollon v4 support, parser compatibility, and playground update], [Done],
  [April 2026], [Artemis quiz integration], [Element selection, SVG rendering, and automatic cut-out], [Done],
  [April 2026], [Export and conversion], [Server-side PDF export and conversion service refinement], [Done],
  [May 2026], [Artemis quiz follow-ups], [Nested selections, highlight color, assessment popover fixes, and scoring follow-ups], [Done],
  [May 2026], [iOS app and mobile export], [Animatable PPTX export for iOS], [Done],
  [May 2026], [Collaboration], [Live cursors and presence indicator in standalone], [Done],
  [May 2026], [Standalone web application], [Home page with local and shared diagram list], [In progress],
  [June 2026], [Collaboration], [Move awareness features into the library], [In progress],
  [June 2026], [Artemis integration], [Team modeling awareness integration], [In progress],
  [June 2026], [Edge usability], [Edge usability refactor, waypoint dragging, reconnection, and line jumps], [In progress],
)
