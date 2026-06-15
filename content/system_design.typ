= Architecture

#import "/utils/section_link.typ": section-link

#show table.cell: it => {
  set par(justify: false)
  it
}

#show table: it => block(breakable: false, it)

This chapter describes the architecture that connects the iterative requirements process in #section-link(<req-iterative>) to the implementation work in Chapter 6. The architecture is organized around the Apollon ecosystem rather than around individual pull requests. This keeps the design aligned with the thesis goal: improving Apollon as an educational modeling tool that is reused in several applications.

== Architectural Overview <arch-overview>

The modernized Apollon ecosystem is centered around the Apollon library. The library contains the shared editor behavior, diagram rendering, collaboration awareness, edge interaction, quiz-related functionality, and export helpers that must be reused by other applications.

The standalone web application uses the library as its main editor and adds application-level concerns such as routing, a diagram home page, shared diagram access, and server-side export endpoints. The iOS application wraps the standalone experience through Capacitor and adds platform-specific file export behavior.

Artemis embeds Apollon for modeling exercises, team modeling, quiz generation, and assessment. Athena consumes Apollon models for feedback generation and therefore depends on compatible model parsing. The VS Code extension provides an additional editor surface that should use the same renderer and release process as the rest of Apollon.

== Requirement-to-Component Mapping <arch-mapping>

#table(
  columns: (1fr, 1.35fr, 1.15fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement group], [Main components], [Reason for placement]),
  [Usability], [Apollon library, standalone web app, iOS app], [Editing behavior belongs in the library, while navigation and platform export belong to the application shells.],
  [Collaboration], [Apollon library, standalone web app, Artemis], [Awareness behavior must be reusable, but each host application supplies its own session and integration context.],
  [Ecosystem integration], [Artemis, Athena, VS Code extension, Apollon packages], [The new Apollon must replace legacy integrations without breaking teaching, feedback, and IDE workflows.],
  [Export and rendering], [Apollon library, standalone server, iOS app], [Rendering logic is shared, while PDF conversion and platform file access require application-specific support.],
)

== Subsystem Decomposition <arch-subsystems>

=== Apollon Library <arch-library>

The library is responsible for shared modeling behavior. It provides diagram editing, edge handling, alignment guides, collaboration awareness, quiz interaction support, SVG rendering, and embeddable React components. Library-level features are used by the standalone application and by Artemis, so they must avoid dependencies on standalone-only routing or storage.

=== Standalone and Mobile Applications <arch-standalone-mobile>

The standalone web application provides the user-facing editor shell. It manages the diagram overview, routes, shared links, and server-backed export workflows. The iOS application uses the Capacitor shell and adds platform export behavior for files and presentations. These application layers may depend on the library, but library features should not depend on them.

=== Artemis Integration <arch-artemis>

Artemis embeds Apollon in learning workflows. Its integration layer connects the library to modeling exercises, team modeling sessions, quiz generation, and assessment views. This subsystem is where many requirements were validated because it exposes Apollon to real educational workflows.

=== Athena and VS Code Integrations <arch-athena-vscode>

Athena is not an editor surface, but it must understand Apollon model data for feedback generation. Its architecture concern is model compatibility. The VS Code extension is an editor surface outside the web application and therefore depends on renderer consistency and monorepo release integration.

== Iterative Architectural Decisions <arch-decisions>

The architecture changed as implementation exposed missing requirements. Collaboration started in the standalone application, but the Artemis team modeling requirement moved it into the library. Export started with browser-oriented conversion, but server and container constraints required JSDOM and React Flow server-side rendering. The Artemis migration exposed missing quiz and assessment behavior, while the same migration created Athena compatibility requirements.

The resulting architecture separates shared editor behavior from application-specific orchestration. This allows the same Apollon library to serve the standalone editor, mobile shell, Artemis exercises, and external integrations while still allowing each host application to provide its own navigation, storage, session, and deployment behavior.
