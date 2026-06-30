= User Feedback and Findings

#import "/utils/section_link.typ": section-link

This chapter presents feedback collected during the project and relates it to the implemented changes from @impl-chapter. The feedback does not represent a controlled quantitative usability study. It combines qualitative observations from user sessions, feedback from students and teaching contexts, GitHub issues, integration feedback from Artemis developers, and problems discovered during implementation and testing. The goal is to assess whether the implemented changes address relevant workflows and to identify remaining limitations for future Apollon development.

The findings are grouped by theme rather than by feedback source. This structure reflects the way feedback influenced the project. Different sources repeatedly pointed to similar problem areas, especially edge interaction, diagram layout, discoverability, collaboration, export, standalone navigation and diagram management, and integration with educational workflows. Grouping the findings by theme makes it easier to connect them to the requirements from @req-chapter and the implementation areas from @impl-chapter.

== Feedback Sources

The feedback material came from different stages of the project. Initial feedback came from the thesis proposal, existing GitHub issues, previously reported usability problems, and discussions with developers who used or integrated the Apollon library. These sources helped identify recurring barriers in diagram editing, export, navigation, and educational integration.

Additional feedback came from educational use. Students used Apollon in teaching contexts such as iPraktikum, modeling exercises, and project-related work. Instructors, tutors, and Artemis developers encountered the tool through exercise creation, assessment, quiz generation, collaboration, and integration work. This feedback was especially relevant because Apollon is not only a standalone diagram editor. It is also part of a larger educational ecosystem that includes Artemis, Athena, mobile applications, and the VS Code extension.

Later in the project, feedback sessions were used to inspect the implemented state of Apollon more directly. Users worked with Apollon on realistic tasks from teaching, research, supervision, or Artemis-related work. These sessions produced detailed observations about edge behavior, collaboration, export, diagram management, notation support, and remaining adoption barriers.

The collected feedback was heterogeneous. Some feedback described concrete bugs, such as broken assessment controls or export problems. Some feedback described workflow issues, such as the difficulty of creating straight edges or managing diagrams across local and shared contexts. Other feedback described future expectations, such as PlantUML interoperability, review comments, offline support, stronger ownership of shared diagrams, and more complete UML notation support.

== Feedback Method

The feedback process followed a qualitative and formative approach. The project did not aim to compare Apollon versions under controlled laboratory conditions. Instead, feedback was collected continuously while the system was being reengineered, integrated, and tested in realistic usage contexts. This fits the iterative development process described in #section-link(<impl-iterative>), where requirements and implementation evolved together through feedback, testing, and integration constraints.

Feedback was processed in three steps. Reported issues, developer comments, and observed workflow problems were grouped into requirement areas such as edge usability, export correctness, collaboration awareness, standalone navigation, and educational integration. Implementation work then addressed these requirement areas in the Apollon library, standalone application, mobile application, Artemis, Athena, and the VS Code extension. Later feedback sessions and integration tests were used to inspect whether the implemented behavior supported the intended workflows and to identify remaining problems.

The feedback sessions used a think-aloud format. Users selected realistic tasks and worked with Apollon while explaining their expectations, frustrations, and workarounds. Think-aloud protocols are commonly used in usability work because they expose what users expect while interacting with a system @ericsson1993protocol @nielsen1993usability. The session moderator avoided giving detailed instructions unless the user became blocked. This allowed usability problems such as missing discoverability, unexpected edge behavior, unclear interface states, or export limitations to appear naturally.

The findings distinguish between feedback addressed during this thesis and feedback that remained outside the implementation scope. Addressed feedback is connected to the implementation sections in @impl-chapter. Remaining feedback is used to derive future work in this chapter and in @summary-chapter.

== Findings

The following findings summarize recurring feedback themes. They do not claim that all users experience Apollon in the same way. They show which parts of the implementation were considered useful and which remaining barriers appeared during realistic use.

=== Edge Interaction and Diagram Layout

Feedback repeatedly identified edge interaction as a major source of friction. Users struggled with crooked lines, hard-to-control connection points, overlapping edges, small selectable areas, and layout adjustments that required too much manual correction. This feedback appeared in earlier usability sessions, in issue discussions, and in later walkthroughs.

The implementation addressed part of this feedback through step-edge bending, waypoint dragging, React Flow edge reconnection, dynamic edge handles, and line jumps for overlapping edges. These changes improved direct manipulation of edges and made intersecting connections easier to read. They also moved edge handling into the shared editor layer, which made the behavior available to different host applications.

Later feedback showed that edge interaction remains an important future-work area. Users still expected easier straight-line correction, more flexible anchor behavior, larger selectable areas, and connection points that adapt more strongly to the size of an element. This means that the implemented work improved edge usability but did not remove all friction. Future work should continue with edge snapping, proportional anchor points, and clearer visual affordances for selecting and adjusting edges.

=== Editing, Discoverability, and Visual Customization

Feedback showed that some editing features were useful but not always discoverable. Users appreciated multi-selection, helper lines, alignment support, copy and paste, and keyboard-based editing after they found or were shown the functionality. At the same time, users sometimes assumed that a feature was missing because the interaction was not visible enough or because browser behavior interrupted the workflow.

The implementation addressed several editing problems through alignment guides, class attribute and method reordering, keyboard deletion behavior, scroll lock mode, and user interface cleanup. These changes reduce small sources of friction that accumulate during repeated modeling tasks. They also support the goal that users should focus on modeling decisions rather than on arranging elements manually.

Remaining feedback focused on advanced editing and customization. Users requested multiline text support, stronger text-field limits, custom stereotypes, transparency controls, iconized diagrams, layers, and more keyboard shortcuts. These requests show a tension in Apollon's design. The tool should remain simple enough for students, but experienced users need more control for teaching material, presentations, and complex diagrams. Future work should make advanced controls available without making the main interface harder for beginners.

=== Collaboration and Shared Modeling

Collaboration received positive feedback once users saw the available awareness features. Live cursors, presence information, visible selections, and viewport following helped users understand where collaborators were working. This supports the workspace-awareness requirements from #section-link(<req-collaboration>)#h(0.25em)and the collaboration implementation described in #section-link(<impl-collaboration>).

The feedback also confirmed that collaboration awareness should remain separate from the persisted diagram model. Cursors, selections, presence, and followed viewports help users coordinate during a session, but they do not belong to the diagram content itself. This matches the architectural decision to treat awareness state as transient session data.

Remaining feedback focused on collaboration beyond synchronous editing. Users wanted clearer ownership of shared diagrams, optional login, persistent shared workspaces, and review comments for teaching and supervision. These features would make Apollon more useful when students submit diagrams, tutors review them, or instructors discuss modeling decisions with project teams. They remain future work because they require stronger persistence and access-control decisions than the current lightweight sharing model.

=== Export and Presentation Workflows

Export was a recurring workflow concern. Users do not treat export as a secondary technical function. They use exported diagrams in slides, teaching material, documentation, project reports, and learning-platform workflows. Feedback therefore emphasized export quality, editability of exported artifacts, and interoperability with surrounding tools.

The implementation addressed export feedback through server-side PDF export, SVG compatibility modes, flat SVG export, rendering fixes, visual export tests, text-bound fixes, clipping fixes, and presentation export work. These changes support the export and rendering requirements from #section-link(<req-export-rendering>). They also make Apollon diagrams more portable across the standalone application, mobile workflows, and educational contexts.

Remaining feedback focused on interoperability. Users requested clearer separation between editable model import/export and print-oriented formats such as SVG, PNG, PDF, and PPTX. They also requested Keynote support, PlantUML import and export, and stronger integration with Artemis workflows. PlantUML interoperability was especially relevant because it could connect Apollon more closely to existing teaching and programming-exercise workflows.

=== Standalone Navigation and Diagram Management

Feedback supported the direction of the standalone home page and routing work. Users valued a faster entry point for creating diagrams, opening existing diagrams, and distinguishing local from shared diagrams. This supports the standalone requirements from #section-link(<req-standalone>)#h(0.25em)and the implementation described in #section-link(<impl-standalone-home>).

The implementation addressed navigation feedback through a home page, local and shared diagram lists, and URL-based routing. These changes move the standalone application away from a single editor entry point and toward a diagram management workflow. They also make shared diagrams easier to open and return to.

Remaining feedback concerned persistence and long-term ownership. Local diagrams can be fragile when users depend on browser storage. Shared diagrams are easy to access through links, but lightweight sharing does not provide the ownership guarantees some users expect. Future work should therefore consider optional authentication, stronger shared-diagram ownership, PWA support, local file-system integration, and Git-friendly workflows for scientific and project work.

=== Educational Integration

Feedback from Artemis developers, teaching contexts, and user sessions showed that Apollon must support more than standalone diagram creation. The editor is part of modeling exercises, quiz generation, assessment, feedback generation, and team modeling. Integration feedback therefore became a major source of follow-up requirements.

The implementation addressed several educational integration problems. Artemis was migrated to the maintained Apollon version, drag-and-drop quiz generation was repaired, nested Apollon selections were supported, assessment popover interaction was fixed, and Athena was updated to process current and earlier Apollon model versions. These changes support the integration requirements from #section-link(<req-artemis>)#h(0.25em)and #section-link(<req-athena>).

Remaining feedback focused on deeper teaching workflows. Users requested review comments, better assessment-oriented collaboration, stronger PlantUML interoperability, and more complete UML notation support. Static and abstract class members, type parameters, directed relationships, and additional diagram types were mentioned as important for teaching. These requests show that Apollon's educational value depends not only on the editor interface but also on how well it supports the notations and review workflows used in courses.

=== User Interface Consistency and Maintainability

Feedback and implementation experience showed that usability problems were not limited to individual features. The editor and surrounding applications needed a more consistent interface language, while older component and styling layers made parts of the editor harder to maintain.

The implementation addressed part of this issue through the editor-side modernization described in Section 6.2.7. The editor-facing work replaced parts of the older MUI and Emotion usage with lighter reusable primitives and adapted popovers, selection controls, tooltips, and style-editing components to the newer component approach. It also included cleanup of wrapper components, icon usage, related styles, package configuration, and tests.

This work supports usability and maintainability at the editor level. Users benefit from more consistent controls and clearer interface behavior, while future developers benefit from reduced dependency on older UI layers. Broader system-wide design-system work, public theming APIs, accessibility gates, and full standalone web application modernization are outside the scope of this specific contribution and should be treated separately.

== Discussion

The feedback supports the general direction of the implementation. Users and developers recognized improvements in collaboration, export, standalone navigation and diagram management, edge readability, and editing support. These areas correspond to the main requirement groups from @req-chapter and the implementation groups from @impl-chapter. The feedback therefore provides qualitative support that the implemented work addresses relevant Apollon workflows.

The strongest remaining concern is edge interaction. Feedback repeatedly returned to edge straightness, anchor points, layout, and selectable areas. This confirms that edge usability should remain a central future-work topic. The implemented edge refactor and line-jump behavior improved important parts of the experience, but users still expect more direct control over line segments and connection points.

The feedback also shows a tension between beginner usability and power-user functionality. Apollon is used in education, so the main interface should not overload students with complex controls. At the same time, instructors, researchers, tutors, and experienced users need features such as layers, custom colors, keyboard shortcuts, local file workflows, and more complete notation support. A future design should therefore keep the main workflow simple while making advanced features discoverable through secondary controls, shortcut help, or command-based interaction.

The findings clarify the role of Apollon in the educational ecosystem. Feedback did not evaluate Apollon only as a drawing tool. It discussed teaching material, Artemis workflows, review processes, PlantUML interoperability, student supervision, presentation export, and long-term diagram ownership. This supports the thesis focus on usability and integration as connected problems rather than separate implementation areas.

== Limitations

The feedback has several limitations. It was collected during an active development project and not through a controlled experiment. The findings provide qualitative insight into relevant workflows, but they do not measure task completion time, error rates, or satisfaction scores in a statistically comparable way.

The feedback sources were heterogeneous. Some came from students and teaching contexts, some from developers integrating Apollon into Artemis, some from existing issues, and some from walkthrough sessions. This variety helped identify recurring themes, but it also means that not every finding came from the same type of user or task.

Some implemented features were still in transition during parts of the feedback period. Users sometimes saw or discussed features that were not deployed in the same state as the final thesis version. The feedback should therefore be interpreted as project feedback during development rather than as final product validation.

Automatically generated transcripts were used for some sessions. Obvious transcription errors were corrected when summarizing the findings, but direct quotations should only be used after checking the original recording or transcript. For this reason, this chapter primarily reports paraphrased findings instead of relying on long direct quotes.

== Implications for Future Work

The feedback identifies several concrete future-work directions. Continued edge and layout improvement remains the most important direction. Users need easier straight-line creation, clearer edge handles, larger selectable areas, and connection points that scale with element size. These changes would build directly on the edge usability work described in #section-link(<impl-edge-usability>).

A second direction is stronger persistence and ownership. Optional login, persistent shared diagrams, local file-system integration, PWA support, and Git-friendly workflows would make Apollon more suitable for scientific and long-term project work. These features would extend the standalone home page from a navigation surface into a stronger diagram management system.

A third direction is deeper educational integration. PlantUML import and export, review comments, improved Artemis workflows, and more complete UML notation support would make Apollon more useful for teaching and assessment. Better tutorials for diagram types such as BPMN could help students understand when and how to use supported notations.

A fourth direction is advanced functionality for experienced users. Multiline text, custom stereotypes, color customization, iconized diagrams, layers, command palettes, and code generation would support complex workflows. These features should be designed carefully so that they do not reduce Apollon's accessibility for new students.

Overall, the feedback confirms that the implemented improvements move Apollon in a useful direction. Collaboration, export, standalone navigation and diagram management, user interface consistency, and several editing improvements were perceived positively. Remaining limitations mainly concern advanced modeling control, persistence, notation completeness, and integration with surrounding educational and development tools.
