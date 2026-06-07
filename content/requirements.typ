#import "/utils/fr_qa_c.typ": FR, QA, C

= Requirements

This chapter presents the requirements for the modernization of Apollon as a set of feature-oriented mini projects. The work did not follow a linear process in which all requirements were fixed before implementation. Instead, requirements were collected from the proposal, implemented in one Apollon ecosystem component, validated in an integration context, and then refined when follow-up problems appeared. This reflects the requirements analysis approach described by Bruegge and Dutoit @bruegge2004object, where requirements are refined as the problem domain and solution domain become clearer.

The proposal defines four high-level objectives: reducing interaction cost, improving workspace awareness, supporting touch-first mobile workflows, and improving integrability. The roadmap translated these objectives into concrete implementation waves from February to June 2026. The following sections therefore group requirements by feature area rather than by repository. Each feature group contains its own functional requirements, quality requirements, and constraints.

== Iterative Requirements Engineering <req-iterative>

The requirements evolved through repeated implementation loops. The first loop focused on making the new Apollon library mature enough for downstream systems. This revealed missing requirements in Artemis, Athena, and the standalone export pipeline. The next loops refined mobile export, quiz generation, collaboration awareness, and edge handling. Later implementation work then fed back into the requirements: collaboration features initially developed for the standalone application had to be moved into the library, and the Artemis migration created additional requirements for quiz generation and Athena compatibility.

This iterative process can be summarized as follows:

1. Identify a feature goal from the proposal or roadmap.
2. Implement a first version in the library, standalone application, Artemis, Athena, or the VS Code extension.
3. Validate the feature in the integration context.
4. Add follow-up requirements when integration or real usage reveals missing behavior.

== Collaboration Features <req-collaboration>

Collaborative modeling requires more than shared document state. Users need to understand where collaborators are working, which elements they select, and whether it is useful to follow another user's viewport. The proposal describes this as the need to reduce collaborative blindness.

#FR("Show live cursors")[The Apollon library shall show collaborators' cursor positions during shared modeling sessions.]

#FR("Show collaborator presence")[The Apollon library shall display which collaborators are currently connected to a modeling session.]

#FR("Follow collaborator viewport")[The collaboration layer shall allow a user to follow another user's viewport during collaborative modeling.]

#FR("Reuse collaboration in Artemis")[Collaboration awareness shall be implemented in the library so Artemis can reuse it for team modeling exercises.]

#QA("Low-latency awareness")[Cursor, selection, and presence updates should feel immediate enough to support synchronous collaboration.]

#C("Ephemeral state")[Cursor and presence information must remain transient and must not become part of the persisted diagram model.]

== Edge Usability <req-edge-usability>

Edge editing was identified as a major source of interaction cost. Users had to spend too much effort adjusting edge paths, reconnecting edges, and keeping complex diagrams readable.

#FR("Improve edge interaction")[The editor shall provide improved edge interaction through better handles, waypoint dragging, and reconnection support.]

#FR("Support dynamic edge handles")[The editor shall adapt visible edge handles to the size and shape of the connected element.]

#FR("Support edge line jumps")[The editor shall add line jumps when edges collide or cross, improving readability in complex diagrams.]

#FR("Preserve edge label readability")[The editor shall keep labels readable on vertical and horizontal edges, including communication diagrams.]

#QA("Interaction efficiency")[Edge manipulation should require fewer manual adjustments than the previous implementation.]

#C("Diagram notation")[Edge behavior must remain compatible with the supported diagram types and their visual notation.]

== App Usability <req-app-usability>

The proposal frames usability as minimizing interaction cost. This requirement group covers general editor usability that is not limited to collaboration or edges.

#FR("Provide alignment guides")[The editor shall provide visual alignment guides while users move diagram elements.]

#FR("Support keyboard deletion")[The editor shall allow selected diagram elements to be deleted through keyboard shortcuts.]

#FR("Support scroll lock mode")[The library shall provide a scroll lock mode to prevent unintended canvas movement in embedded contexts.]

#FR("Improve library embedability")[The Apollon library shall expose integration options that make it easier to use from React applications.]

#QA("Predictable editing")[Editing actions should behave consistently across standalone, embedded, and assessment contexts.]

#C("Shared library behavior")[Usability features implemented in the library must not depend on standalone-only application state.]

== iOS App and Mobile Export <req-ios-mobile>

The proposal emphasizes touch-first design and mobile usage. The roadmap narrowed the implemented mobile scope to iOS export and Capacitor-based app support.

#FR("Export files on iOS")[The iOS application shall export diagrams as PNG, PDF, JSON, and SVG files.]

#FR("Export PPTX on iOS")[The iOS application shall support animatable PPTX export for diagrams.]

#FR("Support local server access")[The Capacitor app shall support local server access where required for standalone export and collaboration workflows.]

#QA("Mobile reliability")[Mobile export workflows should work without relying on desktop-only browser assumptions.]

#C("Capacitor platform")[Mobile export must respect the platform limitations of the Capacitor-based iOS application.]

== Standalone Web Application <req-standalone>

The standalone web application needed a clearer entry point for local and shared diagrams. This became a distinct requirement after the editor no longer served only as an embedded component.

#FR("Show diagram home page")[The standalone web application shall provide a home page that lists local and shared diagrams.]

#FR("Support diagram routing")[The standalone web application shall provide stable URL-based routing for diagrams.]

#QA("Navigation clarity")[Users should be able to find, open, and share diagrams without starting from a blank editor view.]

#C("Existing shared links")[Routing changes should preserve compatibility where possible with previously shared diagram links.]

== Export and Conversion <req-export-conversion>

Diagram export spans the library and standalone server. Some export formats can be generated in the browser, while PDF conversion requires server-side support.

#FR("Convert diagrams server-side")[The standalone server shall provide a PDF export endpoint for diagrams.]

#FR("Render diagrams without Playwright")[The conversion service shall use JSDOM and React Flow server-side rendering instead of a Playwright-based implementation.]

#FR("Support SVG export compatibility")[SVG export shall support compatibility modes and rendering fixes for external tools.]

#QA("Export correctness")[Exported diagrams should preserve labels, node rendering, edge rendering, and diagram bounds.]

#C("Server environment")[Server-side conversion must work in containerized environments without depending on a full browser runtime.]

== Artemis Integration <req-artemis>

Artemis is the main educational integration of Apollon. The roadmap required replacing the legacy Apollon integration and then restoring or improving Artemis-specific modeling, quiz, and assessment behavior.

#FR("Replace legacy Apollon")[Artemis shall replace legacy Apollon with the new Apollon integration while preserving modeling exercise behavior.]

#FR("Support team modeling collaboration")[Artemis shall integrate library collaboration features into team modeling exercises.]

#FR("Support quiz mode")[Artemis shall use Apollon quiz mode and interactive export behavior for quiz exercise generation.]

#FR("Support drag-and-drop quiz generation")[Artemis shall select Apollon elements, cut out diagram parts automatically, and generate drag-and-drop quiz content.]

#FR("Support nested quiz selections")[Artemis quiz generation shall support nested Apollon selections.]

#FR("Support assessment interactions")[Assessment views shall support required interactions such as assessment popovers on double click.]

#QA("Regression compatibility")[The new Apollon integration should not regress existing modeling, quiz, and assessment workflows.]

#C("Release windows")[The Artemis work had to align with the Artemis 9.0, 9.1.1, and 9.3 release windows from the roadmap.]

== Athena Integration <req-athena>

Athena consumes Apollon models for feedback. Once Artemis moved toward the new Apollon model format, Athena also needed to understand that format.

#FR("Support Apollon v4 in Athena")[Athena shall parse and process Apollon v4 models for feedback generation.]

#FR("Keep parser backward compatibility")[Athena parser logic shall continue to support older Apollon model formats.]

#FR("Update Athena playground")[The Athena playground shall use the latest Apollon version to validate new model-format behavior.]

#QA("Feedback continuity")[Athena feedback workflows should continue working across old and new Apollon model formats.]

#C("Model compatibility")[Athena must support all Apollon model versions.]

== VS Code Extension <req-vscode>

The proposal identifies the VS Code extension as part of the broader Apollon ecosystem. It needed to use the same renderer as the modernized library.

#FR("Migrate VS Code extension")[The VS Code extension shall be moved into the Apollon monorepo.]

#FR("Update extension renderer")[The VS Code extension shall use the latest Apollon renderer.]

#QA("Consistent ecosystem behavior")[The VS Code extension should provide behavior consistent with the web and embedded Apollon integrations.]

#C("Monorepo integration")[The extension must fit into the monorepo build and release process.]

== System Models <req-system-models>

The relevant actors are students, instructors, assessors, Artemis, Athena, and external editor users. Students edit, export, and collaboratively submit diagrams. Instructors create modeling and quiz exercises. Assessors inspect modeling submissions. Artemis embeds Apollon for teaching workflows, Athena consumes Apollon models for feedback, and external users interact with the standalone web app, iOS app, and VS Code extension.

The central domain objects are diagram, node, edge, selection, viewport, collaborator, export artifact, modeling exercise, quiz exercise, feedback request, and Apollon model. Diagrams consist of nodes and edges. Collaborators operate on selections and viewports. Export artifacts are generated from diagrams. Artemis stores modeling and quiz exercise data, while Athena consumes Apollon model data for feedback.
