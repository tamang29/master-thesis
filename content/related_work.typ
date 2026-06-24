= Related Work

This chapter reviews research on the usability of modeling tools and the cognitive effectiveness of visual notations. It separates properties of a notation from properties of the editor that manipulates the notation. This distinction matters because the thesis changes editor interactions and integrations while preserving the semantics of the supported diagram types.

The review focuses on interaction efficiency, diagram readability, and collaborative awareness. General-purpose diagram editors provide practical comparison points, while peer-reviewed studies provide the scientific basis for evaluating modeling-tool interfaces.

== Usability of Modeling Tools

Ternes, Rosenthal, and Strecker reviewed 72 publications on user interface design for modeling tools and identified graphical editing, layout, navigation, and feedback as recurring research areas @ternes2021ui. Their review shows that modeling-tool usability concerns both the notation and the interaction techniques available to create and maintain models.

Planas and Cabot observed students creating UML class diagrams with MagicDraw and Papyrus. Their study identified common modeling obstacles and examined modeling effort and editor support rather than only the resulting diagrams @planas2020uml. These findings motivate the focus of this thesis on edge manipulation, alignment, predictable editing controls, and navigation.

== Cognitive Effectiveness of Visual Notations

Green and Petre introduced cognitive dimensions as a framework for evaluating visual programming environments. Dimensions such as viscosity, visibility, error-proneness, and hard mental operations describe how an environment supports modification and comprehension @green1996cognitive. Edge reconnection and alignment guides primarily reduce resistance to local changes, while clearer crossings and labels support visibility.

Moody's Physics of Notations defines principles for cognitively effective visual notations, including perceptual discriminability, complexity management, and cognitive integration @moody2009physics. Apollon supports established educational notations rather than introducing a new notation. The relevant contribution therefore lies in preserving their visual distinctions during editing and export and in helping users navigate larger models.

== Collaborative Diagram Editors

General-purpose editors provide practical reference points for collaboration behavior. draw.io displays collaborator cursors and selections during concurrent editing.#footnote[draw.io, "Collaborate in real time using draw.io": #link("https://www.drawio.com/docs/manual/collaboration/concurrent-editing/")[www.drawio.com/docs/manual/collaboration/concurrent-editing].] Lucid provides collaborator cursors and a function for following another participant's canvas view.#footnote[Lucid, "Collaborate in Lucid": #link("https://help.lucid.co/hc/en-us/articles/13893815605268-Collaborate-in-Lucid")[help.lucid.co/hc/en-us/articles/13893815605268-Collaborate-in-Lucid].] These interaction patterns informed the workspace-awareness requirements.

Apollon differs from these general-purpose editors through its educational integration. Collaboration behavior must operate inside Artemis team modeling, while the same model supports quiz generation, assessment, and Athena feedback. The library must therefore expose awareness behavior without coupling transient session data to the persisted educational model.

== Positioning of This Thesis

The reviewed work provides methods and empirical observations for assessing visual modeling tools, but it does not cover the complete combination of editor modernization, mobile and server export, collaborative educational modeling, quiz generation, assessment, and feedback compatibility addressed in this thesis. The thesis applies established usability concerns to this integration context instead of proposing another diagram notation.

The contribution extends Apollon through reusable editor behavior and coordinated integrations. Requirements and architecture therefore emphasize interaction efficiency, compatibility, and subsystem boundaries, while Chapter 6 documents the implementation of the corresponding features.
