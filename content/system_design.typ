= Architecture

#import "/utils/section_link.typ": section-link

#show table.cell: it => {
  set par(justify: false)
  it
}

#show table: it => block(breakable: false, it)

This chapter maps the application-domain concepts and requirements from Chapter 4 to the software architecture. It follows the system design structure proposed by Bruegge and Dutoit @bruegge2004object. The design focuses on the parts of the Apollon ecosystem changed by this thesis.

== Overview <arch-overview>

The Apollon library is the reusable center of the proposed architecture. It provides shared editor behavior, model behavior, rendering behavior, editor runtime callbacks, and reusable collaboration-awareness presentation. Host applications configure the editor and connect it to their own user interface, persistence, access control, session infrastructure, and platform-specific workflows.

The standalone web application owns the standalone home page, diagram routing, local and shared diagram workflows, and service calls to the standalone server. The iOS application follows the standalone workflow through a Capacitor shell and adds native file/export handling. Artemis embeds Apollon for educational workflows, Athena consumes serialized Apollon models for feedback generation, and the VS Code extension hosts the editor and renderer in the IDE environment.


== Design Goals <arch-decisions>

The quality attributes and constraints in Chapter 4 determine the design goals. Compatibility has the highest priority because Artemis and Athena already serve active educational workflows. Usability follows because the thesis aims to reduce interaction effort. Reuse and maintainability guide the placement of shared behavior in the library.

A shared library reduces duplication but requires stable interfaces for several hosts. Server-side rendering improves deployment portability but must reproduce browser rendering accurately. The architecture resolves these conflicts by keeping shared model and rendering behavior in the Apollon library while leaving authentication, persistence, session infrastructure, and deployment policy to each host.


== Subsystem Decomposition <arch-subsystems>

The system is decomposed into subsystems according to ownership of editor behavior, application workflows, and integration responsibilities. The decomposition follows the requirement areas from #section-link(<req-iterative>) and keeps dependencies directed toward the Apollon library.

@fig-standalone-decomposition visualizes the decomposition of the standalone application. The web application separates the diagram overview, local editing, shared editing, and version history. Both editors reuse the Apollon library, while shared diagrams and their versions use the standalone server. The server exposes diagram and version APIs, relays collaboration messages, and stores shared diagram data in Redis Stack. White components already existed, orange components were modified, and blue components were added during the work described in this thesis.

#figure(
  image("/figures/apollon-standalone-decomposition.png", width: 100%),
  caption: [UML component diagram of the standalone subsystem decomposition.],
) <fig-standalone-decomposition>

=== Apollon Library <arch-library>

The Apollon library defines and exposes the reusable editor, diagram model behavior, rendering behavior, runtime callbacks, editor modes, and awareness presentation. Host applications supply the current diagram, mode and capability configuration, persistence behavior, and collaboration/session events; the library sends model updates and editor events back through configured callbacks.

The library does not own persistence, authentication, authorization, course data, shared-link storage, collaboration transport, or deployment configuration. This boundary prevents standalone, Artemis, and other host concerns from becoming dependencies of the shared editor.

=== Standalone and Mobile Applications <arch-standalone-mobile>

The standalone application owns the standalone home page, diagram routes, local and shared diagram workflows, and calls to application services. Local diagrams are managed by the browser/client-side application, while shared diagrams use standalone application services and server-side shared diagram storage. The standalone server also provides conversion services for exports that require service-side processing.

The iOS application uses the standalone workflow inside a Capacitor shell. Native bridges connect derived export artifacts to platform file handling and keep the mobile application separate from Artemis and Athena integration concerns.

=== Artemis Integration <arch-artemis>

The Artemis integration embeds and configures Apollon for modeling exercises, quiz-related editor interactions, assessment views, and team modeling. It translates course and exercise state into library properties and receives diagram, selection, and assessment events from the library.

Artemis remains responsible for authentication, authorization, the exercise lifecycle, submissions, quiz data, assessment records, persistence, and team modeling/session infrastructure. It stores educational Apollon models in Artemis-side persistence rather than in the standalone Apollon server. The integration layer prevents these concerns from entering the Apollon library.

@fig-artemis-integration focuses on the components involved in the educational integration. The Modeling Module embeds the Diagram Editor through its public API and uses the Participation Team WebSocket Service for team exercises. The Quiz and Assessment Modules build on the modeling integration, while Athena consumes diagram models through its Feedback Generator. The standalone Conversion Service provides server-side diagram conversion and depends on the reusable Apollon library for model import and rendering.

#figure(
  image("/figures/apollon-artemis-integration.png", width: 100%),
  caption: [UML component diagram of the Apollon integration with Artemis, Athena, and the conversion service.],
) <fig-artemis-integration>

=== Athena and VS Code Integrations <arch-athena-vscode>

Athena consumes serialized Apollon models for feedback generation rather than embedding the editor. Its parser selects behavior according to the model version and maps supported versions to the concepts needed for feedback generation.

The VS Code extension is a local IDE host for the maintained Apollon editor and renderer. It connects workspace files to the Apollon model while preserving the extension-specific host interface.

== Hardware/Software Mapping

The architecture runs across browser clients, mobile devices, application servers, and external educational services. Client-side editing remains available without a dedicated rendering server, while shared diagrams, collaboration, and service-based exports require host infrastructure.

The mapping separates interactive rendering from persistent and compute-oriented services. This reduces latency during editing and allows Artemis and the standalone application to deploy the same library in different environments.

@fig-deployment-persistence maps these components and their persisted data to execution nodes. On a desktop machine, the browser keeps local diagrams in `localStorage` and local version history in IndexedDB, while the VS Code extension stores `.apollon` files in the workspace. The mobile application runs the same web application inside a Capacitor WebView and therefore uses WebView `localStorage` and IndexedDB for local diagrams and versions.

Shared diagrams follow a separate path. HTTPS and WebSocket traffic passes through Traefik to the standalone server. Redis Stack stores the current shared diagram as mutable state and keeps complete version snapshots with their metadata and index. The WebSocket relay holds collaboration presence only in memory, and the Conversion Service produces derived exports without replacing the persisted diagram model.

#figure(
  image("/figures/apollon-deployment-and-persistence-architecture.png", width: 100%),
  caption: [UML deployment diagram of Apollon execution environments and diagram persistence.],
) <fig-deployment-persistence>

#table(
  columns: (1fr, 1.35fr, 1.55fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, left, left),
  table.header([Execution node], [Software components], [Communication]),
  [Web browser], [Apollon library, standalone or Artemis user interface], [HTTPS requests and host-provided collaboration events.],
  [iOS device], [Capacitor mobile shell, Apollon library, native file/export bridge], [Local bridge calls and HTTPS where standalone services are required.],
  [Standalone server], [Shared diagram services and conversion service], [HTTP request-response with diagram and export data.],
  [Artemis server], [Exercise, assessment, persistence, and collaboration services], [Artemis APIs and real-time session communication.],
  [VS Code host], [Apollon extension, editor, and renderer], [Workspace files and extension-host APIs.],
)

== Persistent Data Management

The persisted diagram model contains diagram elements and notation-specific properties. The Apollon library receives and returns this model but does not select a storage system or become the authoritative store for any host. Storage ownership follows host boundaries: standalone local diagrams are client/browser-managed, standalone local version history is stored separately in IndexedDB, standalone shared diagrams use application/server-side shared diagram services, Artemis stores exercises, submissions, quiz data, assessment data, and Apollon model data in Artemis-side persistence, and VS Code stores diagrams as workspace files.

Collaboration cursors, participant identity, selections, and followed viewport state are transient collaboration state. They belong to a collaboration session and disappear when the session ends. Derived export artifacts are not the persisted diagram model: clients may save them as files, but the diagram model remains the source for later editing and conversion.

== Access Control

Host applications own authentication and authorization. Artemis applies its existing student, instructor, and assessor roles before it loads an exercise or accepts an assessment change. The Apollon library receives only the mode and capabilities available to the current user and does not authenticate users or maintain accounts and permissions.

The standalone application distinguishes local diagrams from diagrams accessed through shared links. Sharing services must validate access according to their link. Collaboration services must associate awareness events with an authorized session participant before forwarding them to the library.

== Global Software Control

The interactive editor uses event-driven control. User input triggers library commands that update the in-memory diagram model and notify the host through callbacks. The host decides when to persist the updated model. Collaboration events form a separate transient stream that updates awareness presentation according to the data boundary defined in the previous section.

Export uses either client-side control or a request-response service. Client-side formats use the current renderer directly. Service-based conversion sends diagram data and export parameters to the standalone server, which renders the diagram and returns an artifact or an error. Artemis and Athena control their integrations through their existing request and exercise lifecycles.

== Boundary Conditions

Startup occurs when a host loads the library with a diagram, mode, and callbacks. Collaborative startup additionally joins a session and provides the current participant state. Shutdown returns the latest diagram state to the host and disconnects transient collaboration listeners.

Failure handling preserves the editable diagram whenever possible. A failed export reports an error without modifying the model or the authoritative stored diagram. A collaboration interruption removes or marks unavailable participants without discarding local edits or persisting transient collaboration state. An unsupported model version produces an explicit compatibility error, while supported historical versions follow their corresponding parser path. These boundary conditions support the compatibility constraints defined in Chapter 4.
