-- Supplementary Material --

= Work Distribution

The work distribution follows the structure of the example thesis and separates chapter and implementation contributions. The implementation table includes merged contributions and currently open pull requests.

#let category(title) = (strong(title), [])
#let feature(title, author) = ([#h(1em)#title], author)

#let contribution-table(rows) = table(
  columns: (1.45fr, 0.75fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, center),
  table.header([Feature], [Author]),
  ..rows.flatten(),
)

== Chapter Contributions

#table(
  columns: (1fr, 1fr),
  inset: 6pt,
  align: horizon,
  table.header([Chapter], [Author]),
  [Introduction], [],
  [Problem], [],
  [Motivation], [],
  [Objectives], [],
  [Outline], [],
  [Background], [],
  [Related Work], [],
  [Requirements], [],
  [Architecture], [],
  [Implementation Details], [],
  [Evaluation], [],
  [Summary], [],
  [Future Work], [],
)

== Implementation Contributions

#contribution-table((
  category([1 Library - Edge usability]),
  feature([1.1 Edge usability and UI/UX improvements], [Fady Saman]),
  feature([1.2 Step-edge bending and waypoint dragging], [Fady Saman]),
  feature([1.3 React Flow edge reconnection], [Fady Saman]),
  feature([1.4 Dynamic edge handles based on size of element], [Fady Saman]),
  feature([1.5 Edge line jumps on collision], [Ravi Tamang]),
  feature([1.6 Communication diagram vertical edge labels (open PR #645)], [Ravi Tamang]),

  category([2 Library - Collaboration features]),
  feature([2.1 Live cursors], [Ravi Tamang]),
  feature([2.2 Presence indicator], [Ravi Tamang]),
  feature([2.3 Follow collaborator viewport], [Ravi Tamang]),

  category([3 Library - App usability]),
  feature([3.1 Alignment guides], [Ravi Tamang]),
  feature([3.2 Class attributes and methods reordering], [Ravi Tamang]),
  feature([3.3 Keyboard shorcut for deletion], [Ravi Tamang]),
  feature([3.4 Add scroll lock mode to library], [Ravi Tamang]),
  feature([3.5 Sidebar preview and export UI cleanup], [Fady Saman]),

  category([4 Library - SVG and rendering]),
  feature([4.1 SVG export compatibility modes], [Fady Saman]),
  feature([4.2 Flat SVG exporter], [Fady Saman]),
  feature([4.3 SVG export visual tests], [Fady Saman]),
  feature([4.4 SVG text bounds and clipping fixes], [Fady Saman]),
  feature([4.5 Class, component, SFC, and Petri net SVG rendering], [Fady Saman]),

  category([5 Standalone application - Dashboard and routing]),
  feature([5.1 Home page with diagram list (open PR #662)], [Fady Saman]),
  feature([5.2 URL-based diagram routing], [Fady Saman]),

  category([6 Standalone application - Mobile and export]),
  feature([6.1 iOS file export for PNG, PDF, JSON, and SVG], [Ravi Tamang]),
  feature([6.2 Animatable PPTX export for iOS], [Ravi Tamang]),
  feature([6.3 Local server support for Capacitor app], [Ravi Tamang]),
  feature([6.4 Server-side PDF export endpoint], [Fady Saman]),
  feature([6.5 Replace Playwright conversion service with JSDOM and React Flow SSR], [Ravi Tamang]),

  category([7 Artemis integration]),
  feature([7.1 Replace legacy Apollon with new Apollon in Artemis], [Ravi Tamang and Fady Saman]),
  feature([7.2 Quiz mode and interactive export], [Fady Saman]),
  feature([7.3 Select elements for Apollon drag-and-drop quizzes], [Fady Saman]),
  feature([7.4 Automatic diagram cut-out for drag-and-drop], [Fady Saman]),
  feature([7.5 Nested Apollon selections in quiz generation], [Fady Saman]),
  feature([7.6 Element selection highlighting color], [Ravi Tamang]),
  feature([7.7 Assessment popover interaction logic], [Fady Saman]),
  feature([7.8 Team modeling collaboration in Artemis (open PR #12867)], [Ravi Tamang]),

  category([8 Athena integration]),
  feature([8.1 Support Apollon v4 model in Athena], [Ravi Tamang]),
  feature([8.2 Backward-compatible Athena parser logic], [Ravi Tamang]),
  feature([8.3 Update Athena playground to latest Apollon version], [Ravi Tamang]),

  category([9 VS Code extension]),
  feature([9.1 Migrate VS Code extension into Apollon monorepo], [Ravi Tamang]),
  feature([9.2 Update VS Code extension to latest Apollon version], [Ravi Tamang]),
))
