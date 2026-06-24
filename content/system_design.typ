= Architecture

#import "/utils/section_link.typ": section-link

#show table.cell: it => {
  set par(justify: false)
  it
}

#show table: it => block(breakable: false, it)

This chapter maps the application-domain concepts and requirements from Chapter 4 to the software architecture. It follows the system design structure proposed by Bruegge and Dutoit @bruegge2004object. The design focuses on the parts of the Apollon ecosystem changed by this thesis.

The architecture separates reusable editor behavior from application-specific navigation, persistence, authentication, and deployment. This separation allows the standalone application, mobile application, Artemis, Athena, and the VS Code extension to evolve around one maintained Apollon library.

== Overview <arch-overview>

The Apollon library forms the center of the proposed architecture. It provides diagram editing, rendering, collaboration awareness, quiz-related interactions, and export helpers. Host applications configure these services and connect them to their own user interface, persistence, and session infrastructure.

The standalone web application adds diagram navigation, local and shared diagram access, and server-backed export. The iOS application wraps the standalone application and connects export actions to the platform file system. Artemis embeds the library in educational workflows, Athena processes Apollon models for feedback, and the VS Code extension exposes the renderer in the editor environment.

#table(
  columns: (1fr, 1.4fr, 1.25fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Requirement area], [Primary subsystems], [Architectural placement]),
  [Diagram interaction], [Apollon library], [Shared editing behavior remains independent of one host application.],
  [Collaboration], [Apollon library, host session service], [The library renders awareness state; the host supplies session events.],
  [Standalone and mobile workflows], [Web application, iOS shell, standalone server], [Application layers manage navigation, platform access, and service calls.],
  [Educational integration], [Artemis, Athena, Apollon library], [Integration layers connect shared editor behavior and model data to teaching workflows.],
  [Export and rendering], [Apollon library, standalone server], [Shared rendering supports browser export; the server handles service-based conversion.],
)

== Design Goals <arch-decisions>

The quality attributes and constraints in Chapter 4 determine the design goals. Compatibility has the highest priority because Artemis and Athena already serve active educational workflows. Usability follows because the thesis aims to reduce interaction effort. Reuse and maintainability guide the placement of shared behavior in the library.

Some goals conflict. A shared library reduces duplication but requires stable interfaces for several hosts. Server-side rendering improves deployment portability but must reproduce browser rendering accurately. The architecture resolves these conflicts by keeping shared model and rendering behavior in the library while leaving authentication, persistence, and deployment policy to each host.

#table(
  columns: (auto, 1fr, 2fr),
  inset: (x: 5pt, y: 4pt),
  align: (center, left, left),
  table.header([Priority], [Design goal], [Rationale]),
  [1], [Preserve compatibility], [Avoid regressions in Artemis exercises, Athena feedback, and existing diagrams.],
  [2], [Improve usability], [Reduce corrective editing actions and clarify collaboration and navigation.],
  [3], [Reuse shared behavior], [Provide editing, rendering, and awareness behavior through the library.],
  [4], [Support multiple environments], [Run Apollon in browsers, mobile shells, servers, Artemis, and VS Code.],
  [5], [Limit operational complexity], [Avoid unnecessary services and full browser runtimes in server conversion.],
)

== Subsystem Decomposition <arch-subsystems>

The system is decomposed into subsystems according to ownership of editor behavior, application workflows, and integration responsibilities. The decomposition follows the requirement areas from #section-link(<req-iterative>) and keeps dependencies directed toward the Apollon library.

Each host may use a subset of library services. The standalone application uses the complete editor and export surface, Artemis adds educational modes and persistence, Athena consumes model data without embedding the editor, and the VS Code extension uses the renderer in an IDE context.

=== Apollon Library <arch-library>

The library owns the diagram model, editing commands, edge interaction, alignment guides, collaboration presentation, quiz selection behavior, and SVG rendering. It exposes React components and callbacks that host applications use to supply mode, diagram, and session data.

The library does not own user accounts, course data, shared-link persistence, or deployment configuration. This boundary prevents standalone or Artemis concerns from becoming dependencies of the shared editor.

=== Standalone and Mobile Applications <arch-standalone-mobile>

The standalone application owns the home page, diagram routes, local and shared diagram access, and calls to export services. Its server exposes conversion endpoints used when an export cannot be generated reliably in the client.

The iOS application uses the standalone user interface inside a Capacitor shell. Native bridges connect generated artifacts to platform file dialogs and provide access to application-local service functionality.

=== Artemis Integration <arch-artemis>

The Artemis integration configures Apollon for modeling exercises, team modeling, quiz generation, and assessment. It translates course and exercise state into library properties and receives diagram, selection, and assessment events from the library.

Artemis remains responsible for authentication, authorization, exercise persistence, collaboration session infrastructure, and assessment records. The integration layer prevents these concerns from entering the Apollon library.

=== Athena and VS Code Integrations <arch-athena-vscode>

Athena consumes serialized Apollon models rather than editor components. Its parser selects behavior according to the model version and maps supported versions to the concepts needed for feedback generation.

The VS Code extension embeds the maintained renderer and connects editor files to the Apollon model. Monorepo integration aligns its build and release process with the library while preserving the extension-specific host interface.

== Hardware Software Mapping

The architecture runs across browser clients, mobile devices, application servers, and external educational services. Client-side editing remains available without a dedicated rendering server, while shared diagrams, collaboration, and service-based exports require host infrastructure.

The mapping separates interactive rendering from persistent and compute-oriented services. This reduces latency during editing and allows Artemis and the standalone application to deploy the same library in different environments.

#table(
  columns: (1fr, 1.35fr, 1.55fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Execution node], [Software components], [Communication]),
  [Web browser], [Apollon library, standalone or Artemis user interface], [HTTPS requests and host-provided collaboration events.],
  [iOS device], [Capacitor application, Apollon library, native file bridge], [Local bridge calls and HTTPS where services are required.],
  [Standalone server], [Diagram access and export conversion endpoints], [HTTP request-response with diagram and export data.],
  [Artemis server], [Exercise, assessment, persistence, and collaboration services], [Artemis APIs and real-time session communication.],
  [Athena service], [Version-aware Apollon model parser and feedback generation], [Feedback requests containing serialized model data.],
  [VS Code host], [Apollon extension and renderer], [Local file and extension-host APIs.],
)

== Persistent Data Management

The persisted Apollon model contains diagram elements and notation-specific properties. The library receives and returns this model but does not select a storage system. Standalone Apollon can store local diagrams in client-managed storage and shared diagrams through its application services, while Artemis persists exercise and submission data in its existing infrastructure.

Collaboration cursors, presence, selections, and followed viewports remain transient. They belong to a collaboration session and disappear when the session ends. Export artifacts are derived data: clients may save them as files, but the diagram model remains the source for later editing and conversion.

== Access Control

Host applications own authentication and authorization. Artemis applies its existing student, instructor, and assessor roles before it loads an exercise or accepts an assessment change. The Apollon library receives only the mode and capabilities available to the current user and does not maintain accounts or permissions.

The standalone application distinguishes local diagrams from diagrams accessed through shared links. Sharing services must validate access according to their link and ownership policy. Collaboration services must associate awareness events with an authorized session participant before forwarding them to the library.

== Global Software Control

The interactive editor uses event-driven control. User input triggers library commands that update the in-memory diagram model and notify the host through callbacks. The host decides when to persist the updated model. Collaboration events form a separate stream that updates transient awareness state without changing the persisted diagram.

Export uses either client-side control or a request-response service. Client-side formats use the current renderer directly. Service-based conversion sends diagram data and export parameters to the standalone server, which renders the diagram and returns an artifact or an error. Artemis and Athena control their integrations through their existing request and exercise lifecycles.

== Boundary Conditions

Startup occurs when a host loads the library with a diagram, mode, and callbacks. Collaborative startup additionally joins a session and provides the current participant state. Shutdown returns the latest diagram state to the host and disconnects transient collaboration listeners.

Failure handling preserves the editable diagram whenever possible. A failed export reports an error without modifying the model. A collaboration interruption removes or marks unavailable participants without discarding local edits. An unsupported model version produces an explicit compatibility error, while supported historical versions follow their corresponding parser path. These boundary conditions support the compatibility constraints defined in Chapter 4.
