= User Feedback and Findings

#import "/utils/section_link.typ": section-link

This chapter presents feedback collected during the project and relates it to the implemented changes from @impl-chapter. The feedback does not represent a controlled usability study. It combines qualitative observations from user sessions, feedback from students and teaching contexts, GitHub issues, integration feedback from Artemis developers, and problems discovered during implementation and testing. The goal is to assess whether the implemented changes address relevant workflows and to identify remaining limitations for future Apollon development.

The findings are grouped by theme rather than by feedback source. This structure reflects the way feedback influenced the project. Different sources repeatedly pointed to similar problem areas, especially edge interaction, diagram layout, discoverability, collaboration, export, standalone navigation and diagram management, and integration with educational workflows. Grouping the findings by theme makes it easier to connect them to the requirements from @req-chapter and the implementation areas from @impl-chapter.

== Feedback Sources

The feedback material came from different stages of the project. Initial feedback came from the thesis proposal, existing GitHub issues, previously reported usability problems, and discussions with developers who used or integrated the Apollon library. These sources helped identify recurring barriers in diagram editing, export, navigation, and educational integration.

Additional feedback came from educational use. Students used Apollon in teaching contexts such as Intro course and iPraktikum, modeling exercises, and project-related work. Instructors, tutors, and Artemis developers encountered the tool through exercise creation, assessment, quiz generation, collaboration, and integration work.

Later in the project, feedback sessions were used to inspect the implemented state of Apollon more directly. Users worked with Apollon on realistic tasks from teaching, research, supervision, or Artemis-related work. These sessions produced detailed observations about edge behavior, collaboration, export, diagram management, notation support, and remaining adoption barriers.

One additional walkthrough session involved a participant with limited recent Apollon usage who had last used an older version of the editor. Their regular modeling practice mainly involved Lucidchart for UML diagrams and occasionally draw.io for quick sketches, in contexts such as papers, supervision, and thesis-related work. The session used an activity-diagram task and produced formative feedback on editing friction, layout control, export behavior, collaboration awareness, sharing modes, standalone navigation and diagram management, and notation support.

The collected feedback was heterogeneous. Some feedback described concrete bugs, such as broken assessment controls or export problems. Some feedback described workflow issues, such as the difficulty of creating straight edges or managing diagrams across local and shared contexts. Other feedback described future expectations, such as PlantUML interoperability, review comments, offline support, stronger ownership of shared diagrams, and more complete UML notation support.

== Feedback Method

The feedback process followed a qualitative and formative approach. The project did not aim to compare Apollon versions under controlled laboratory conditions. Instead, feedback was collected continuously while the system was being reengineered, integrated, and tested in realistic usage contexts. This fits the iterative development process described in #section-link(<impl-iterative>), where requirements and implementation evolved together through feedback, testing, and integration constraints.

Feedback was processed in three steps. Reported issues, developer comments, and observed workflow problems were grouped into requirement areas such as edge usability, export correctness, collaboration awareness, standalone navigation, and educational integration. Implementation work then addressed these requirement areas in the Apollon library, standalone application, mobile application, Artemis, Athena, and the VS Code extension. Later feedback sessions and integration tests were used to inspect whether the implemented behavior supported the intended workflows and to identify remaining problems.

The feedback sessions used a think-aloud format. Users selected realistic tasks and worked with Apollon while explaining their expectations, frustrations, and workarounds. Think-aloud protocols are commonly used in usability work because they expose what users expect while interacting with a system @ericsson1993protocol @nielsen1993usability. The session moderator avoided giving detailed instructions unless the user became blocked. This allowed usability problems such as missing discoverability, unexpected edge behavior, unclear interface states, or export limitations to appear naturally.

The findings distinguish between feedback addressed during this thesis and feedback that remained outside the implementation scope. Addressed feedback is connected to the implementation sections in @impl-chapter. Remaining feedback is used to derive future work in this chapter and in @summary-chapter.

== Findings

The following findings summarize recurring feedback themes. They do not claim that every user experiences Apollon in the same way. They show which parts of the implementation were considered useful and which remaining barriers appeared during realistic use.

=== Edge Interaction and Diagram Layout

Feedback repeatedly identified edge interaction as a major source of friction. Users struggled with crooked lines, hard-to-control connection points, overlapping edges, small selectable areas, and layout adjustments that required too much manual correction. This feedback appeared in earlier usability sessions, in issue discussions, and in later walkthroughs.

The edge changes described in #section-link(<impl-edge-usability>) addressed part of this feedback. Later walkthrough feedback reacted positively to line jumps because they made crossing edges more understandable without requiring manual rearrangement.

Later feedback showed that edge interaction remains an important future-work area. Users still expected easier straight-line correction, more flexible anchor behavior, larger selectable areas, and connection points that adapt more strongly to the size of an element. The additional walkthrough also indicated that diagrams can waste space when edges route around nearby elements and that very close elements can produce U-shaped edge artifacts instead of compact straight connections. Participants also wanted manual edge-label placement, especially for decision labels such as yes/no in activity diagrams. This means that the implemented work improved edge usability but did not remove all friction. Future work should continue with edge snapping, proportional anchor points, manual edge-label placement, space-efficient routing, and clearer visual affordances for selecting and adjusting edges.

=== Editing, Discoverability, and Visual Customization

Feedback showed that some editing features were useful but not always discoverable. Users appreciated multi-selection, alignment support, copy and paste, and keyboard-based editing after they found or were shown the functionality. At the same time, users sometimes assumed that a feature was missing because the interaction was not visible enough or because browser behavior interrupted the workflow.

The editing changes described in #section-link(<impl-app-usability>) addressed several of the reported problems. Feedback nevertheless showed that useful features need clearer affordances before users can benefit from them without assistance.

Remaining feedback focused on advanced editing, discoverability, and customization. Users requested multiline text support, stronger text-field limits, custom stereotypes, transparency controls, iconized diagrams, layers, and more keyboard shortcuts. The additional walkthrough reinforced this pattern through smaller interaction problems: sidebars or panels could obscure newly inserted elements, renaming popovers did not always close when expected, click-versus-drag behavior was not always clear, and multi-select did not fully match expectations from other design tools. The participant also expected duplication shortcuts such as option-drag duplication and asked for more styling flexibility, including custom colors, arrowheads, and line thickness. The tool should remain simple enough for students, but experienced users need more control for complex diagrams. Future work should make advanced controls discoverable without making the main interface harder for beginners.

=== Collaboration and Shared Modeling

Collaboration received positive feedback once users saw the available awareness features. Highlighted selected or dragged elements, live cursors with participant names, visible movement of other users' selections, and viewport following helped users understand where collaborators were working. This supports the workspace-awareness requirements from #section-link(<req-collaboration>)#h(0.25em)and the collaboration implementation described in #section-link(<impl-collaboration>).

The feedback also confirmed that collaboration awareness should remain separate from the persisted diagram model. Cursors, participant identity, selections, and followed viewports help users coordinate during a session, but they do not belong to the diagram content itself. This matches the architectural decision to treat awareness state as transient session data.

Remaining feedback focused on collaboration beyond synchronous editing. Users wanted clearer ownership of shared diagrams, optional login, persistent shared workspaces, and review comments for teaching and supervision. The additional walkthrough also showed that the distinction between edit links and collaboration links was not immediately clear. Future work should therefore clarify sharing modes or simplify them so users can understand which link supports which kind of shared modeling. These features would make Apollon more useful when students submit diagrams, tutors review them, or instructors discuss modeling decisions with project teams. They remain future work because they require stronger persistence and access-control decisions than the current lightweight sharing model.

=== Export and Presentation Workflows

Export was a recurring workflow concern. Users do not treat export as a secondary technical function. They use exported diagrams in slides, teaching material, documentation, project reports, and learning-platform workflows. Feedback therefore emphasized export quality, editability of exported artifacts, and interoperability with surrounding tools.

The export work described in #section-link(<impl-export-rendering>) addressed several reported correctness and portability problems. Feedback treated these changes as part of the modeling workflow rather than as secondary technical functionality.

Remaining feedback focused on interoperability and export correctness. In the additional walkthrough, export worked during the session, but the participant also remembered earlier Apollon issues such as cut-off actors in exported use-case diagrams. This supports the relevance of continued export hardening, especially where visual exports are reused in reports, slides, and teaching material. Users also requested clearer separation between editable model import/export and print-oriented formats such as SVG, PNG, PDF, and PPTX, as well as Keynote support, PlantUML import and export, and stronger integration with Artemis workflows. PlantUML interoperability was especially relevant because it could connect Apollon more closely to existing teaching and programming-exercise workflows.

=== Standalone Navigation and Diagram Management

Feedback supported the direction of the standalone home page and routing work. Users valued a faster entry point for creating diagrams, opening existing diagrams, and distinguishing local from shared diagrams. In the additional walkthrough, the standalone home page made a positive first impression, and sorting by last modified as well as favorites were perceived as useful for returning to relevant diagrams. This supports the standalone requirements from #section-link(<req-standalone>)#h(0.25em)and the implementation described in #section-link(<impl-standalone-home>).

The home page and routing work described in #section-link(<impl-standalone-home>) moved the application toward a diagram-management workflow. The local and shared distinction was not immediately obvious in all cases, but became clearer after interaction with the interface.

Remaining feedback concerned persistence, version history, and long-term ownership. Local diagrams can be fragile when users depend on browser storage. Shared diagrams are easy to access through links, but lightweight sharing does not provide the ownership guarantees some users expect. Version history and saved snapshots were received positively because they matched expectations for returning to earlier diagram states. Future work should therefore consider optional authentication, stronger shared-diagram ownership, local file-system integration, Git-friendly workflows, and continued support for version/history-oriented diagram management.

=== Educational Integration

Feedback from Artemis developers, teaching contexts, and user sessions showed that Apollon must support more than standalone diagram creation. The editor is part of modeling exercises, quiz generation, assessment, feedback generation, and team modeling. Integration feedback therefore became a major source of follow-up requirements.

The migration and compatibility work described in #section-link(<impl-ecosystem>) addressed several reported integration problems. The resulting feedback confirms that editor changes must be validated in quiz, assessment, feedback, and team-modeling contexts rather than only in standalone editing.

Remaining feedback focused on deeper teaching workflows. Users requested review comments, better assessment-oriented collaboration, stronger PlantUML interoperability, and more complete UML notation support. Static and abstract class members, type parameters, directed relationships, and additional diagram types were mentioned as important for teaching. The additional walkthrough also identified swim lanes for activity diagrams as useful for representing different actors or responsibilities in supervision and thesis-related modeling. These requests show that Apollon's educational value depends not only on the editor interface but also on how well it supports the notations and review workflows used in courses.

=== User Interface Consistency and Maintainability

Feedback and implementation experience showed that usability problems were not limited to individual features. The editor and surrounding applications needed a more consistent interface language, while older component and styling layers made parts of the editor harder to maintain. The modernization described in Section 6.2.7 addressed the editor surface, but broader design-system work, public theming APIs, accessibility gates, and full standalone application modernization remain outside this contribution.

== Discussion

The strongest concern was edge interaction. Feedback repeatedly returned to edge straightness, anchor points, layout, and selectable areas. Participants responded positively to the edge refactor and line-jump behavior, but the qualitative process does not establish a measured reduction in interaction cost.

The feedback also shows a tension between beginner usability and power-user functionality. Apollon is used in education, so the main interface should not overload students with complex controls. At the same time, instructors, researchers, tutors, and experienced users need features such as layers, custom colors, keyboard shortcuts, local file workflows, and more complete notation support. A future design should therefore keep the main workflow simple while making advanced features discoverable through secondary controls, shortcut help, or command-based interaction.

The findings clarify the role of Apollon in the educational ecosystem. Feedback did not evaluate Apollon only as a drawing tool. It discussed teaching material, Artemis workflows, review processes, PlantUML interoperability, student supervision, presentation export, and long-term diagram ownership. This supports the thesis focus on usability and integration as connected problems rather than separate implementation areas.

== Limitations

The feedback has several limitations. It was collected during an active development project and not through a controlled experiment. The findings provide qualitative insight into relevant workflows, but they do not measure task completion time, error rates, or satisfaction scores in a statistically comparable way.

The feedback sources were heterogeneous. Some came from students and teaching contexts, some from developers integrating Apollon into Artemis, existing issues, and walkthrough sessions. This variety helped identify recurring themes, but it also means that not every finding came from the same type of user or task.

Some implemented features were still in transition during parts of the feedback period. Users sometimes saw or discussed features that were not deployed in the same state as the final thesis version. The feedback should therefore be interpreted as project feedback during development rather than as final product validation.

Automatically generated transcripts were used for some sessions. Obvious transcription errors were corrected when summarizing the findings, but direct quotations should only be used after checking the original recording or transcript. For this reason, this chapter primarily reports paraphrased findings instead of relying on long direct quotes.

== Implications for Future Work

The findings and evaluation limitations inform the prioritized future-work directions in @summary-chapter.
