= Background

This chapter introduces the systems and terms used throughout the thesis: Apollon, Artemis, and Athena. It provides background for understanding the later discussion of related work, requirements, architecture, and implementation, while the detailed design and implementation decisions are deferred to the following chapters.

== Apollon

Apollon is an open-source UML and modeling editor for the web.#footnote[Apollon documentation: #link("https://ls1intum.github.io/Apollon/")[ls1intum.github.io/Apollon].] It is designed for creating software-engineering diagrams in educational and development contexts, and it supports thirteen UML and modeling diagram types. The supported diagram range is relevant because later chapters discuss Apollon as a general editor foundation rather than as a tool for one specific notation. A diagram produced in Apollon can therefore appear in different teaching and integration settings while still representing the same underlying modeling content.

Apollon can be used in several forms. The Apollon library provides the reusable editor that can be embedded into host applications. The standalone web application offers direct browser-based diagram creation and management. The ecosystem also includes a mobile/iOS application, a VS Code extension, and documentation. Across these forms, Apollon supports export to SVG, PNG, PDF, PPTX, and JSON, and it supports real-time collaboration.

The distinction between standalone and embedded use is important for the rest of the thesis. In standalone use, Apollon behaves as an application for opening, editing, sharing, and exporting diagrams directly. In embedded use, a host configures the Apollon library for its own workflow without adopting the standalone application's navigation, persistence, or user interface. The host decides which mode is active, how diagrams are loaded and stored, which callbacks are connected, and how editor events are interpreted in the surrounding application. Artemis is the main embedded host system discussed in this thesis.

This background also explains why migration and compatibility appear later. Apollon is not only a visual editor surface; it is a shared component used by several applications and services. Stored diagrams, exports, assessment data, and serialized Apollon models can outlive a particular editor version. Therefore, replacing older editor integrations with a maintained Apollon version requires attention to host workflows and model-version compatibility. The following chapters treat these concerns as requirements and architecture constraints, not as separate products or implementation histories.

== Artemis

Artemis is an interactive learning platform with individual feedback. It was introduced as an automatic assessment management system for interactive learning and is used in programming and software-engineering education @krusche2018artemis. In this context, exercises are the central teaching objects. Students work on exercises and create submissions, while instructors configure the exercise settings and assessors evaluate results when manual assessment is required. These roles define the surrounding workflow in which Apollon diagrams are created, submitted, reviewed, and reused.

The concepts needed in this thesis are Artemis exercises, submissions, modeling exercises, quiz-related editor interactions, assessment views, and team modeling. Artemis supports programming exercises, quizzes, modeling tasks, and other exercise types, and it combines automatic and manual assessment.#footnote[Artemis project repository: #link("https://github.com/ls1intum/Artemis")[github.com/ls1intum/Artemis].] Feedback and points can be shown close to the assessed exercise or model content, which makes the connection between a submission and its evaluation visible to students and assessors. Artemis also supports team exercises with real-time collaboration, so a modeling task can involve several students working together rather than a single student working in one editor session.

Apollon is relevant to Artemis because Artemis can embed the editor for modeling exercises. In such workflows, students create or edit diagrams as part of an exercise, instructors prepare diagram-based tasks, and assessors inspect submitted diagrams. Artemis remains responsible for courses, users, permissions, exercises, submissions, assessment records, and persistence. Apollon provides the diagram editor and model interaction inside those educational workflows.

Diagram content is relevant beyond ordinary modeling submissions because it can be used in quiz preparation, assessment, and feedback workflows. Artemis also connects to downstream assessment support. The thesis therefore treats Artemis as the educational integration environment around Apollon, while detailed migration, quiz-generation, and assessment behavior remains in the requirements, architecture, and implementation chapters.

== Athena

Athena supports semi-automated assessment of exercises.#footnote[Athena documentation: #link("https://ls1intum.github.io/Athena/")[ls1intum.github.io/Athena].] In the workflows relevant to this thesis, it consumes serialized Apollon models as input for feedback generation rather than embedding or hosting the editor.

During the Artemis migration, these feedback workflows required compatibility with the earlier and current serialized model formats used in the migration period. This was a focused parser and playground compatibility concern rather than a separate editor integration.
