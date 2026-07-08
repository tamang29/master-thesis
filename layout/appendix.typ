== Work Distribution

#let category(title) = (strong(title), [])
#let feature(title, author) = ([#h(1em)#title], author)

#let contribution-table(rows) = table(
  columns: (1.45fr, 0.75fr),
  inset: (x: 5pt, y: 4pt),
  align: (left, center),
  table.header([Feature], [Author]),
  ..rows.flatten(),
)

=== Chapter Contributions

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
  [Implementation], [],
  [User Feedback and Findings], [],
  [Summary], [],
  [Future Work], [],
)

=== Implementation Contributions

#contribution-table((
  category([1 Library - Edge usability]),
  feature([1.1 Edge usability and UI/UX improvements], [Fady Samaan]),
  feature([1.2 Step-edge bending and waypoint dragging], [Fady Samaan]),
  feature([1.3 React Flow edge reconnection], [Fady Samaan]),
  feature([1.4 Dynamic edge handles based on element size], [Fady Samaan]),
  feature([1.5 Edge line jumps on collision], [Ravi Tamang]),
  feature([1.6 Communication diagram vertical edge labels], [Ravi Tamang]),

  category([2 Library - Collaboration features]),
  feature([2.1 Selected and dragged element highlighting], [Ravi Tamang]),
  feature([2.2 Live cursors and display-name modal], [Ravi Tamang]),
  feature([2.3 Follow collaborator's viewport], [Ravi Tamang]),

  category([3 Library - App usability]),
  feature([3.1 Alignment guides], [Ravi Tamang]),
  feature([3.2 Reordering class attributes and methods], [Ravi Tamang]),
  feature([3.3 Keyboard shortcut for deletion], [Ravi Tamang]),
  feature([3.4 Scroll lock mode for the library], [Ravi Tamang]),
  feature([3.5 Sidebar preview and export UI cleanup], [Fady Samaan]),
  feature([3.6 Editor-side UI modernization and component cleanup], [Fady Samaan]),

  category([4 Library - SVG and rendering]),
  feature([4.1 SVG export compatibility modes], [Fady Samaan]),
  feature([4.2 Flat SVG exporter], [Fady Samaan]),
  feature([4.3 SVG export visual tests], [Fady Samaan]),
  feature([4.4 SVG text bounds and clipping fixes], [Fady Samaan]),
  feature([4.5 Class, component, SFC, and Petri net SVG rendering], [Fady Samaan]),

  category([5 Standalone application - Home page and routing]),
  feature([5.1 Standalone home page and routing], [Fady Samaan]),
  feature([5.2 Home page diagram list and entry points], [Fady Samaan]),

  category([6 Standalone application - Mobile and export]),
  feature([6.1 iOS file export for PNG, PDF, JSON, and SVG], [Ravi Tamang]),
  feature([6.2 Animatable PPTX export for iOS], [Ravi Tamang]),
  feature([6.3 Local server support for Capacitor app], [Ravi Tamang]),
  feature([6.4 Server-side PDF export endpoint], [Fady Samaan]),
  feature([6.5 Replace Playwright conversion service with JSDOM and React Flow SSR], [Ravi Tamang]),

  category([7 Artemis integration]),
  feature([7.1 Replace legacy Apollon with maintained Apollon in Artemis], [Ravi Tamang and Fady Samaan]),
  feature([7.2 Quiz mode and drag-and-drop quiz generation], [Fady Samaan]),
  feature([7.3 Element selection highlighting color], [Ravi Tamang]),
  feature([7.4 Assessment scoring compatibility for Apollon drop information], [Fady Samaan]),
  feature([7.5 Team modeling collaboration in Artemis], [Ravi Tamang]),

  category([8 Athena integration]),
  feature([8.1 Support current Apollon model format in Athena], [Ravi Tamang]),
  feature([8.2 Backward-compatible Athena parser logic], [Ravi Tamang]),
  feature([8.3 Update Athena playground to maintained Apollon version], [Ravi Tamang]),

  category([9 VS Code extension]),
  feature([9.1 Migrate VS Code extension into Apollon monorepo], [Ravi Tamang]),
  feature([9.2 Update VS Code extension to maintained Apollon version], [Ravi Tamang]),
))
