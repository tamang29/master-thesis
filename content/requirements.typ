= Requirements <req-chapter>

#import "/utils/section_link.typ": section-link

#show table.cell: it => {
  set par(justify: false)
  it
}

#show table: it => block(breakable: false, it)

This chapter specifies the requirements for enhancing Apollon. It follows the requirements analysis structure proposed by Bruegge and Dutoit @bruegge2004object. The analysis separates the application-domain requirements from implementation decisions and groups related requirements by feature area.

The requirements evolved between February and June 2026. The proposal and roadmap defined initial objectives, implementation work exposed integration gaps, and validation in Apollon, Artemis, and Athena produced follow-up requirements. The chapter records the resulting requirements without reproducing the chronological order of implementation.

== Overview <req-iterative>

The thesis aims to reduce interaction effort in diagram editing, improve awareness during collaborative modeling, support standalone and mobile workflows, and maintain compatibility across the Apollon ecosystem. The scope covers the Apollon library, the standalone web application, the iOS application, Artemis, Athena, and the VS Code extension.

The project used an iterative reengineering process. Each cycle selected a requirement from the proposal or roadmap, implemented and evaluated the requirement in its integration context, and refined the requirement when the evaluation exposed missing behavior. The Artemis migration, for example, created follow-up requirements for quiz generation and Athena model compatibility.

#table(
  columns: (1fr, 1.7fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Feature area], [Requirement focus], [Implemented in]),
  [Diagram and application interaction], [Editing effort, navigation, and mobile workflows.], [#section-link(<impl-usability>)],
  [Collaborative modeling], [Workspace awareness and Artemis team modeling.], [#section-link(<impl-collaboration>)],
  [Educational integrations], [Artemis, Athena, and VS Code compatibility.], [#section-link(<impl-ecosystem>)],
  [Export and rendering], [PDF, SVG, presentation, and server-side conversion.], [#section-link(<impl-export-rendering>)],
)

== Existing System

The existing Apollon ecosystem consisted of a legacy editor, a newer Apollon library and standalone application, separate mobile and VS Code projects, and integrations in Artemis and Athena. These components used different build and release processes. Some capabilities existed only in one application, which made them difficult to reuse in other contexts.

The existing editor supported common modeling workflows, but edge manipulation, alignment, collaboration awareness, mobile export, and diagram navigation required improvement. Artemis depended on legacy Apollon behavior for modeling exercises, quizzes, and assessment. Athena depended on earlier Apollon model formats for feedback generation. These dependencies limited replacement of the legacy integration.

== Proposed System <req-ecosystem>

The proposed system uses the Apollon library as the shared foundation for diagram editing, rendering, collaboration awareness presentation, reusable editor behavior, and editor-side interaction behavior required by host workflows. The standalone web application and iOS application add navigation, persistence, sharing, and platform-specific export workflows without duplicating editor behavior.

Artemis embeds the library in modeling exercises, team modeling, quiz-related editor interactions, and assessment views. In these contexts, Apollon provides the shared editor behavior and model interaction, while Artemis connects this behavior to its exercise lifecycle, submissions, quiz generation, assessment data, access control, and persistence. Athena consumes serialized Apollon models for feedback generation, while the VS Code extension uses the maintained editor and renderer. This arrangement reduces duplicated behavior and establishes one maintained implementation for shared editor capabilities.

== Functional Requirements

Functional requirements describe the behavior that users and integrating systems expect from Apollon. The short requirement names use an action-oriented form, while the descriptions state the observable behavior independently of the implementation technology.

The following subsections group the requirements by feature area. Each table links the requirement to the corresponding implementation section for traceability.

=== Diagram Editing <req-edge-usability>

Diagram editing requirements address frequent modeling actions involving edges and visual layout. They apply to supported diagram types unless a notation imposes a specific restriction.

#table(
  columns: (1.05fr, 1.95fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Description], [Implemented in]),
  [Adjust edge paths], [Users shall bend stepped edges, move waypoints, and reconnect an existing edge without recreating it.], [#section-link(<impl-edge-usability>)],
  [Adapt connection controls], [The editor shall adapt available connection controls to the size and shape of an element.], [#section-link(<impl-edge-usability>)],
  [Show edge crossings], [The editor shall distinguish intersecting edges with line jumps where the notation permits them.], [#section-link(<impl-edge-usability>)],
  [Keep edge labels readable], [The editor shall position labels consistently on horizontal and vertical edges.], [#section-link(<impl-edge-usability>)],
)

=== Editor and Library Interaction <req-app-usability>

These requirements cover recurring editing actions beyond edge manipulation. Shared behavior belongs to the library so standalone and embedded applications can offer consistent interactions.

#table(
  columns: (1.05fr, 1.95fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Description], [Implemented in]),
  [Align diagram elements], [The editor shall show alignment guides while users move elements, including elements inside containers.], [#section-link(<impl-app-usability>)],
  [Support editing controls], [Users shall delete selected elements with the keyboard and reorder class attributes and methods.], [#section-link(<impl-app-usability>)],
  [Control canvas scrolling], [Host applications shall enable a mode that prevents unintended canvas movement.], [#section-link(<impl-app-usability>)],
  [Embed the editor], [React applications shall integrate the editor without depending on standalone application state.], [#section-link(<impl-library-usability>)],
)

=== Collaborative Modeling <req-collaboration>

Collaborative modeling requires awareness of other participants in addition to synchronized diagram data. Awareness information remains session-specific and does not change the persisted diagram model.

#table(
  columns: (1.05fr, 1.95fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Description], [Implemented in]),
  [Show collaborator activity], [Users shall see collaborator cursors with participant identity and highlighted elements selected or dragged by others during a shared session.], [#section-link(<impl-collaboration-awareness>)],
  [Follow a collaborator], [A user shall follow another participant's viewport during synchronous modeling.], [#section-link(<impl-collaboration-awareness>)],
  [Reuse collaboration awareness], [Host applications shall reuse the library's awareness presentation with host-provided session events.], [#section-link(<impl-collaboration-library>)],
  [Support team modeling], [Artemis shall provide collaboration awareness in team modeling exercises.], [#section-link(<impl-team-modeling>)],
)

=== Standalone Web Application <req-standalone>

The standalone web application requires an entry point for managing existing diagrams. Navigation shall distinguish local and shared diagrams while preserving links used to open a diagram.

#table(
  columns: (1.05fr, 1.95fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Description], [Implemented in]),
  [List diagrams], [The application shall show local and shared diagrams on a home page.], [#section-link(<impl-standalone-home>)],
  [Open diagram links], [The application shall use stable routes for opening and sharing diagrams.], [#section-link(<impl-standalone-home>)],
)

=== iOS Application <req-ios-mobile>

The iOS application extends the standalone workflow with Capacitor-based file access. Its export behavior shall not depend on desktop-only browser interactions.

#table(
  columns: (1.05fr, 1.95fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Description], [Implemented in]),
  [Export diagram files], [Users shall export diagrams as PNG, PDF, JSON, and SVG files from the iOS application.], [#section-link(<impl-ios-export>)],
  [Export presentations], [Users shall export diagrams as animatable PPTX presentations from the iOS application.], [#section-link(<impl-ios-export>)],
  [Use application services], [The Capacitor application shall access app-local services required by export workflows and mobile file handling.], [#section-link(<impl-mobile-platform>)],
)

=== Artemis Integration <req-artemis>

Artemis uses Apollon for modeling exercises, quiz-related editor interactions, assessment views, and team modeling. The surrounding educational workflows remain part of Artemis and must preserve the behavior required by existing courses and exercises.

#table(
  columns: (1.05fr, 1.95fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Description], [Implemented in]),
  [Replace legacy Apollon], [Artemis shall use the new Apollon integration for modeling exercises.], [#section-link(<impl-artemis-migration>)],
  [Create drag-and-drop quizzes], [Instructors shall select diagram elements, generate cut-outs, and use nested selections in drag-and-drop quizzes.], [#section-link(<impl-quiz-assessment>)],
  [Assess modeling submissions], [Assessors shall select elements, open assessment controls, and assign scores without interaction regressions.], [#section-link(<impl-quiz-assessment>)],
)

=== Athena Integration <req-athena>

Athena consumes serialized Apollon models when it generates feedback. The integration must accept models produced before and after the Artemis migration.

#table(
  columns: (1.05fr, 1.95fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Description], [Implemented in]),
  [Process current models], [Athena shall process the current Apollon model format for feedback generation.], [#section-link(<impl-athena>)],
  [Process earlier models], [Athena shall support the earlier and current Apollon model formats required during the migration period.], [#section-link(<impl-athena>)],
  [Validate model support], [The Athena playground shall validate feedback generation with models from the current Apollon version.], [#section-link(<impl-athena>)],
)

=== VS Code Extension <req-vscode>

The VS Code extension provides diagram editing outside the web applications. It shall remain consistent with the maintained Apollon renderer and release process.

#table(
  columns: (1.05fr, 1.95fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Description], [Implemented in]),
  [Integrate the extension], [The extension shall be built and released from the Apollon monorepo.], [#section-link(<impl-vscode>)],
  [Use the current renderer], [The extension shall render diagrams with the maintained Apollon library.], [#section-link(<impl-vscode>)],
)

=== Export and Rendering <req-export-rendering>

Export requirements cover server-generated PDF files and SVG files used outside the editor. Exported artifacts shall preserve the relevant diagram content and notation.

#table(
  columns: (1.05fr, 1.95fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Description], [Implemented in]),
  [Generate PDF files], [A server endpoint shall receive a diagram model and return a derived PDF artifact.], [#section-link(<impl-server-pdf>)],
  [Render diagrams on the server], [The conversion service shall render diagrams without an interactive browser session.], [#section-link(<impl-jsdom-ssr>)],
  [Generate compatible SVG files], [Derived SVG artifacts shall support external consumers and preserve text, clipping, nodes, and edges.], [#section-link(<impl-svg-rendering>)],
)

== Quality Attributes

Quality attributes define how well the proposed system shall provide its functional behavior. The attributes use the usability, reliability, performance, and supportability categories described by Bruegge and Dutoit @bruegge2004object.

The thesis prioritizes usability and compatibility because Apollon serves repeated editing workflows and forms part of existing educational systems. Maintainability and portability support continued use across the library, standalone application, mobile application, and integrations.

=== Usability <req-usability>

#table(
  columns: (0.8fr, 1.1fr, 2fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([ID], [Attribute], [Quality requirement]),
  [QA-U1], [Interaction efficiency], [Users should adjust edges and align elements with fewer corrective actions than in the existing editor.],
  [QA-U2], [Predictability], [Editing actions should behave consistently in standalone, embedded, quiz, and assessment contexts.],
  [QA-U3], [Workspace awareness], [Collaboration indicators should communicate participant activity without obscuring diagram content.],
  [QA-U4], [Mobile usability], [Export workflows should remain usable with touch input and platform file dialogs.],
)

=== Reliability and Compatibility

#table(
  columns: (0.8fr, 1.1fr, 2fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([ID], [Attribute], [Quality requirement]),
  [QA-R1], [Export correctness], [Exports should preserve diagram bounds, labels, nodes, edges, and notation-specific rendering.],
  [QA-R2], [Integration compatibility], [Artemis modeling, quiz, assessment, and team modeling workflows should continue to function after migration.],
  [QA-R3], [Feedback continuity], [Athena should continue generating feedback for supported historical and current model formats.],
)

=== Maintainability and Portability

#table(
  columns: (0.8fr, 1.1fr, 2fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([ID], [Attribute], [Quality requirement]),
  [QA-S1], [Reuse], [Shared editing behavior and awareness presentation should reside in the library, while host applications own persistence, access control, and session infrastructure.],
  [QA-S2], [Consistency], [Standalone, Artemis, mobile, and VS Code integrations should use the maintained renderer and model definitions.],
  [QA-S3], [Deployment portability], [Server-side conversion should operate in the deployment environment without a full interactive browser.],
)

== Constraints

The proposed system extends an active ecosystem rather than replacing every component at once. Existing releases, stored diagrams, educational workflows, and distribution channels restrict the available design choices.

The following constraints apply across feature areas and take precedence over local implementation convenience.

#table(
  columns: (0.8fr, 1.1fr, 2fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([ID], [Constraint], [Description]),
  [C1], [Artemis regression], [The migration must not remove required modeling, quiz, assessment, or team modeling behavior.],
  [C2], [Athena compatibility], [Athena must support the earlier and current Apollon model formats required by existing feedback workflows.],
  [C3], [Existing iOS application], [Mobile work must reuse the existing App Store application identity and Capacitor-based application.],
  [C4], [Stored diagrams], [Changes to routing, rendering, and model handling must preserve access to existing diagrams where possible.],
  [C5], [Release coordination], [Integration work must align with the relevant Artemis, Athena, npm, VS Code, and iOS release processes.],
  [C6], [Session data], [Cursor, participant identity, selection, and followed viewport state are transient collaboration state and must not become part of the persisted diagram model.],
)

== System Models

System models describe the application domain independently of the selected implementation technology. The models focus on the actors, activities, and domain objects affected by the requirements.

The relevant actors are students, instructors, assessors, standalone users, and integrating systems. The central concepts are diagrams, diagram elements, collaboration sessions, exports, modeling exercises, quizzes, assessments, and feedback requests.

=== Scenarios

*Editing and export scenario.* Lina is a student who edits a class diagram on a tablet. She aligns elements, reconnects an edge, verifies that crossing edges remain readable, and exports the result as a PDF and presentation. The application returns her to the diagram overview after the export.

*Collaborative modeling scenario.* Jonas is an instructor who starts a team modeling exercise in Artemis. Students see who has joined, observe collaborator cursors and selections, and follow a teammate's viewport while discussing one part of the model. The submitted diagram contains diagram data but no transient awareness state.

*Quiz and feedback scenario.* Mira is an instructor who selects nested diagram elements for a drag-and-drop quiz. Artemis generates the required cut-outs and later displays assessment controls for a modeling submission. Athena processes the associated Apollon model and generates feedback regardless of whether the model uses an earlier or current supported format.

=== Use Case Model

The use case model distinguishes people who create or assess learning activities from people who edit diagrams. Students and standalone users edit, collaborate, navigate, and export diagrams. Instructors create modeling and quiz exercises, while assessors inspect submissions and assign scores. Artemis acts as an external host for editor behavior and model data. Athena consumes serialized Apollon models and provides feedback.

The table summarizes the central use cases without adding implementation-specific components.

#table(
  columns: (1fr, 2.2fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left),
  table.header([Actor], [Primary use cases]),
  [Student or standalone user], [Create and edit a diagram; collaborate; open an existing diagram; export a diagram.],
  [Instructor], [Create modeling exercises; create drag-and-drop quizzes; start team modeling sessions.],
  [Assessor], [Inspect diagram elements; open assessment controls; assign scores.],
  [Artemis], [Embed the editor; manage exercises and sessions; persist submissions.],
  [Athena], [Read supported serialized Apollon models; generate modeling feedback.],
)

=== Analysis Object Model

A diagram consists of diagram elements. Nodes and edges specialize diagram elements, while containers can own nested elements. A selection references one or more elements. A collaboration session associates participants with transient cursor, selection, and viewport state without changing the persisted diagram model.

An export request references a diagram and an output format and produces a derived export artifact. Artemis associates diagrams with modeling exercises, quiz exercises, and assessments. Athena associates a feedback request with a serialized Apollon model. These concepts define the application domain used by the architecture in Chapter 5.

=== Dynamic Model

The central editing activity begins when a user opens or creates a diagram. Editing actions update diagram data, while collaboration actions update transient collaboration state. The user can save, share, submit, or export the diagram. Validation or conversion failures return the user to the current diagram without discarding its state.

The integration activity begins when Artemis loads a modeling, quiz, or assessment context and initializes Apollon with the corresponding mode. Artemis receives changed diagram or selection data and persists exercise-specific results. Athena separately receives a feedback request, selects a compatible parser for the model version, and returns generated feedback.

=== User Interface

The requirements distinguish three interface areas. The editor provides the canvas and editing controls, the standalone home page lists local and shared diagrams, and the iOS application connects editor actions to platform file export. Collaboration indicators remain close to the canvas because they describe the current session.

The proposal mockups define the intended navigation and mobile workflows. Implementation screenshots belong in Chapter 6, where they can document the realized interfaces and explain differences between the initial mockups and the final behavior.
