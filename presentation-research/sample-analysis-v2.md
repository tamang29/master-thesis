# Sample presentation analysis v2 — quantitative, per-slide, per-diagram

Supersedes `sample-presentation-analysis.md`. Every claim below cites a deck + slide (PDF page) or a computed statistic. Raw per-slide evidence: `sample-slide-index.csv` (376 rows, one per PDF page of all 17 unique decks). Method: sha256 corpus check → per-page text extraction → full visual read of every rendered page → census → plan → v3 gap analysis.

---

## Executive summary — the rules, ranked by confidence

1. **Canonical spine, no agenda** (HIGH). Title → Problem → Motivation → Objectives → formal models → Demo → Status → Future Work → Thanks. 0/17 decks have an agenda slide (Liu's "Overview" p2 is a persona map, not an agenda). 15/17 have an explicit motivation beat between problem and objectives (missing only in Marcos Oliva, Jakubczyk).
2. **Status reuses objective wording verbatim** (HIGH). 16/17 decks re-show the objective cards/wording with per-objective verdicts (all except Marcos Oliva, which shows before/after results instead). Kotry p12 adds Realized/Partial/Deferred badges; Aslan p9 marks one objective red/open.
3. **Formal diagrams are staged full-width with no prose column** (HIGH). Measured content-band occupancy: Kotry p9 component 96%×100%, Finley p33 component 97%, Ederer p7 class 94%, Ostertag p12 use-case 95%×92%, Lahnor p8 91%, Aslan p6 91%, Tan p6 92%, Ostertag p14 82%. Range 82–97% width — the "70–85%" prior understated it; call it **80–95% width, diagram ink fills the band**.
4. **A typical deck uses 2–3 distinct formal diagram types, not many** (HIGH). Distribution of distinct types per deck: 1 type ×2 decks, 2 types ×7, 3 types ×6, 4 types ×2. Median 2, mode 2–3. Variety comes from *different* types per section, not repetition of one shape.
5. **Component/subsystem decomposition is near-universal** (HIGH): 15/17 decks (all except Pahle, who uses deployment instead, and Brinke's non-software thesis). Use-case model: 10/17. Activity model: 9/17. Class/AOM: 5/17. Deployment: 2/17. State machine: 1/17. Flowchart: 1/17. **Sequence and communication diagrams: 0/17.**
6. **Progressive builds are the standard way to show a dense diagram** (HIGH). 11/17 decks build at least one diagram across frames; both large Master decks are extreme: Ederer's component decomposition has 21 PDF frames for one slide (p30–50), Ostertag's appendix activity model has 10 (p23–32), Finley builds all three of her models (use case ×6, AOM ×6, component ×13 frames).
7. **Existing/modified/new color legends on models** (HIGH). ≥10/17 decks annotate formal diagrams with a change-status legend (Ostertag p7/p12, Finley p13/p20/p33, Aslan p6, Tan p8, Youssef p10, Marcos p8, Hack p12–16, Kotry p7, Liu p10, Lahnor p8 "Extended Modules"). Exact colors vary (green=new in Tan/Aslan/Finley/Ostertag/Hack; blue=new in Kotry; the corpus does **not** settle a single palette) — what is consistent is the three-way legend itself.
8. **Demo sits mid-to-late on its own separator slide** (MEDIUM). First-demo relative position across 16 decks with demos (position ÷ main-story length): median **0.59**, IQR ≈ 0.49–0.72. Masters individually: Kotry 8/14 = 0.57, Ostertag 16/20 = 0.80, Ederer starts 10/33 ≈ 0.30 (long staged mid-deck demo). The corpus does not settle a precise point; it does settle "after objectives + at least one model, never first, never last."
9. **Master decks split realized vs open** (MEDIUM). Explicit two-slide "What did we achieve? / What stayed open?" split: Ostertag p17–18, Ederer p55–58, Lahnor p13–14, Kalra p15–16. Single-slide with open/partial badges: Kotry p12, Aslan p9, Hack p24–25 (+limitations), Cai p15. 2 of 3 Master decks use the two-slide split.
10. **Appendix after the thanks/questions slide** (MEDIUM). 9/17 decks carry post-thanks content; explicit "Additional Material" dark divider in Pahle p11, Aslan p12, Finley p37, Cai p19. Ostertag's appendix is 13 slides (p21–33) — deep-model parking is legitimized (his AOM and activity model live there). Ederer, Kotry, Maia, Youssef, Marcos, Jakubczyk, Liu have none.
11. **Main-story slide budget** (MEDIUM). Logical main-story slides (builds counted once, appendix excluded): min 10 (Pahle), median ≈ 15, max 33 (Ederer — sustained by heavy builds). Masters: Kotry 14, Ostertag 20, Ederer 33. **Recommended target for a 15-minute Master talk: 14–20 logical main slides**, with builds allowed on top.
12. **Charts appear only where something was measured** (HIGH). Quantitative plots/tables only in decks with quantitative evaluations (Jakubczyk p14, Hack p21–22, Cai p14, Marcos p9–10, Brinke p2). Qualitative theses show none. For the Apollon thesis (qualitative/formative evaluation) this **forbids** manufactured charts.

**Top v3 changes, in priority order** (details in Pass 5): 1) enlarge/re-stage the use-case and communication models (measured at 30% and 53% ink width vs corpus 82–97%); 2) add a motivation slide; 3) add a "what stayed open" beat to status; 4) cut or demote slide 18 (presentation-workflow meta slide); 5) lighten or resequence the slide-2 formal context model; 6) add objective wayfinding re-shows; 7) plan progressive builds for the two densest models.

---

## Pass 0 — Corpus integrity

18 PDFs in `.vscode/SamplePresentations/`; sha256 confirms `BA Thesis Presentation Marcos Oliva.pdf` ≡ `BA Thesis Presentation Marcos Oliva (1).pdf` (hash `5ddddbae…`), so **17 unique decks**. All 16:9. Page counts and tags:

| Deck | Degree | PDF pages | Logical main slides | Appendix (logical) |
| --- | --- | ---: | ---: | ---: |
| MA-Presentation-Ostertag | Master | 33 | 20 | 4 (13 pages incl. 10-frame build + ack) |
| MA_Thesis_Presentation_Ederer | Master | 60 | 33 numbered slides | 0 |
| Thesis Presentation - MA Nayer Kotry | Master | 14 | 14 | 0 |
| BA Presentation Fangxing_Liu (1) | Bachelor | 23 | 23 | 0 |
| BA Presentation Jakub Jakubczyk Logos | Bachelor | 16 | 11 | 0 |
| BA Presentation Kalra Catherine | Bachelor | 21 | 14 | 2 |
| BA Presentation Pao Xin Tan | Bachelor | 12 | 12 | 0 |
| BA Presentation Youssef El Toukhi | Bachelor | 15 | 14 | 0 |
| BA Thesis Presentation Marcos Oliva | Bachelor | 12 | 11 | 0 |
| BA-Presentation-Handout-Pahle | Bachelor | 13 | 10 | 3 |
| BA_Presentation_Senan_Aslan | Bachelor | 13 | 10 | 2 |
| BA_Presentation_Vivien_Finley_v3 | Bachelor | 38 | 13 | 2 |
| Nikolas Hack Bachelor-Presentation | Bachelor | 31 | 21 | 1 (4-frame build) |
| Shudong_Cai_Thesis_Presentation | unstated | 25 | 18 | 7 |
| ThesisPresentationMaiaFilip | Bachelor | 15 | 15 | 0 |
| ThesisPresentation_CelineLahnor | Bachelor | 18 | 17 | 1 (sources) |
| präsi_mb_ba_publish | Bachelor | 17 | 14 | 3 |

Text-light decks flagged in Pass 1 and given full visual reads: Maia Filip (headers only extractable), Kalra, Pahle, Youssef, Brinke.

## Pass 2 — Per-slide read

Full table in `sample-slide-index.csv`. Formal-vs-custom distinction was applied strictly: e.g. Youssef's pipeline (p8) and Hack's N:N/N:1 hypothesis graphics (p8–10) are *custom architecture graphics*, not formal models; Marcos's use case (p5) and Maia's use case (p10) are stylized/semi-formal (noted `partial`); Hack's "Architectural Evolution" (p12–16) is a deployment/component hybrid (Kubernetes «Pod»/PVC 3D nodes with component symbols).

## Pass 3 — Quantified patterns

### 3.1 Slide budget
Main-story logical: min 10 / median ~15 / max 33 (see table above). Appendices: 0 (7 decks) to 13 PDF pages (Ostertag). Master target: 14–20 logical main slides for 15 minutes.

### 3.2 Section presence rates (n = 17)
- Explicit objectives/requirements/RQ slide: **17/17** (Pahle frames them as numbered "Requirements" p4; Brinke as RQ + objectives p4).
- Demo: **16/17** (all software theses; Brinke's physical board game replaces it with a pilot study, Hack demos via screenshots p19–20 rather than a separator).
- Status reusing objective wording: **16/17** (exception Marcos: results-before/after instead).
- Explicit realized-vs-open two-slide split: **4/17** (Ostertag, Ederer, Lahnor, Kalra); some open/partial/limitations beat: **9/17** (+Kotry, Aslan, Hack, Cai, Brinke).
- Appendix content after thanks: **9/17**; formal "Additional Material" divider: 4/17.
- Agenda slide: **0/17**.
- Separate motivation slide: **15/17**.
- Limitations discussed explicitly: 5/17 (Hack p23/p25, Brinke p12, Ederer p52–53 findings, Cai p15 "Expectations", Ostertag p18).

### 3.3 Canonical order
Modal ordering: Title → (Context ×0–2) → Problem → Motivation → Objectives → Use case/scope → [Demo] → Architecture (component) → [dynamic/data models] → [Evaluation if measured] → Status (realized→open) → Future Work → Thanks → [Appendix]. Deviations: Ederer/Kalra/Lahnor put the AOM/dynamic models *before* the demo; Ostertag interleaves objective re-shows before each section; Liu runs the whole spine twice (two personas); Jakubczyk merges status+conclusion.
**No corpus deck opens with a formal model before the problem statement** — the first formal model appears after the objectives slide in 15/17 decks (exceptions are still after the problem: none before it).

### 3.4 Demo placement
Relative first-demo position (÷ logical main length): Liu 0.39 (+ second 0.87), Jakubczyk 0.75 (of 16 pages ≈ 11 logical → 0.7–0.75), Kalra 0.74, Tan 0.58, Youssef 0.60, Marcos 0.50, Pahle 0.50, Aslan 0.64, Finley 0.62, Ostertag 0.80, Ederer 0.30, Hack 0.70, Cai 0.44 (+0.67 second), Kotry 0.57, Maia 0.73, Lahnor 0.41. Median **0.59**, IQR ≈ 0.49–0.72. Masters: **0.57 / 0.80 / 0.30** — the three Master decks do not agree; the corpus does not settle an exact point.

### 3.5 Diagram census (headline)
Formal diagrams per deck (builds counted once; main+appendix): min 1 (Brinke), median **3**, max 7 (Cai: use case, activity, 2 system-arch component views, 3 internal component diagrams in appendix).

Type frequency (decks using ≥1):

| Type | Decks | Main-story | Appendix-only | Apollon-native? |
| --- | ---: | ---: | ---: | --- |
| Component / subsystem decomposition | 15 | 15 | — (Cai adds 3 more in appendix) | **yes** |
| Use case | 10 | 10 | 0 | **yes** |
| Activity | 9 | 5 (Kalra, Tan, Cai, Hack, Ederer, Lahnor) | 4 (Ostertag, Aslan, Finley; Hack detail) | **yes**, but corpus activity models are mostly swimlaned — Apollon has no swimlanes (thesis lists swimlanes as future work) |
| Class / analysis object model | 5 | 3 (Ederer, Lahnor, Kalra) | 2 (Ostertag, Finley — Finley's AOM is main, activity appendix; net: 4 main / 1 appendix) | **yes** |
| Deployment / HW-SW mapping | 2 | 2 (Pahle; Hack hybrid) | Pahle +2 | **yes** |
| State machine | 1 (Jakubczyk p11) | 1 | 0 | **no** (closest: Apollon activity or flowchart) |
| Flowchart | 1 (Brinke p9) | 1 | 0 | **yes** |
| Sequence | 0 | — | — | not native anyway |
| Communication | 0 | — | — | native but unused by corpus |

Ratio of formal-model slides to logical main slides: typically 0.15–0.30 (Tan 3/12 = 0.25, Kotry 4/14 = 0.29, Ostertag 4/20 = 0.20, Aslan 2/10 = 0.20, Lahnor 3/17 ≈ 0.18, Ederer ≈ 6/33 ≈ 0.18). Decks are *not* wall-to-wall UML.

Distinct types per deck: median 2 (see rule 4). Verdict on the prior's "small number of different types" claim: **confirmed**.

Apollon-mappability share: of the ~50 distinct formal diagrams in the corpus, all but Jakubczyk's state machine and the swimlane-dependence of 6 activity diagrams map to Apollon types → ≈90% fully mappable, ~10% partial (swimlanes) or unmappable (state machine).

### 3.6 Diagram sizing (measured)
Content-band bounding boxes (title/footer bands excluded): Kotry p9 96% w, Finley p33 97% w, Ederer p7 94% w, Ostertag p12 95% w × 92% h, Aslan p6 91% w, Tan p6 92% w, Lahnor p8 91% w, Ostertag p14 82% w. **Rule confirmed and sharpened: formal diagrams get 80–95% of the content band, full-width, no prose column; explanatory text is a one-line takeaway title plus a legend.** The prior's "70–85%" range was conservative.

### 3.7 Visual system
- Titles top-left, takeaway-phrased ("What stayed open?", "Sleep models, don't unload") in CIT-template and Kotry decks; label-titles ("Subsystem Decomposition") in the rest. Mixed — not settled, but Masters lean takeaway.
- TUM wordmark top-right: 13/17 (CIT family adds "School of CIT · Informatics"; Marcos adds AET logo; Kotry uses text footer only).
- Footer: author · thesis type (· product) + slide number in CIT family (Ostertag, Ederer, Aslan, Lahnor, Liu, Hack, Cai, Brinke variants).
- Dark navy separators for Demo/Questions/Appendix: CIT-family signature — Ostertag p16/p20, Ederer p10/p60, Aslan p7/p11/p12, Lahnor p7/p17. White/gradient separators elsewhere (Finley p14, Cai p8/p12, Maia p11, Marcos p6). Consistent within family, not corpus-wide.
- Card layouts for problem/motivation/objectives/future-work: 15/17.
- Color semantics: three-way change legends dominant (see rule 7); green=done checks on status in 10+ decks; orange/yellow=partial (Kalra p15, Youssef p13, Finley p34, Kotry p12). No single corpus-wide palette.

## Pass 4 — Apollon-native diagram plan

Authoritative type list (fetched 2026-07-23 from https://ls1intum.github.io/Apollon/ — "13 diagram types"): **Class, Object, Activity, Use Case, Communication, Component, Deployment, Petri Net, Reachability Graph, Syntax Tree, Flowchart, BPMN, SFC.** Export: SVG/PNG/PDF/JSON; the web app adds PPTX. (Matches thesis-facts.md: 13 types, five export formats.)

Corpus-rewarded ∩ Apollon-native: component, use case, activity, class, deployment, flowchart. Corpus-used but not native: state machine (1 deck). Native but corpus-unused: communication, object, Petri net, reachability, syntax tree, BPMN, SFC.

Full per-stage plan with anti-forcing verdicts: see `apollon-diagram-plan.md`. Summary: main story carries **5 formal diagrams across 4 types** (component ×2, use case, communication, activity), appendix carries 4 more (class, deployment, activity, component). Every diagram has an existing Apollon JSON source; nothing needs a non-Apollon tool. The single deliberate divergence from the corpus: the **communication diagram** (0/17 corpus usage) is kept because it is the only type that shows the two message streams (persisted CRDT updates vs transient awareness) between two editors and the relay — the core O2 claim — and because using it is dogfooding an Apollon type. It must be staged legibly to earn this (see Pass 5 #1).

Rejected-by-anti-forcing: Petri net / BPMN / SFC / syntax tree / reachability anywhere (no information need); an object diagram of a session (duplicates the AOM); a flowchart of the export pipeline (the demo shows it); any chart of usability gains (evaluation is qualitative — hard constraint).

## Pass 5 — Gap analysis of v3 (29 slides: 20 main + 9 appendix)

v3 slide map: 1 title · 2 context component model · 3 problem · 4 objectives · 5 use-case model · 6 O1 editing · 7 O2 collaboration · 8 O2 communication model · 9 demo (dark) · 10 O3 component model · 11 O3 workflows · 12 O3 activity model · 13 O3 compat · 14 VS Code/Athena · 15 mobile · 16 evaluation · 17 status · 18 presentation workflow · 19 future work · 20 closing/questions · 21–29 appendix (traceability, AOM, standalone component, deployment, activity, timeline, contributions, diagram sources).

| # | Corpus/plan expectation | What v3 does | Severity | Recommended change |
| --- | --- | --- | --- | --- |
| 1 | Formal diagrams fill 80–95% of the content band (3.6) | Diagrams sit in padded panels; measured ink width: use-case (s5) **30%**, communication (s8) **53%**, context component (s2) 83% but grid-framed; labels on s8 are illegible at presentation distance | **Blocker** | Re-stage s5 landscape and full-width (Ostertag p12 layout); either enlarge s8 to full band with bigger node fonts or split it into a 2-step build (persisted path → awareness path), Ederer-style |
| 2 | Motivation beat between problem and objectives (15/17) | None — context → problem → objectives | Worth fixing | Insert one motivation slide (why editing friction + missing awareness matter for students/tutors at Artemis scale; 3 cards, corpus pattern Ostertag p4 / Lahnor p3) |
| 3 | Master status splits realized vs open (Ostertag p17–18, Ederer p55–58; evaluation is formative) | s17 = all four DONE + one caveat line; friction lives on s16 | Worth fixing | Keep s17 realized (wording reuse is already correct ✓); add/convert a "What stayed open" beat from the remaining-friction list (layout control, shortcuts, sharing semantics, notation coverage) — matches corpus *and* the no-overstatement constraint |
| 4 | No corpus precedent for a meta "presentation workflow" slide (0/17); every slide carries thesis information | s18 explains that the deck's own diagrams are Apollon exports | Worth fixing | Cut s18 from the main story; its claim already lives on s9 (demo: "from JSON to editable presentation") and appendix s29 (diagram sources). Fold any remaining line into the closing slide |
| 5 | First formal model appears after problem/objectives (15/17; 0/17 open with a model before the problem) | s2 is a full formal component model before the problem | Worth fixing | Either swap s2 ↔ s3 (problem first, then ecosystem map as answer-context) or lighten s2 to app/integration tiles and keep the formal component model where it recurs (s10) |
| 6 | Objective wayfinding: re-shown objective slide with current one highlighted (Ostertag p6/8/11, Hack p11/17) or objective chips on model frames (Finley p8–13) | Kicker text only ("OBJECTIVE 3 \| ACTIVITY MODEL") | Worth fixing | Add one objectives re-show before the O3 block (largest section), or Finley-style objective-card callouts on the four model slides |
| 7 | Dense diagrams are built progressively (11/17; all heavy Master diagrams) | No builds anywhere (deliberately deferred) | Worth fixing (planned) | Build s8 (2 steps) and s10 (Artemis side → Apollon side → boundary) first; JSON sources make this cheap; keep deferred-animation decision explicit |
| 8 | 2–4 distinct types, variety over repetition (rule 4) | Main story: component ×2, use case, communication, activity = 4 types ✓; appendix adds class, deployment ✓ | OK | No change — v3 is *not* leaning on 1–2 shapes and no diagram is pure padding once #4–5 are fixed |
| 9 | Class/AOM main-story in 4 of the 5 decks that use one | AOM in appendix (s23) | Cosmetic/optional | Corpus doesn't settle it (Ostertag parks his in the appendix too). Optional: pull a *reduced* AOM (Diagram/Selection/AwarenessState only) into the O2 section to set vocabulary before s8 |
| 10 | Demo median 0.59 (IQR 0.49–0.72), Masters 0.30–0.80 | s9/20 = 0.45 | OK | Within corpus spread; no change needed |
| 11 | Three-way change legend on models (≥10/17) | Present on s5/s10/s12 ✓, colors white/orange/blue | Cosmetic | Corpus doesn't fix a palette; keep internal consistency. If desired, green=new matches the largest cluster (5 decks) |
| 12 | Dark separators for demo/questions/appendix (CIT family) | s9, s20, s21 dark ✓ | OK | — |
| 13 | Status wording = objective wording (16/17) | ✓ exact reuse | OK | — |
| 14 | Hard content rules (Artemis dominant, conversion service internal, TUM wordmark only, landscape imagery, mobile/VS Code visible) | s10–14 order Artemis→VS Code→Athena ✓; conversion service not shown as peer ✓; TUM wordmark ✓; s15 landscape tablet ✓ | OK | — |
| 15 | Main budget 14–20 logical (Masters) | 20 main ✓ (= Ostertag) | OK | After cutting s18 and adding motivation + open-goals: still 20–21 — acceptable; if trimming, merge s13 into s11 |

### Priority order for v3 edits
1. Re-stage s5 and s8 full-width/legible (blocker; the only two slides a committee will physically squint at).
2. Insert motivation slide after problem.
3. Add "what stayed open" status beat (also protects against overstatement questions).
4. Cut s18; fold its message into s9/closing.
5. Resequence or lighten s2 (problem before first formal model).
6. Add objective re-show before O3 block.
7. Add progressive builds to s8 and s10 when animation work resumes.

### Honest non-findings
- The corpus does not settle: demo exact position, legend palette, dark-vs-light separators outside the CIT family, AOM main-vs-appendix, takeaway-vs-label titles.
- Communication diagrams have zero corpus precedent; keeping s8 is a justified deviation (unique O2 information + dogfooding), not a corpus-backed choice. If it cannot be made legible, the corpus-backed fallback is an activity model of the awareness flow — but that loses the "two message streams" contrast that motivates the slide.
