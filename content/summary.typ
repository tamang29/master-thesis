= Summary <summary-chapter>

== Conclusion

This thesis strengthened Apollon as a reusable educational modeling ecosystem. The work coordinated changes across the Apollon library, standalone and mobile applications, Artemis, Athena, and the VS Code extension to address the four objectives defined in Chapter 1.

=== Realized Objectives

The first objective was to improve modeling and application usability. This was addressed through changes that reduced repeated editing effort and made common workflows easier to finish. Edge bending, waypoint dragging, reconnection, dynamic handles, line jumps, and label readability fixes improved direct manipulation and visual clarity for relationships between diagram elements. Alignment guides, keyboard deletion, class member reordering, scroll lock, and editor-side user interface cleanup addressed smaller sources of friction that accumulate during repeated modeling. The standalone home page and routing work gave users clearer paths for creating, reopening, and sharing local and shared diagrams, while mobile/iOS export support made diagram export less dependent on desktop browser assumptions.

The second objective was to support collaborative modeling. The thesis introduced highlighted elements selected or dragged by collaborators, live cursors with participant names, and viewport following so that collaborators can better understand where others are working during a shared session. These awareness features were moved into the Apollon library after their standalone use, which allowed reuse in both standalone shared modeling and Artemis team modeling. The implementation also preserved an important boundary: cursors, participant identity, selections, and followed viewports are transient collaboration state, while the persisted diagram model remains focused on the diagram itself.

The third objective was to integrate Apollon into educational systems. The work migrated Artemis to the maintained Apollon integration while preserving modeling exercises, quiz-related editor interactions, assessment views, and team modeling. Drag-and-drop quiz generation was repaired for the maintained model format, nested selections were supported, and assessment compatibility was strengthened where serialization changes affected grading behavior. Athena gained support for the earlier and current serialized models needed during the migration period, and the VS Code extension moved to the maintained renderer.

The fourth objective was to improve diagram portability. The thesis provided a server-side PDF export path, improved SVG compatibility, and addressed rendering issues involving text bounds, clipping, labels, and diagram-specific shapes. Visual checks make rendering regressions easier to detect. These results improve the export paths used by the ecosystem without claiming universal interoperability.

Together, the results show that usability and integration are connected: an editor feature becomes more valuable when it can be reused consistently across the environments in which students, instructors, assessors, and standalone users work. The architectural separation between shared editor behavior and host-owned workflows enabled that reuse while preserving existing educational and feedback processes. Qualitative feedback indicates that the implemented direction addresses relevant workflows, but it does not replace a controlled usability study or imply that all usability problems are solved.

== Future Work

The highest-priority direction is editor usability and notation support. Edge and layout refinement should focus on snapping, manual label placement, selectable areas, space-efficient routing, and clearer visual affordances. Shortcut and selection refinements should reduce repeated editing effort. Broader UML support, swim lanes, multiline text, stereotypes, and customization should be introduced without making the primary student workflow harder to learn.

Collaboration, persistence, ownership, and review workflows form a second direction. Persistent shared diagrams, optional login, stronger ownership semantics, simplified sharing modes, review comments, and assessment-oriented collaboration would support supervision and long-term teaching work. These features should preserve the boundary between reusable library behavior and host-specific transport, persistence, and access control.

Educational and development integration should also continue. Artemis can benefit from deeper review and assessment support, while Athena must retain compatibility with the serialized models used by feedback workflows. PlantUML exchange, Git-friendly workflows, local file-system integration, and VS Code extension continuity would connect Apollon more closely to teaching and development practices.

Finally, export and portability should distinguish editable model exchange from visual formats such as SVG, PNG, PDF, and presentations. Deterministic rendering, text bounds, clipping behavior, and compatibility with external tools remain areas for continued hardening.
