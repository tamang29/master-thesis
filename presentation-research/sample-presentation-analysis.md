# Sample thesis presentation analysis

## Method

The sample folder was reviewed in three passes:

1. Extracted text and metadata from every PDF to identify page count, slide order, section wording, repeated slides, and formal model types.
2. Rendered every page of every remaining PDF to a contact sheet and visually inspected the full deck, including progressive reveals and appendices.
3. Compared the three master's presentations separately and then checked the pattern against the bachelor presentations.

One 79-page portrait PDF named `MA-Thesis-Ostertag_vPresentation.pdf` was verified to be the thesis itself and removed. The remaining corpus contains 18 PDF files representing 17 unique presentations because the two Marcos Oliva files are byte-identical duplicates. Every remaining deck uses a 16:9 slide format.

## Corpus overview

| Presentation | Degree | PDF pages | Dominant organization and diagrams |
| --- | --- | ---: | --- |
| Fangxing Liu | Bachelor | 23 | Two user stories; problem, motivation, objectives, use case, two demos, subsystem and data-flow sequence, status, future work |
| Jakub Jakubczyk | Bachelor | 16 | Problem, objectives, gap analysis, progressively expanded subsystem decomposition, state/lifecycle model, demo, evaluation, status and future work |
| Catherine Kalra | Bachelor | 21 | Problem, motivation, objectives, dynamic model, analysis object model, progressively expanded subsystem decomposition, demo, realized/open goals, future work, appendix |
| Pao Xin Tan | Bachelor | 12 | Context, motivation, gaps, objectives, use case, demo, subsystem decomposition, activity diagram, status, future work |
| Youssef El Toukhi | Bachelor | 15 | Numerical context, problem, motivation, objectives, use case, pipeline, demo, subsystem decomposition, status, future work |
| Marcos Oliva | Bachelor | 12 | Problem, use case, demo, subsystem decomposition, pipeline, results, future work; duplicate file present |
| Johannes Pahle | Bachelor | 13 | Problem, motivation, requirements, demo, hardware/software mapping, dataflow, status, future work, appendix |
| Senan Aslan | Bachelor | 13 | Problem, motivation, objectives, use case, demo, subsystem decomposition, status, future work, activity-model appendix |
| Vivien Finley | Bachelor | 38 | Problem, motivation, objectives, progressively expanded use case and analysis object model, demo, long subsystem build, status, future work, appendix |
| Jonathan Ostertag | Master | 33 | Main story through slide 20, then 13 appendix/acknowledgement slides; problem, motivation, objectives repeated before sections, architecture, demo, realized/open status, future work |
| Lukas Ederer | Master | 60 exported PDF pages, 33 numbered slides | Many progressive builds; problem, motivation, objectives, concept, analysis object model, live demo, dynamic model, long subsystem dataflow build, testing, realized/open status, future work |
| Nikolas Hack | Bachelor | 31 | Intro, problem, motivation, objectives repeated at transitions, architecture evolution, workflow, demo, evaluation charts, status, future work, appendix |
| Mats Brinke | Bachelor | 17 | Problem, motivation, research question/objectives, requirements, physical redesign, activity diagram, pilot, results, limitations, conclusion, future work |
| Shudong Cai | Unstated on title slide | 25 | Problem, motivation, objectives, use case, activity diagram, architecture, two demos, results, status, future work, large appendix |
| Nayer Kotry | Master | 14 | Three-slide problem story, motivation, objective, use case, demo, two system-decomposition/dataflow slides, status, future work, closing |
| Celine Lahnor | Bachelor | 18 | Problem journey, motivation, objectives, dynamic model, analysis object model, demo, architecture build, realized/open goals, future work, sources |
| Maia Filip | Bachelor | 15 | Problem and multi-slide motivation reveal, objectives, use case, demo, subsystem decomposition, status, future work |

## Master's presentation pattern

### Nayer Kotry - compact pattern

- 14 slides with no appendix.
- Three slides tell one concrete problem story before the objective slide.
- One use-case model and two subsystem/dataflow views.
- Demo appears immediately after the use case.
- Status reuses the same three objective cards.
- Future work and a simple closing finish the deck.

### Jonathan Ostertag - balanced pattern

- 20-slide main presentation followed by 13 appendix/acknowledgement slides.
- Context, problem, motivation, objectives.
- The objective slide returns before each implementation section with the current objective highlighted.
- One architecture/dataflow section, then live demo.
- Separate realized-goals and open-goals slides.
- Future work, questions, then analysis object and activity models in the appendix.

### Lukas Ederer - heavily staged pattern

- 60 exported PDF pages but 33 numbered PowerPoint slides because demo and architecture slides use many progressive builds.
- Context, problem, motivation, objectives, concept, analysis object model.
- A long live-demo sequence is mirrored by static build pages.
- A dynamic model and a long subsystem-decomposition build explain system behavior.
- Evaluation/test phases receive several slides.
- Realized goals, open goals, future work, and questions close the deck.

### Size implication for this thesis

The three master's examples span 14, 20, and 33 numbered main slides, with a median of 20. For a 15-minute talk including a live demo, approximately 18 to 20 main slides is consistent with the samples when many slides are visual and brief. Technical depth should move to an appendix rather than into dense main slides.

## Repeated structural pattern across the corpus

Among the 17 unique presentations:

- 16 contain an explicit objective, goal, requirement, or research-question slide.
- 16 contain an explicit live demo slide.
- Every deck contains at least one formal model, architecture diagram, workflow, or equivalent system visual.
- 14 visibly reuse the objective/requirement representation in the status section.
- Every deck closes with status/results/conclusion, future work, and a question or thank-you slide.
- About half include an appendix or additional-material section.

The most common order is:

1. Title.
2. Context or starting point.
3. Problem.
4. Motivation.
5. Objectives or requirements.
6. One domain or use-case model.
7. Live demo.
8. Architecture or subsystem decomposition.
9. Optional evaluation/results.
10. Status using the objective wording again.
11. Future work.
12. Questions.
13. Appendix when needed.

An agenda slide is uncommon. The deck is organized as a narrative instead.

### Live-demo placement

After removing the non-presentation thesis PDF and the byte-identical Marcos Oliva duplicate, 16 of the 17 unique decks contain an explicit demo. The first demo appears at a median relative position of 0.56 through the main story. Eleven of the 16 demos start in the middle band of the presentation, between 40 and 65 percent of the main slide sequence; two start earlier and three start later.

The master's decks use the same basic logic with different amounts of technical staging:

- Nayer Kotry places the demo on slide 8 of 14, after the objective and use-case model and before subsystem decomposition.
- Jonathan Ostertag places the demo late, on slide 16 of the 20-slide main story, after the architecture section.
- Lukas Ederer places the demo around the middle, then continues with dynamic and subsystem models.

For the Apollon thesis, the most representative choice is therefore a midpoint demo: introduce the problem, objectives, use case, and collaboration experience first; demonstrate the current product; then explain the Artemis integration and technical results. In a 20-slide main story, slide 9 is the target.

## Diagram patterns

The samples favor two or three different formal model types rather than several similar diagrams:

- Use-case models establish actors and scope.
- Analysis object models establish domain structure.
- Activity or dynamic models explain a workflow over time.
- Subsystem or component diagrams explain software ownership and dependencies.
- Hardware/software mappings or deployment diagrams explain execution nodes.

Common presentation practice:

- A diagram receives most of the slide, usually about 70 to 85 percent of the usable area.
- The slide title states the diagram type or its takeaway; supporting prose is minimal.
- Existing, modified, and new elements are distinguished with a small consistent legend.
- Complex architecture diagrams are shown in repeated builds with one path or component highlighted at a time.
- The same full diagram is reused across builds; it is not shrunk beside paragraphs.

The contact sheets also show a consistent staging rule that should be applied mechanically in the Apollon deck:

- Every formal UML model occupies one centered, full-width diagram stage directly below the title.
- Dense UML models do not share the slide with a side column of prose.
- The model keeps its original aspect ratio and is centered inside the stage; unused white space is preferable to stretching.
- Legends remain inside or immediately adjacent to the diagram stage.
- Repeated architecture builds keep every element at the same coordinates and only change emphasis.
- One short takeaway may sit below the stage, but explanatory detail belongs in the spoken narrative or appendix.

For this round, dataflow animation is intentionally deferred. The architecture visual should remain editable where possible and must never be stretched. In the current deck, the editable standalone diagram is translated only; its exported width and height are unchanged. Animation can be added manually later using the same element groups.

## Wording pattern

The stronger recent decks combine small uppercase section labels with natural takeaway titles. Examples of the pattern include:

- "Why doesn't this happen naturally?"
- "Why solving this matters"
- "Three objectives - one thesis"
- "What did we achieve?"
- "What stayed open?"
- "An applicant's journey"
- "From passive forwarder to active coordinator"

The wording is short, direct, and intended to be spoken. Objectives use verbs such as improve, implement, integrate, design, assess, expose, and preserve. Status slides repeat the same verbs and nouns instead of inventing new labels.

Recommended wording rules for the Apollon deck:

- Say "Artemis" instead of the vague phrase "educational systems."
- Name concrete user actions: bend, reconnect, follow, export, create, assess.
- Keep one claim per slide.
- Avoid catalogue-like lists of every pull request.
- Put implementation detail in speaker notes or appendix.
- Reuse the exact objective text in status.

## Visual pattern

- White background with TUM blue title and logo at the top right.
- Sparse footer with author/topic and slide number.
- Dark-blue full-slide separators are common for live demo, questions, and appendix.
- Three-column card layouts are common for problem, motivation, objectives, status, and future work.
- Formal diagrams use white space and large scale rather than surrounding panels.
- Main slides usually carry one large diagram, one illustration, or a small number of evidence screenshots.
- The strongest decks keep color semantic: blue for the main system, green for realized results, orange for changed/partial/open items.

## Patterns to adopt

- Three-slide introduction: ecosystem context, concrete problem, motivation.
- A verb-led objective slide early in the deck.
- The exact same objective wording and ordering on the status slide.
- A live demo around the midpoint, specifically after collaboration and before the Artemis architecture section.
- Explicit Artemis, Athena, mobile/iOS, and VS Code coverage.
- A large architecture slide with correct aspect ratio.
- One fixed, centered stage for every UML diagram, with identical title and footer alignment across slides.
- Different diagram types in the main deck and appendix.
- Realized status, evidence limitations, and future work as separate beats.
- A technical appendix for requirements, analysis model, collaboration communication, deployment, contribution chronology, and the full use-case model.

## Patterns to avoid

- Calling the work a generic improvement for "educational systems."
- Hiding mobile/iOS or VS Code in speaker notes only.
- Using the outdated standalone home-page screenshot.
- Stretching exported diagrams to fill a widescreen frame.
- Placing a dense architecture diagram next to long prose.
- Showing several nearly identical diagram types without a reason.
- Claiming a controlled usability improvement when the thesis only provides qualitative formative evidence.
