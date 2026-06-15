= Requirements

#import "/utils/section_link.typ": section-link

#show table.cell: it => {
  set par(justify: false)
  it
}

#show table: it => block(breakable: false, it)

This chapter describes the requirements for enhancing Apollon, grouped by feature area. The requirements were not fixed once at the beginning. They were collected from the proposal, implemented in one part of the Apollon ecosystem, evaluated through integration work, and then refined when follow-up issues appeared. This iterative process follows the idea that requirements become clearer while the problem domain and solution domain are explored together @bruegge2004object.

The proposal defines four broad goals: lower interaction cost, better collaboration awareness, mobile usage, and easier integration into the surrounding educational tooling. The roadmap from February to June 2026 translated these goals into concrete work packages for the Apollon library, the standalone application, Artemis, Athena, and the VS Code extension.

== Requirements Engineering Approach <req-iterative>

Each requirement area was considered in relation to its users, integration context, and validation process. A first implementation usually clarified the next requirement. For example, replacing legacy Apollon in Artemis created follow-up requirements for Athena model support and quiz generation. Similarly, collaboration features first built for the standalone application became library requirements once Artemis team modeling needed the same behavior.

#table(
  columns: (1fr, 1.7fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Feature area], [Requirement focus], [Implemented in]),
  [Usability], [Editing effort, navigation, and mobile export.], [#section-link(<impl-usability>)],
  [Collaboration], [Workspace awareness and Artemis team modeling.], [#section-link(<impl-collaboration>)],
  [Ecosystem integration], [Artemis, Athena, and VS Code compatibility.], [#section-link(<impl-ecosystem>)],
  [Export and rendering], [PDF, SVG, and server-side conversion.], [#section-link(<impl-export-rendering>)],
)

== Usability <req-usability>

Usability is the central requirement group of the thesis. It covers editor interaction, diagram navigation, mobile export, and the standalone entry point. The common goal is to reduce the effort required to create, adjust, find, and export diagrams.

=== Edge Usability <req-edge-usability>

Edge editing was a major source of interaction cost. Users needed better ways to connect, bend, reconnect, and read edges in larger diagrams.

#table(
  columns: (1.1fr, 1.9fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Sub-requirements], [Implemented in]),
  [Lower edge editing effort], [Provide improved edge interaction through better edge usability, waypoint dragging, step-edge bending, React Flow reconnection, and dynamic edge handles based on element size.], [#section-link(<impl-edge-usability>)],
  [Improve edge readability], [Add line jumps for edge collisions and keep labels readable on vertical and horizontal edges, including communication diagrams.], [#section-link(<impl-edge-usability>)],
)

=== General App Usability <req-app-usability>

General app usability covers editing actions that are not limited to one diagram type. These requirements affect the library first, because standalone Apollon and embedded integrations both rely on it.

#table(
  columns: (1.1fr, 1.9fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Sub-requirements], [Implemented in]),
  [Reduce manual layout work], [Show alignment guides while users move elements and refine the behavior for nested elements after follow-up bugs.], [#section-link(<impl-app-usability>)],
  [Make editing predictable], [Support keyboard deletion, class attribute and method reordering, scroll lock mode, and clearer sidebar and export actions.], [#section-link(<impl-app-usability>)],
  [Improve library embedability], [Expose Apollon as a React library so host applications can reuse the editor without standalone-only assumptions.], [#section-link(<impl-library-usability>)],
)

=== iOS App and Mobile Export <req-ios-mobile>

The proposal identified mobile usage as an important direction. The implemented scope focused on reliable iOS export and Capacitor app support.

#table(
  columns: (1.1fr, 1.9fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Sub-requirements], [Implemented in]),
  [Support iOS file export], [Export diagrams from the iOS application as PNG, PDF, JSON, and SVG files.], [#section-link(<impl-ios-export>)],
  [Support iOS presentation export], [Provide animatable PPTX export for the iOS application.], [#section-link(<impl-ios-export>)],
  [Support app-local services], [Allow the Capacitor application to use local server functionality where export and collaboration workflows require it.], [#section-link(<impl-mobile-platform>)],
)

=== Standalone Web Application <req-standalone>

The standalone application needed a clearer starting point once it became more than a simple editor shell.

#table(
  columns: (1.1fr, 1.9fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Sub-requirements], [Implemented in]),
  [Provide a diagram overview], [Show local and shared diagrams on a home page so users can continue existing work without starting from an empty editor.], [#section-link(<impl-standalone-home>)],
  [Support diagram navigation], [Use stable routes and links for opening and sharing diagrams.], [#section-link(<impl-standalone-home>)],
)

== Collaboration <req-collaboration>

Collaboration requirements focus on workspace awareness. Shared diagram state alone is not enough; users also need to understand who is present, where collaborators are working, and whether they should follow another viewport.

=== Workspace Awareness <req-workspace-awareness>

#table(
  columns: (1.1fr, 1.9fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Sub-requirements], [Implemented in]),
  [Show collaborator activity], [Display live cursors, presence indicators, and collaborator selections during synchronous modeling.], [#section-link(<impl-collaboration-awareness>)],
  [Support viewport following], [Allow a user to follow another collaborator's viewport when synchronous work benefits from a shared view.], [#section-link(<impl-collaboration-awareness>)],
  [Keep awareness transient], [Cursor, presence, and viewport-following state must not become part of the persisted diagram model.], [#section-link(<impl-collaboration-library>)],
)

=== Reusable Collaboration for Artemis <req-team-modeling>

#table(
  columns: (1.1fr, 1.9fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Sub-requirements], [Implemented in]),
  [Move awareness into the library], [Make collaboration features reusable by host applications instead of keeping them only in the standalone application.], [#section-link(<impl-collaboration-library>)],
  [Integrate team modeling], [Use the shared collaboration layer in Artemis team modeling exercises.], [#section-link(<impl-team-modeling>)],
)

== Ecosystem Integration <req-ecosystem>

Apollon is used as a library, standalone application, mobile app, Artemis component, Athena input format, and VS Code extension. Ecosystem requirements therefore focus on compatibility between these contexts.

=== Artemis Integration <req-artemis>

#table(
  columns: (1.1fr, 1.9fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Sub-requirements], [Implemented in]),
  [Replace legacy Apollon], [Replace legacy Apollon with the new Apollon in Artemis while preserving modeling exercise behavior.], [#section-link(<impl-artemis-migration>)],
  [Support quiz creation], [Provide quiz mode, interactive export, element selection, automatic diagram cut-out, and nested selections for drag-and-drop quizzes.], [#section-link(<impl-quiz-assessment>)],
  [Support assessment workflows], [Keep assessment interactions usable, including selection highlighting, popover behavior, and scoring follow-up fixes.], [#section-link(<impl-quiz-assessment>)],
)

=== Athena Integration <req-athena>

#table(
  columns: (1.1fr, 1.9fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Sub-requirements], [Implemented in]),
  [Support new Apollon models], [Parse and process Apollon v4 models for feedback generation.], [#section-link(<impl-athena>)],
  [Keep model compatibility], [Athena must support all Apollon model versions during and after the migration.], [#section-link(<impl-athena>)],
  [Update validation tooling], [Update the Athena playground to use the latest Apollon version.], [#section-link(<impl-athena>)],
)

=== VS Code Extension <req-vscode>

#table(
  columns: (1.1fr, 1.9fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Sub-requirements], [Implemented in]),
  [Move extension into the monorepo], [Integrate the VS Code extension into the Apollon monorepo and release workflow.], [#section-link(<impl-vscode>)],
  [Use the current renderer], [Update the extension to use the modern Apollon renderer so IDE usage remains consistent with the web editor.], [#section-link(<impl-vscode>)],
)

=== Export and Rendering <req-export-rendering>

Export and rendering requirements bridge the library, the standalone server, and the mobile application. The goal is to produce reliable diagram artifacts without depending on one specific browser environment.

==== Server-Side Export <req-export-conversion>

#table(
  columns: (1.1fr, 1.9fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Sub-requirements], [Implemented in]),
  [Provide PDF export service], [Implement server functionality that receives a diagram and returns a PDF export.], [#section-link(<impl-server-pdf>)],
  [Remove browser-runtime dependency], [Replace the Playwright conversion approach with JSDOM and React Flow server-side rendering.], [#section-link(<impl-jsdom-ssr>)],
)

==== SVG Rendering <req-svg-rendering>

#table(
  columns: (1.1fr, 1.9fr, 0.8fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement], [Sub-requirements], [Implemented in]),
  [Improve SVG correctness], [Support SVG compatibility modes, flat export, text bounds, clipping fixes, and visual export tests.], [#section-link(<impl-svg-rendering>)],
  [Preserve diagram notation], [Render class, component, SFC, and Petri net diagrams correctly in exported SVG artifacts.], [#section-link(<impl-svg-rendering>)],
)
