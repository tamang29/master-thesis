= Introduction

Graphical models help software engineering students describe the structure and behavior of a system before or alongside its implementation. UML provides a shared visual notation for this purpose and is commonly used in software engineering education @bruegge2004object. Modeling tools can support this learning process when they make diagrams easy to create, understand, discuss, and revise @lu2023umltools.

Apollon is an educational modeling tool used as a standalone web application, a mobile application, a VS Code extension, and an editor embedded in other systems. One of its main integrations is Artemis, an interactive learning platform that supports exercises, feedback, and assessment in large courses @krusche2018artemis. In Artemis, Apollon allows students to complete modeling exercises and instructors to create and assess them.

The different uses of Apollon have developed into an ecosystem rather than a single application. A change to the editor can influence individual diagram creation, collaborative exercises, mobile workflows, assessment, feedback generation, and exported files. Improving Apollon therefore requires attention to both the user experience and the consistency of the systems that depend on it.

== Problem

Creating a diagram should help students concentrate on modeling decisions. However, avoidable editing effort can shift attention toward arranging elements, correcting connections, or repeating common actions. Research on visual and UML tools shows that interaction effort and tool behavior can influence how users approach a modeling task @green1996cognitive @planas2020uml. Apollon contained several such sources of friction in diagram editing and application navigation.

Collaborative modeling introduced another challenge. Participants could edit the same diagram, but they received limited information about the presence, focus, and selections of other collaborators. This made it harder to coordinate work and understand changes during a shared session, particularly in team modeling exercises.

Users also encountered different capabilities depending on whether they worked in the web application, on iOS, in VS Code, or within Artemis. At the same time, educational systems had to continue processing diagrams created with earlier Apollon versions. The coexistence of legacy and reengineered components increased maintenance effort and made improvements harder to provide consistently.

== Motivation

A modeling tool for education should keep the mechanics of editing secondary to the concepts being learned. Clearer interactions, alignment support, predictable navigation, and dependable export workflows can reduce interruptions during diagram creation. Mobile support further allows students to work with diagrams in settings where a desktop computer is unavailable or inconvenient.

Collaborative awareness can make shared modeling easier to follow. Showing who is present, where collaborators are working, and what they have selected helps participants coordinate within the diagram instead of relying entirely on external communication. Providing this behavior through the reusable editor also makes it available to both the standalone application and Artemis.

A common Apollon foundation can improve consistency across the ecosystem. Applications and educational integrations can reuse the same editor behavior while retaining their specific workflows. This approach supports the transition away from the legacy editor without abandoning existing exercises, diagrams, assessment processes, or feedback services.

== Objectives

The objective of this thesis is to improve the usability and integration of Apollon across individual, collaborative, mobile, and educational settings. The requirements were refined iteratively as implementation and integration work revealed additional needs. The thesis addresses four objectives.

+ *Improve modeling and application usability.* Simplify diagram editing, navigation, mobile use, and export workflows.
+ *Support collaborative modeling.* Make collaborator activity visible and provide the same awareness features in the standalone application and Artemis.
+ *Integrate Apollon into educational systems.* Introduce the maintained editor while preserving modeling exercises, quizzes, assessment, feedback, and existing diagram formats.
+ *Improve diagram portability.* Produce dependable visual representations of diagrams across the environments in which Apollon is used.

Together, these objectives address the user-facing experience and the systems needed to provide it consistently. The detailed requirements are presented in Chapter 4, while Chapter 6 describes how the individual improvements were implemented.

== Outline

Chapter 2 introduces Apollon and Artemis. Chapter 3 reviews research on modeling-tool usability, visual notation, and collaborative diagram editors. Chapter 4 presents the existing and proposed system, functional requirements, quality attributes, constraints, and system models. Chapter 5 describes the architecture and its subsystem boundaries.

Chapter 6 documents the implementation according to the four objectives and relates each contribution to its requirement. Chapter 7 defines the evaluation and reports its findings and limitations. Chapter 8 summarizes the work and identifies remaining directions for the Apollon ecosystem.
