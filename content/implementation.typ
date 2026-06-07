= Implementation Details

This chapter describes how the feature-oriented requirements from Chapter 4 were implemented. Each section refers back to the corresponding requirements section. The implementation was iterative: features were implemented in one context, validated in another, and then refined when integration work exposed missing requirements.

== Iterative Implementation Approach <impl-iterative>

The implementation followed the requirements loop described in @req-iterative. The project started with concrete roadmap goals, but the detailed requirements became clearer while integrating Apollon into Artemis, Athena, the standalone application, and the VS Code extension. This created several feature-focused mini projects within the main thesis.

For example, replacing legacy Apollon in Artemis exposed the need for Athena parser compatibility and quiz drag-and-drop support. Similarly, collaboration features first implemented in the standalone application later became library requirements because Artemis needed the same behavior for team modeling exercises.

== Collaboration Features <impl-collaboration>

This section implements the requirements from @req-collaboration. Collaboration work started in the standalone application with live cursors and a presence indicator. These features addressed the proposal's workspace-awareness objective by making collaborator activity visible during shared modeling sessions.

In the next iteration, the collaboration functionality was moved into the Apollon library. This made the awareness layer reusable for library consumers and allowed Artemis to integrate live cursors, selections, presence information, and viewport following into team modeling exercises. The Artemis integration remains represented by the open team-modeling collaboration pull request.

== Edge Usability <impl-edge-usability>

This section implements the requirements from @req-edge-usability. Edge handling was treated as a library-level usability project because edge interaction affects almost every diagram type. The implementation improved edge usability and UI/UX, added step-edge bending, supported waypoint dragging, and integrated React Flow reconnection behavior. Dynamic edge handles based on element size improved the connection workflow by adapting handles to the element being edited.

Follow-up work added line jumps for edge collisions and fixed communication diagram labels on vertical edges. These changes show the iterative requirements process: after the broader edge refactor improved manipulation, real diagrams still exposed readability issues that required additional requirements.

== App Usability <impl-app-usability>

This section implements the requirements from @req-app-usability. Alignment guides were added to reduce manual positioning effort. This directly implements the proposal objective of reducing interaction cost. A later nested-elements bug fix refined this feature for more complex diagrams.

Additional app usability work added class attribute and method reordering, keyboard deletion, scroll lock mode, and sidebar/export UI cleanup. The library was also exposed more explicitly as a React library so that React applications could integrate Apollon with less custom wrapper code.

== iOS App and Mobile Export <impl-ios-mobile>

This section implements the requirements from @req-ios-mobile. The iOS application gained file export support for PNG, PDF, JSON, and SVG. Later, export support was extended with animatable PPTX export for webapp and iOS. The Capacitor application also gained local server support for workflows that rely on standalone services.

The mobile implementation refined the proposal's touch-first objective into concrete platform requirements. Instead of treating mobile as a reduced desktop view, the implementation focused on making export workflows work inside the iOS app's platform constraints.

== Standalone Web Application <impl-standalone>

This section implements the requirements from @req-standalone. The standalone web application was extended with a home page that lists diagrams and gives users a clearer entry point than an empty editor. URL-based routing was added so diagrams can be opened and shared through stable routes.

This work is related to the broader usability goal. While library usability focuses on editing interactions, standalone usability focuses on how users enter, manage, and navigate diagrams.

== Export and Conversion <impl-export-conversion>

This section implements the requirements from @req-export-conversion. The standalone server provides a server-side PDF export endpoint. The conversion implementation was refined by replacing the Playwright-based approach with JSDOM and React Flow server-side rendering, making the service more suitable for containerized server environments.

SVG export was improved through compatibility modes, a flat SVG exporter, visual export tests, text-bound fixes, and rendering fixes for class, component, SFC, and Petri net diagrams. These changes ensure that export artifacts remain useful outside the editor.

== Artemis Integration <impl-artemis>

This section implements the requirements from @req-artemis. Artemis replaced the legacy Apollon integration with the new Apollon library while preserving modeling exercise behavior. The first migration loop targeted Artemis 9.0. Subsequent work addressed feature gaps that appeared after migration.

For Artemis 9.1.1, Apollon drag-and-drop quiz support restored missing behavior from the previous integration. The implementation added element selection, SVG rendering fixes, and automatic diagram cut-outs. For Artemis 9.3, follow-up requirements added nested selections in quiz generation, updated selection highlighting, and fixed assessment popover behavior. In June, collaboration features from the library were integrated into Artemis team modeling exercises.

== Athena Integration <impl-athena>

This section implements the requirements from @req-athena. Athena was updated to support Apollon v4 models for feedback generation. The parser was adapted to keep backward compatibility with older model formats, and the Athena playground was updated to the latest Apollon version for validation.

This work was a direct result of the Artemis migration. Once Artemis began producing or consuming newer Apollon models, Athena also needed to support them to avoid breaking feedback workflows.

== VS Code Extension <impl-vscode>

This section implements the requirements from @req-vscode. The VS Code extension was moved into the Apollon monorepo and updated to the latest Apollon renderer. This reduced ecosystem fragmentation and kept local IDE usage aligned with the standalone web app and embedded Artemis integration.

== Implementation Timeline

#table(
  columns: (auto, 1fr, 1.3fr, auto),
  inset: 5pt,
  align: (left, left, left, center),
  table.header([Month], [Feature Area], [Key Deliverables], [Status]),
  [February 2026], [iOS app and mobile export], [iOS file export for PNG, PDF, JSON, and SVG], [Done],
  [February 2026], [VS Code extension], [Migration into Apollon monorepo and renderer update], [Done],
  [March 2026], [App usability], [Alignment guides and follow-up fixes], [Done],
  [April 2026], [Artemis integration], [Replace legacy Apollon with new Apollon], [Done],
  [April 2026], [Athena integration], [Apollon v4 model support and parser compatibility], [Done],
  [April 2026], [Artemis quiz integration], [Element selection, SVG rendering, and automatic cut-out], [Done],
  [April 2026], [Export and conversion], [Server-side export conversion and PDF endpoint], [Done],
  [May 2026], [Artemis quiz follow-ups], [Nested selections, highlight color, assessment popover fixes], [Done],
  [May 2026], [iOS app and mobile export], [Animatable PPTX export for iOS], [Done],
  [May 2026], [Collaboration], [Live cursors and presence indicator in standalone], [Done],
  [May 2026], [Standalone web application], [Home page with diagram list and URL routing], [In progress],
  [June 2026], [Collaboration], [Move awareness features into the library], [In progress],
  [June 2026], [Artemis integration], [Team modeling awareness integration], [In progress],
  [June 2026], [Edge usability], [Edge refactor, waypoint dragging, reconnection, line jumps], [In progress],
)
