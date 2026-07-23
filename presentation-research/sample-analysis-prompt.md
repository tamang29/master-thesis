# Prompt — Deep pattern & diagram analysis of TUM thesis sample presentations

> Paste everything below into Claude (or another capable agent with file, shell, and
> PDF-rendering access). It is self-contained. Its job is to replace impression with
> evidence: produce a **quantitative, per-slide, per-diagram** analysis of the sample
> presentations, then turn that into a concrete build recipe for the Apollon thesis deck —
> with special attention to using **as many Apollon-native diagrams as the story naturally
> supports, and no more.**

---

## Role and goal

You are analyzing a corpus of real TUM chair-of-Applied-Software-Engineering thesis
presentations to extract every repeatable pattern that governs how a strong deck is built:
structure, slide budget, section order, objective/status treatment, demo placement, wording,
visual system, and — most important for this task — **which diagram types appear, how often,
where, and at what size.**

The output feeds one specific deliverable: the Master's presentation for the thesis
*"Enhance Usability of the Educational Modeling Software Apollon."* Because the thesis subject
*is* a UML modeling tool (Apollon), diagrams built in Apollon are both evidence and dogfooding.
So the analysis must end with a concrete plan for **maximizing Apollon-native diagrams without
forcing them** — every proposed diagram must earn its place by carrying information the
audience needs, not by existing to raise a diagram count.

Do not flatter the corpus or the existing deck. Where the evidence is thin or mixed, say so.
Cite slide numbers and file names for every non-trivial claim. Never invent a slide you did
not actually render and read.

## Inputs (verify these exist before starting)

- Sample decks: `C:\Dev\master-thesis\.vscode\SamplePresentations\` — **18 PDF files = 17 unique
  presentations** (`BA Thesis Presentation Marcos Oliva.pdf` and `... Marcos Oliva (1).pdf` are
  byte-identical duplicates; count once). The non-presentation thesis PDF has already been
  removed. Confirm the count and the duplicate by hashing before analyzing.
- Master's decks in the corpus (analyze these as a separate, higher-weight group):
  `MA-Presentation-Ostertag.pdf`, `MA_Thesis_Presentation_Ederer.pdf`,
  `Thesis Presentation - MA Nayer Kotry.pdf`. Treat any deck whose title slide says
  "Master" the same way; treat the rest as Bachelor context.
- Prior (impressionistic) analysis to supersede and fact-check, **not** to trust blindly:
  `C:\Dev\master-thesis\presentation-research\sample-presentation-analysis.md`
- Thesis facts (source of truth for the Apollon deck): `presentation-research/thesis-facts.md`
- Current deck under suspicion: `outputs/Enhance_Usability_Apollon_Thesis_Presentation_v3.pptx`
- Apollon diagram sources already made: `presentation-research/diagrams/*.json` and
  thesis figures in `figures/*.json`.
- Authoritative list of **Apollon-supported diagram types**: do not guess. Fetch it from the
  Apollon repo (`C:\Dev\Apollon`) and/or the docs at https://ls1intum.github.io/Apollon/ and
  the live app https://apollon.aet.cit.tum.de/. Record the exact enum of supported types and
  cite where you got it. This is the mapping target for the diagram census.

## Method — do this in order, mechanically

### Pass 0 — Corpus integrity
Hash every PDF (`sha256`), confirm 18 files / 17 unique, confirm the Marcos duplicate, list
page counts. Tag each deck Master / Bachelor / unstated.

### Pass 1 — Text + metadata sweep
Extract text per page from every deck. Record page count, and a first draft of section
sequence from headings/titles. Flag decks that are heavily image-based (little extractable
text) for extra care in Pass 2.

### Pass 2 — Visual, per-slide read (the core pass)
Render every page of every deck to images (≈110–150 DPI) and actually look at each one. For
**each deck**, produce a slide-by-slide table with one row per slide:

| slide # | section label | takeaway title | slide kind | diagram/visual on slide | diagram type | Apollon-mappable? | notes |

Where:
- **slide kind** ∈ {title, agenda, context, problem, motivation, objectives/requirements/RQ,
  domain/use-case, architecture/subsystem, dynamic/workflow, data model, deployment/hardware,
  demo, evaluation/results, status, future work, questions/thanks, appendix-divider,
  appendix-content, acknowledgements, other}.
- **diagram/visual** ∈ {none, formal UML/model, custom architecture graphic, flow/pipeline,
  chart/plot, table, screenshot, photo, code, icon-array, other}. Distinguish a *formal model*
  (a real UML/BPMN/Petri/etc. diagram) from a *hand-drawn boxes-and-arrows architecture graphic*
  — this distinction is the crux of the whole analysis.
- **diagram type**: the specific type if formal (e.g. use-case, class, component, activity,
  communication, deployment, state machine, object, BPMN, Petri net, flowchart, sequence…).
- **Apollon-mappable?**: yes/no/partial — could this exact diagram be authored in Apollon given
  the supported-type list from Pass 0? Note the mapping (e.g. "sequence → not native; closest is
  Apollon communication diagram").
- Mark progressive-build sequences (same diagram re-shown with changed emphasis) so builds are
  not double-counted as distinct diagrams.

### Pass 3 — Quantify (turn the tables into numbers)
Compute and present, with Master-vs-Bachelor broken out wherever the n allows:
1. **Slide budget** — distribution of main-story slide counts (min/median/max), and appendix
   sizes. Explicitly state a recommended main-slide target for a 15-minute Master's talk.
2. **Section presence rates** — % of decks with an explicit objectives slide, a demo, a status
   slide that reuses objective wording, an appendix, an agenda, a separate "realized vs open"
   split, a limitations beat.
3. **Canonical section order** — the modal ordering, plus notable deviations.
4. **Demo placement** — relative position (demo slide ÷ main-story length) for every deck;
   report median and the interquartile band; call out the three Master decks individually.
5. **Diagram census** — the headline table for this task:
   - total formal diagrams per deck (min/median/max);
   - frequency of each diagram *type* across the corpus (how many decks use a use-case model,
     how many an activity model, etc.);
   - ratio of formal-model slides to total main slides;
   - how many distinct diagram *types* a typical deck uses (the corpus tends toward a small
     number of *different* types rather than many similar ones — verify or refute this);
   - share of diagrams that are Apollon-mappable vs not.
6. **Diagram sizing** — sample the fraction of usable slide area a formal diagram occupies;
   confirm/refute the "70–85%, full-width, no prose column" staging rule with measured examples.
7. **Visual system** — title placement, TUM logo usage, footer contents, dark-separator usage
   for demo/questions/appendix, card-layout usage, and any consistent color semantics
   (e.g. blue = system, green = done, orange = changed/open). Report how consistent this is.

### Pass 4 — Apollon-native diagram plan (the value-add)
Using the supported-type list and the census, build a plan specifically for the Apollon thesis:
1. List the diagram *types* the corpus rewards (from Pass 3.5) that are **also Apollon-native**.
2. For each stage of the Apollon story (context, scope, problem, collaboration, Artemis
   integration, data/awareness model, deployment, editing flow), propose the single best
   diagram, name its **exact Apollon type**, and state what information only that diagram
   conveys. Prefer variety of *type* over repetition.
3. Apply an explicit **anti-forcing test** to every proposed diagram — keep it only if it passes
   all four: (a) it carries information the audience needs to follow the talk; (b) a committee
   member would expect or benefit from it; (c) it is a *different* type from its neighbors, or a
   justified progressive build of the same one; (d) removing it would leave a real gap. Diagrams
   that fail become appendix/backup or are cut. Record the verdict per diagram.
4. Note where a corpus-common diagram is **not** Apollon-native (e.g. sequence diagrams, Gantt
   timelines, quantitative charts) and give the honest choice: nearest Apollon equivalent, or
   accept a non-Apollon visual because forcing it into Apollon would distort it.
5. Confirm every proposed diagram can be produced as an Apollon JSON source and exported
   (PPTX/SVG) so it stays editable and on-brand; flag any that cannot.

### Pass 5 — Gap analysis of the current deck
Open `Enhance_Usability_Apollon_Thesis_Presentation_v3.pptx`, render it, and compare it slide
-by-slide against the extracted patterns and the Pass 4 plan. Produce a table of divergences:
what the corpus/plan implies, what v3 does, severity (blocker / worth-fixing / cosmetic), and a
concrete recommended change. This is where "something feels off" must be turned into named,
checkable items. Be specific about diagram choices: is v3 using the *right variety* of Apollon
diagram types, or leaning on the same 1–2 shapes? Is any diagram present only to pad the count?
Is any high-value Apollon diagram type the corpus loves (e.g. use-case, activity, component,
deployment, communication, object/analysis) missing or buried in the appendix?

## Hard constraints (do not violate)

- The final thesis is read-only truth. Do not contradict `thesis-facts.md` or the thesis; if a
  pattern would push the deck to overstate (e.g. quantified usability gains — the evaluation is
  qualitative/formative), reject it.
- Keep the fixed content rules of this project intact: Artemis is the dominant integration
  (VS Code second, Athena brief); the standalone conversion service is an internal component,
  never a peer system; TUM wordmark only, no Apollon "A" logo as slide branding; current
  landscape app imagery only; mobile/iOS and VS Code stay visible.
- Every recommendation must cite evidence (deck name + slide number, or a computed statistic).
  Separate **observed pattern** from **recommendation** clearly.
- Prefer honest "the corpus doesn't settle this" over a manufactured rule.

## Deliverables (write these files)

1. `presentation-research/sample-analysis-v2.md` — the full write-up: corpus table, all Pass-3
   statistics, the diagram census tables, the Apollon-native diagram plan (Pass 4), and the
   Pass-5 gap analysis. Lead with a one-page executive summary of the 8–12 highest-confidence
   rules and the ranked list of what to change in v3.
2. `presentation-research/sample-slide-index.csv` — the per-slide rows from Pass 2 for all decks
   (one CSV, columns as in Pass 2) so the raw evidence is inspectable and re-sortable.
3. `presentation-research/apollon-diagram-plan.md` — just the Pass-4 plan as a standalone
   checklist: stage → Apollon diagram type → purpose → anti-forcing verdict → JSON source status.

State your confidence level for each headline rule (high/medium/low) based on how consistently
the corpus supports it. Finish by listing the specific v3 changes you'd make first, in priority
order.
