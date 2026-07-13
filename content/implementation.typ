= Implementation <impl-chapter>

#import "/utils/section_link.typ": section-link

This chapter describes how the requirements from @req-chapter were implemented. The structure is more detailed than the requirements chapter because each requirement group produced several concrete implementation tasks across the Apollon ecosystem.

== Iterative Development Approach <impl-iterative>

The implementation followed the iterative requirements process described in #section-link(<req-iterative>)#h(0.25em)and the architectural decisions in #section-link(<arch-decisions>). Each development cycle started with a requirement from the proposal or roadmap, continued with a first implementation, and was then tested in the relevant integration context. Problems found during integration became follow-up requirements and were addressed in another cycle.

This process is visible when integration findings became follow-up compatibility and quiz requirements, and when collaboration awareness moved from the standalone application into the library for reuse in team modeling. The export service likewise evolved from browser-based conversion to JSDOM and React Flow server-side rendering.

== Improving Modeling and Application Usability <impl-usability>

The usability work implements #section-link(<req-usability>)#h(0.25em)and follows the component split described in #section-link(<arch-subsystems>). Editing interactions were implemented in the Apollon library, while application navigation and mobile file handling were implemented in the standalone and iOS application layers.

=== Edge Usability <impl-edge-usability>

Related requirement: #section-link(<req-edge-usability>).

Edges are central to the diagrams supported by Apollon because they encode relationships between model elements. Poor edge interaction can therefore interrupt the modeling process more strongly than many other editor problems. Earlier feedback and issue discussions showed that users often had to spend effort on correcting edge paths, recreating connections, or adjusting layout after moving diagram elements. The implementation addressed this problem at the library level so that the improved behavior could be reused by the standalone application and embedded host applications.

The edge usability work reworked the interaction model for step edges. Users can bend step edges by manipulating dedicated bend handles instead of recreating the edge. The bend interaction uses a smaller snapping grid, which makes edge correction more precise while still keeping paths aligned to predictable positions. This snapping behavior supports the requirement that edge paths can be adjusted without turning every correction into free-form manual drawing.

#figure(
  image("/figures/edge-step-bend-handles.png", width: 100%),
  caption: [Step-edge editing with draggable bend handles.],
)

Waypoint dragging extends this behavior to manually placed intermediate points. During a drag operation, the editor keeps live drag state and synchronizes manually adjusted waypoints back into the edge input. This allows users to correct the visual route of an existing connection while preserving the semantic source and target of the edge. The implementation therefore separates the modeled relationship from its visual path correction: the edge still connects the same elements, but users gain more control over the route between them.

Endpoint reconnection was integrated with React Flow's native reconnect API. This allows users to move an existing edge endpoint to another compatible target without deleting and recreating the edge. Reconnection is important for iterative modeling because users often refine the structure of a diagram after creating an initial version. The implementation preserves manually adjusted waypoints where possible after reconnection, which reduces the amount of repeated correction work after changing an endpoint.

The connection-handle model was redesigned to make edge creation and reconnection more predictable across different element sizes and zoom levels. The implementation introduced a multi-slot handle model with visible handles and hidden compatibility anchors. This model gives the editor more precise connection positions while preserving compatibility with existing diagrams and edge data. Handles and endpoint hit targets were made zoom-adaptive so that users can still interact with them at different canvas zoom levels.

Line jumps were added to improve readability when several orthogonal edges cross in a dense diagram. At an intersection, the horizontal edge segment renders a small bridge over the vertical segment. This makes the route of each edge easier to follow in complex layouts without changing the underlying diagram model or requiring users to manually separate every crossing.

#figure(
  image("/figures/edge-line-jumps.png", width: 100%),
  caption: [Line jumps clarify edge crossings in a dense class diagram.],
)

The implementation also removed stale runtime geometry from the persisted diagram model. Earlier geometry values that belonged only to rendering or interaction could become outdated when diagrams were imported or migrated. The edge migration logic strips such runtime-only data and recalculates the required geometry during rendering and interaction. This reduces compatibility problems when diagrams move between versions or host applications.

Several smaller improvements completed the edge usability work. The edge toolbar follows live drag interaction instead of remaining fixed to outdated geometry. Edge decorations in SFC diagrams follow the edge while it is dragged, and decorative SVG parts are pointer-transparent so they do not block interaction with the edge itself. A separate connector fix addressed overlapping required-interface markers in component and deployment diagrams. Together, these changes improve edge interaction, readability, and compatibility across supported diagram types.

The edge implementation was supported by unit and end-to-end tests for bending behavior, handle hit-testing, zoom behavior, endpoint markers, migration cleanup, edge decorations, and reconnection behavior. These tests are important because edge interaction combines persisted diagram data, runtime geometry, pointer interaction, and rendering behavior. Small regressions in one of these areas can make existing diagrams harder to edit or read.

Later feedback led to additional edge refinements. Straight-line correction was simplified, selectable areas were enlarged, anchor behavior and connection controls were adapted to element geometry, and routing for nearby elements was made more compact to avoid unnecessary detours and U-shaped artifacts. Manual placement for edge labels, including decision labels in activity diagrams, was also added after the walkthrough feedback. These follow-up changes addressed the concrete issues reported during the feedback process rather than leaving them solely as future work.

=== Alignment and Editing Controls <impl-app-usability>

Related requirement: #section-link(<req-app-usability>).

Alignment guides were added to reduce manual positioning effort. A later follow-up refined this behavior for nested elements after a bug revealed that simple alignment logic was not sufficient for more complex diagrams.

The editor also gained class attribute and method reordering, keyboard deletion behavior, scroll lock mode, and sidebar and export UI cleanup. These changes reduce small sources of friction that accumulate during repeated modeling tasks.

=== Library Embedding <impl-library-usability>

Related requirement: #section-link(<req-app-usability>).

The library now exports a reusable React component and hooks for embedding and accessing the editor. React host applications can therefore integrate Apollon through the library's supported API instead of maintaining application-specific wrappers. This keeps the standalone application and Artemis closer to the same editor lifecycle and behavior.

=== iOS Export and Platform Support <impl-ios-export>

Related requirement: #section-link(<req-ios-mobile>).

The iOS application gained file export support for PNG, PDF, JSON, and SVG. Later work added animatable PPTX export for the iOS application. The Capacitor application was also extended with local server support for workflows that require app-local services. Together, these changes implement mobile export and file handling within the constraints of the Capacitor-based application and reduce dependence on desktop-browser assumptions.

=== Standalone Home Page and Routing <impl-standalone-home>

Related requirement: #section-link(<req-standalone>).

The standalone Apollon application previously opened directly into an editor view. This made the application useful for creating a new diagram, but it provided only limited support for returning to existing work, distinguishing local and shared diagrams, or opening diagrams through stable URLs. Users who expected a diagram-management workflow first had to enter the editor and then rely on application-specific actions to find or create the diagram they wanted.

The implementation changed the standalone application from an editor-first entry point into a home-page-based diagram management workflow. The root route now opens a dedicated home page instead of a blank local editor. This page acts as the main entry point for creating, finding, opening, and managing diagrams. It separates the decision of which diagram to work on from the editing activity itself.

URL-based routing was introduced to make local and shared diagrams addressable. Local diagrams use a dedicated route with the diagram identifier, while shared diagrams use a separate shared route with a view mode parameter. This distinction makes the application state clearer because local work and shared collaboration links no longer use the same implicit entry point. Legacy shared links are redirected to the new shared route while preserving the relevant query parameters, which supports compatibility with previously distributed links.

The home page provides a gallery for local and shared diagrams. It supports different source views so users can focus on local diagrams, shared diagrams, or the combined diagram collection. Shared diagram entries are stored locally and merged with fetched shared diagram information when available. The implementation also handles unavailable shared diagrams through a dedicated load-error screen with retry and return-home behavior. This prevents failed shared links from leaving users in an unclear editor state.

#figure(
  image("/figures/standalone-home-page.png", width: 100%),
  caption: [Standalone home page with diagram search, filtering, sorting, local and shared diagrams, and diagram management actions.],
)

The diagram gallery includes search, filtering, sorting, and favorites. Users can search for diagrams, filter by diagram type and source, sort entries by properties such as name or time-related metadata, and mark diagrams as favorites. These features make the home page useful when the number of diagrams grows beyond a few examples. They also support the requirement that the standalone application should show existing diagrams before users enter the editor.

The gallery supports grid and table views. The grid view emphasizes visual recognition through diagram cards and thumbnails, while the table view supports denser browsing. Infinite scrolling loads additional entries as the user moves through the gallery, which avoids a separate load-more interaction. The implementation also includes thumbnail generation, warmup, and caching so that diagram previews can be shown without forcing the user to open each diagram.

Diagram cards provide management actions directly on the home page. Users can duplicate, delete, and share diagrams without first opening them in the editor. The share action opens a share dialog that creates shared links and lets the user choose the default view mode for the shared diagram. These actions turn the standalone home page into an operational diagram-management surface rather than a static list.

The standalone home page also introduced home-specific light and dark theming. Dedicated CSS variables define the visual appearance of the home page and support theme switching. This work improved consistency between the home page and the editor while keeping the home page independent enough to provide its own layout and navigation structure.

The implementation was supported by end-to-end tests covering loading, browsing, source views, navigation, and diagram-management actions. Separate checks cover shared storage, link handling, and unavailable diagrams, reducing the risk that future changes break the standalone entry point.

The resulting home page supports repeated use by helping users return to and manage existing work. Stronger persistence, ownership, and long-term project workflows remain future work discussed in Chapter 7.

=== User Interface Modernization and Consistency <impl-ui-modernization>

Related requirement: #section-link(<req-usability>).

The implementation work also included editor-side user interface modernization. Apollon had accumulated interface code based on several component and styling approaches, which made the editor harder to maintain and complicated consistent behavior across standalone and embedded use. The modernization therefore began by replacing parts of the editor-facing MUI and Emotion usage with lighter reusable primitives and by adapting popovers, selection controls, tooltips, and style-editing components to the newer component approach.

This work focused on the library and editor surface rather than on the entire application design system. The editor migration included cleanup of wrapper components, direct use of shared icon components, related CSS and package adjustments, and test updates for changed selectors and style-editor behavior. These changes reduced dependency on older UI layers and made the editor components easier to align with the broader Apollon interface direction.

== Supporting Collaborative Modeling <impl-collaboration>

The collaboration work implements #section-link(<req-collaboration>). It was developed incrementally because each iteration exposed another kind of awareness that users need during shared modeling. The implementation began with selected-element awareness, continued with live cursors and participant naming, and then added viewport following for synchronous discussion. These features started in the standalone collaboration workflow and were then shaped so that the same awareness concepts could be reused by embedded hosts such as Artemis.

@fig-collaboration-communication summarizes the runtime communication between two editor clients. A local model change is encoded by the state-synchronization component and sent through the room-scoped WebSocket relay. The second client applies the update to its local model and re-renders the editor. Cursor, selection, drag, and viewport information use an independent awareness flow over the same connection. During connection or reconnection, the clients exchange complete states so that missed updates can be merged. On disconnect, the relay removes the participant's transient awareness state and informs the remaining clients. The same flows operate symmetrically when the second participant edits or interacts with the diagram.

#pagebreak()
#set page(flipped: true)
#figure(
  image("/figures/standalone-collaboration-communication.png", width: 100%),
  caption: [UML communication diagram of document synchronization and collaboration awareness.],
) <fig-collaboration-communication>
#pagebreak()
#set page(flipped: false)

=== Collaboration Awareness <impl-collaboration-awareness>

Related requirement: #section-link(<req-collaboration>).

The first collaboration iteration added highlighting for nodes and edges selected or dragged by another participant. In a shared modeling session, synchronized diagram data shows the final diagram state, but it does not explain which element another user is currently inspecting or moving. The implementation therefore propagated the currently selected or dragged element as transient collaboration awareness. Remote clients used this awareness state to highlight the corresponding node or edge on their local canvas.

This behavior was intentionally kept outside the persisted diagram model. A highlighted node or edge communicates another user's current focus, not a diagram property that should be saved, submitted, exported, or processed by host services. When the remote selection changed or disappeared, the highlight was cleared from the local canvas. This made the feature useful during live collaboration while preserving the boundary between diagram data and session data.

#figure(
  image("/figures/collaboration-selection-highlighting.png", width: 100%),
  caption: [First collaboration iteration: a highlighted class and cursor label show another participant's current focus.],
)

The second iteration added live cursors. Cursor positions give collaborators a lighter-weight signal than selection because they show where a person is looking or moving even before an element is selected. The editor converts pointer movement into diagram coordinates before sending it through awareness state, and remote clients convert those coordinates back into screen positions for rendering. This keeps the cursor tied to the diagram canvas even when users zoom or pan.

Participant identity was introduced together with the cursor display. A randomized display name allowed a participant to join quickly, while a name modal allowed the user to replace it with a meaningful name before entering the shared session. The chosen name and collaboration color were then attached to the awareness user state and rendered next to the cursor. This made remote cursors easier to interpret because users could associate motion, selections, and later follow targets with a participant rather than with an anonymous connection.

The third iteration added viewport following. Live cursors and selection highlights show where collaborators are active, but they do not automatically bring another user's area of the diagram into view. This became important for larger diagrams and for teaching or team-modeling situations where one participant wants to guide the attention of the group. The follow feature lets a user choose a collaborator and synchronize the local viewport with that collaborator's viewport while following is active.

Viewport following uses the same separation of concerns as the earlier awareness features. The followed viewport is session state, not diagram content. The host or collaboration service distributes the relevant viewport information, and the editor applies it only while the user has chosen to follow another participant. Users can therefore share focus during a discussion without modifying the diagram model or introducing host-specific persistence behavior into the Apollon library.

#figure(
  image("/figures/collaboration-follow-viewport.png", width: 100%),
  caption: [Third collaboration iteration: viewport following synchronizes the local view with a selected collaborator.],
)

After the standalone implementation proved useful, the awareness presentation moved toward the library boundary for reuse by host applications without persisting session data. Hosts still provide the collaboration transport and session lifecycle, while the editor presents the corresponding transient state consistently.

=== Team Modeling in Artemis <impl-team-modeling>

Related requirement: #section-link(<req-collaboration>).

The Artemis team modeling integration uses the shared collaboration layer from the library. This work connects Apollon awareness features to Artemis team modeling exercises and aligns the shared collaboration layer with the Artemis exercise context.

== Integrating Apollon into Educational Systems <impl-ecosystem>

The ecosystem work implements #section-link(<req-ecosystem>). It focuses on replacing legacy Apollon usage and keeping downstream systems compatible with the new Apollon library and model format.

=== Artemis Migration <impl-artemis-migration>

Related requirement: #section-link(<req-artemis>).

Artemis replaced legacy Apollon with the maintained Apollon integration for the Artemis 9.0 release window. The migration preserved modeling exercise behavior while moving Artemis to the modernized Apollon library.

=== Quiz and Assessment for Artemis <impl-quiz-assessment>

Related requirement: #section-link(<req-artemis>).

Artemis uses modeling exercises and quiz exercises in different workflows. For quiz exercises, Apollon diagrams can be used to generate drag-and-drop questions where selected diagram elements become draggable items and the remaining diagram becomes the background. After the Apollon migration, this workflow required additional integration work because the quiz generator had to interpret the updated Apollon model format, preserve selected elements, generate correct background images, and align drop locations with the exported diagram.

The implementation separated Apollon-side interactive selection support from Artemis-side quiz generation. Apollon exposes the diagram information and selected interactive elements, while Artemis consumes this data to create quiz backgrounds, drag items, and drop locations. This design avoids hardcoding diagram-type-specific selection behavior in Artemis and keeps the quiz generation workflow aligned with the Apollon editor model.

The first part of the implementation restored reliable drag-and-drop quiz generation from Apollon diagrams. Artemis was adapted to activate the appropriate Apollon quiz mode when diagrams are imported into the quiz workflow. The quiz generator then reads the Apollon diagram data, identifies the quiz-relevant elements, and passes the model to the SVG rendering pipeline. The generated background uses an export mode that removes the selected quiz elements from the diagram while preserving the surrounding structure. The removed elements are then used as draggable quiz items, and their original positions are converted into drop locations.

This work also improved the alignment between SVG rendering and quiz interaction. The quiz background and draggable items must share the same coordinate system; otherwise, a visually correct diagram can still produce misplaced drop zones. The implementation adjusted the generator and renderer so that the exported background, selected elements, and drop areas remain consistent. Tests were added and updated to cover the generated quiz structure and prevent regressions in the Apollon-based drag-and-drop workflow.

The second part of the implementation extended quiz generation to nested Apollon selections. This is relevant for class diagrams because useful quiz elements are not always top-level nodes. Attributes and methods can be selected as individual quiz elements even though they are visually and structurally nested inside a class. The Artemis generator was extended to handle these nested selections, preserve their relation to the parent element, and produce accurate cut-outs and drop locations. SVG and image generation were adapted so that selected nested elements can appear as draggable items while the background contains the corresponding placeholder.

The nested-selection work required coordination between model interpretation and rendering. The generator had to distinguish top-level elements from nested selectable elements, while the renderer had to crop or mask the corresponding visual region accurately. This makes the generated quiz closer to the original diagram and avoids forcing instructors to simplify diagrams only to make them usable in drag-and-drop questions.

A smaller assessment-related contribution addressed compatibility with structured grading instructions. During the Apollon migration, flattened serialization of Apollon drop information affected how usage-count limits for structured grading instructions were evaluated. The scoring logic and related tests were adjusted so that these limits are enforced correctly with the updated Apollon data representation. This contribution was part of the broader migration context but should be understood as a focused assessment compatibility fix rather than ownership of the full Artemis migration.

The implemented quiz and assessment work improved the connection between Apollon diagrams and Artemis teaching workflows. Instructors can generate drag-and-drop quiz questions from selected Apollon elements, including nested class diagram content, while Artemis keeps the exported background and drop areas aligned. The work also strengthened regression coverage for the quiz and assessment paths. Remaining limitations concern the general expressiveness of quiz generation, support for additional diagram-specific element types, and the maintainability of the integration as Apollon evolves further.

=== Athena Model Compatibility <impl-athena>

Related requirement: #section-link(<req-athena>).

To keep downstream feedback workflows intact during the Artemis migration, Athena received a focused model-format compatibility update. Its parser supports the earlier and current serialized Apollon model formats required by those workflows, and its playground uses the maintained version to validate current models. The change was limited to parser and playground compatibility; Athena continues to consume serialized models rather than embedding the editor.

=== VS Code Extension Migration <impl-vscode>

Related requirement: #section-link(<req-vscode>).

The VS Code extension was moved into the Apollon monorepo and updated to the maintained Apollon renderer. This reduced ecosystem fragmentation and kept IDE-based editing aligned with the standalone web application and embedded Artemis integration.

== Extending Export and Rendering <impl-export-rendering>

The export and rendering work implements #section-link(<req-export-rendering>). It spans library rendering, standalone server conversion, and mobile export behavior.

=== Server-Side PDF Export and Rendering <impl-server-pdf>

Related requirement: #section-link(<req-export-rendering>).

PDF export is needed when diagrams are used outside the editor, for example in reports, teaching material, documentation, and learning-platform workflows. Client-side export is useful during interactive editing, but it does not cover all situations in which an application or service should generate a stable artifact from diagram data. The implementation therefore added a server-side PDF export path to the standalone application and made the rendering path independent of a full interactive browser.

The export path connected the standalone server to Apollon's diagram conversion workflow. The server receives diagram data through an export endpoint, converts the model into a renderable representation, and returns a PDF artifact to the caller. Implementing this workflow required server routing, export service logic, endpoint path integration, model conversion handling, and configuration changes so the server-side code could use the relevant Apollon rendering functionality. During integration, the endpoint and request handling were refined, and error handling was improved so conversion failures could be reported without modifying the original diagram data.

The conversion service was changed from a Playwright-based implementation to JSDOM and React Flow server-side rendering. Removing the browser launch made the existing PDF path better suited to server and container environments without changing the diagram model on conversion failure.

=== SVG Export and Diagram Rendering <impl-svg-rendering>

Related requirement: #section-link(<req-export-rendering>).

SVG export is central to Apollon because exported diagrams are reused in documents, presentations, quiz generation, and server-side conversion workflows. Unlike screenshots, SVG files should preserve diagram structure and visual quality outside the editor. This requires more than serializing the canvas. Styles, colors, text bounds, markers, labels, and notation-specific shapes must remain correct when the diagram is opened by external tools or processed by another service.

The implementation introduced export compatibility work for different SVG consumers. Separate export behavior was added for web-oriented and compatibility-oriented SVG output. The compatibility path resolves styling assumptions that are safe inside the browser but unreliable once the SVG is used externally. This included handling CSS variables in exported SVGs and preserving fallback colors for compatible output. These changes make exported diagrams more portable across the standalone application, server-side conversion, presentation workflows, and Artemis quiz generation.

A second part of the work addressed bounds and clipping. Text and labels are especially sensitive in SVG export because the browser can render them correctly while the exported artifact still clips or omits parts of the text. The implementation improved text-bound calculation so exported diagrams include the necessary visual area. This reduced clipping problems for diagram elements and labels and made exported SVGs more dependable as inputs for PDF generation and external rendering.

The rendering work also included diagram-specific fixes. Class diagram rendering was adjusted so attribute and method sections are handled correctly in SVG output. Component and deployment diagram rendering was improved by fixing overlapping required-interface connection markers. SFC and Petri net rendering received label and band alignment fixes so notation-specific visual elements remain readable after export. These fixes were important because export correctness depends on the details of each supported diagram type, not only on the generic export function.

The export changes were supported by visual export checks and snapshot updates. These checks help detect regressions where a change still compiles but produces a visually different or incorrect exported diagram. Visual validation is especially relevant for SVG because many export bugs appear as small layout, clipping, or marker errors rather than as runtime exceptions.

One implementation iteration introduced a flat SVG exporter to reduce dependency on browser-specific rendering behavior. Later export work refined parts of the export architecture further. The thesis therefore treats the flat exporter as an implementation step, not as the only final export mechanism. Overall, the SVG and rendering work improved diagram portability and export correctness while leaving further export hardening and deterministic conversion behavior to later system-level work.

== Implementation Timeline <impl-timeline>

#{
  set text(size: 9.5pt)
  show table.cell: it => {
    set par(justify: false)
    it
  }

  table(
    columns: (auto, 1fr, 1.3fr, auto),
    inset: (x: 4pt, y: 3pt),
    align: (left, left, left, center),
    table.header([Month], [Feature Area], [Key Deliverables], [Status]),
    [February 2026], [iOS app and mobile export], [iOS file export for PNG, PDF, JSON, and SVG], [Done],
    [February 2026], [VS Code extension], [Migration into Apollon monorepo and renderer update], [Done],
    [March 2026], [App usability], [Alignment guides and follow-up editing fixes], [Done],
    [March 2026], [Export and conversion], [Server-side PDF export endpoint and request handling], [Done],
    [March 2026], [SVG export and rendering], [Flat exporter, compatibility modes, CSS variable handling, fallback colors, diagram-specific rendering fixes, and export validation], [Done],
    [April 2026], [Artemis integration], [Replace legacy Apollon with the maintained Apollon integration], [Done],
    [April 2026], [Athena integration], [Current Apollon model-format support, parser compatibility, and playground update], [Done],
    [April 2026], [Artemis quiz integration], [Element selection, SVG background export, and automatic diagram cut-outs], [Done],
    [May 2026], [Artemis quiz follow-ups], [Nested selections, quiz cut-outs, and assessment scoring compatibility], [Done],
    [May 2026], [iOS app and mobile export], [Animatable PPTX export for iOS], [Done],
    [May 2026], [Collaboration], [Selected-element highlights, live cursors, display-name modal, and follow collaborator viewport], [Done],
    [June 2026], [Standalone web application], [Home page, diagram list, routing, filtering, sorting, sharing, and management actions], [Done],
    [June 2026], [Collaboration], [Move awareness features into the Apollon library], [Done],
    [June 2026], [Artemis integration], [Team modeling awareness integration], [Done],
    [June 2026], [Edge usability], [Step-edge bending, waypoint dragging, reconnection, dynamic handles, and edge readability fixes], [Done],
    [June 2026], [Editor user interface], [Editor-side component cleanup, popovers, selection controls, tooltips, and style-editor migration], [Done],
  )
}
