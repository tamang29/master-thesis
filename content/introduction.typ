= Introduction

UML models help software engineering students describe the structure and behavior of a system before or alongside its implementation. UML provides a shared visual notation for this purpose and is commonly used in software engineering education @bruegge2004object. Modeling tools can support this learning process when they make diagrams easy to create, understand, discuss, and revise @lu2023umltools.

Apollon is an educational modeling ecosystem built around the Apollon library and used through a standalone web application, a mobile/iOS application, a VS Code extension, and embedded Artemis contexts. Artemis is an interactive learning platform that supports exercises, feedback, and assessment in large courses @krusche2018artemis. In this setting, Apollon allows students to complete modeling exercises and instructors to create, assess, and reuse them. Athena and other educational services can also depend on serialized Apollon models when generating or processing feedback.

The different uses of Apollon have therefore developed into an ecosystem rather than a single application. A change to the editor can influence individual diagram creation, collaborative exercises, mobile workflows, assessment, feedback generation, and export artifacts. Improving Apollon requires attention to both modeling usability and the consistency of the integrations that depend on the same editor foundation.

== Problem

Creating a diagram should help students concentrate on modeling decisions. However, avoidable editing effort can shift attention toward arranging elements, correcting edges, navigating larger diagrams, or repeating common actions. Research on visual and UML tools shows that interaction effort and tool behavior can influence how users approach a modeling task @green1996cognitive @planas2020uml. Apollon contained several such sources of friction in diagram editing, application navigation, mobile use, and export workflows.

Collaborative modeling introduced another challenge. Participants could edit the same diagram, but they received limited collaboration awareness about who else was active, where collaborators were working, and which elements they selected or dragged. This made it harder to coordinate work and understand changes during standalone shared modeling and Artemis team modeling sessions.

Users also encountered different capabilities depending on whether they worked in the standalone web application, mobile/iOS application, VS Code extension, or Artemis. At the same time, educational systems had to continue processing diagrams created with earlier Apollon versions. The coexistence of legacy and reengineered editor behavior increased maintenance effort and made improvements harder to provide consistently. Existing exercises, serialized Apollon models, assessment processes, Athena feedback workflows, and visual exports still had to remain compatible.

== Motivation

A modeling tool for education should keep the mechanics of editing secondary to the concepts being learned. Clearer interactions, alignment support, predictable navigation, and dependable export workflows can reduce interruptions during diagram creation. Mobile/iOS support further allows students to work with diagrams in settings where a desktop computer is unavailable or inconvenient.

Collaborative awareness can make shared modeling easier to follow. Showing collaborator names, cursor positions, selected elements, and followed viewports helps participants coordinate within the diagram instead of relying entirely on external communication. Providing this behavior through the reusable editor also makes it available to both the standalone application and Artemis.

A common Apollon foundation can improve consistency across the ecosystem. The standalone web application, mobile/iOS application, VS Code extension, and Artemis can reuse the same editor behavior while retaining their specific workflows. Athena benefits from the same model foundation by continuing to process supported serialized Apollon models for feedback generation. This approach supports the transition away from legacy editor behavior without abandoning existing exercises, model-version compatibility, assessment processes, feedback services, or visual exports.

== Objectives

The objective of this thesis is to improve the usability and integration of Apollon across individual, collaborative, mobile, and educational settings. The requirements were refined iteratively as implementation and integration work revealed additional needs. The thesis addresses four objectives.

+ *Improve modeling and application usability.* Simplify diagram editing, navigation, mobile use, and export workflows.
+ *Support collaborative modeling.* Make collaborator activity visible in shared modeling sessions and provide reusable collaboration awareness for standalone shared modeling and Artemis team modeling.
+ *Enhance Apollon for educational systems.* Improve the maintained editor while preserving modeling exercises, quiz-related workflows, assessment, feedback generation, and existing diagram formats.
+ *Improve diagram portability.* Produce dependable visual representations and export artifacts across the environments in which Apollon is used.

Together, these objectives address the user-facing experience and the systems needed to provide it consistently. The detailed requirements are presented in Chapter 4, while Chapter 6 describes how the individual improvements were implemented.

== Outline

Chapter 2, Background, introduces Apollon, Artemis, and Athena. Chapter 3, Related Work, covers modeling-tool usability, collaborative diagram editors, workspace awareness, and the positioning of this thesis. Chapter 4, Requirements, presents the existing and proposed system, functional requirements, non-functional requirements, constraints, and system models. Chapter 5, Architecture, describes the architecture and its subsystem boundaries.

Chapter 6, Implementation, documents the implementation according to the four objectives and relates each contribution to its requirement. Chapter 7, User Feedback and Findings, presents feedback, findings, and remaining limitations. Chapter 8, Summary, summarizes the work and identifies remaining directions for the Apollon ecosystem.
