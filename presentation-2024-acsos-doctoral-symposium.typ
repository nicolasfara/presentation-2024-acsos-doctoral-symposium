#import "@preview/polylux:0.3.1": *
#import "@preview/fontawesome:0.1.0": *

#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  // footer: [Optional Footnote]
)

#set text(font: "Fira Sans", weight: 350, size: 20pt)
#show math.equation: set text(font: "Fira Math")
#set strong(delta: 200)
#set par(justify: true)
#set list(spacing: 1.9em)

#set quote(block: true)
#show quote: set align(left)
#show quote: set pad(x: 2em, y: -0.8em)

#set raw(tab-size: 4)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 1em,
  radius: 0.7em,
  width: 100%,
)

#show bibliography: set text(size: 0.75em)
#show footnote.entry: it => {
  block(inset: (x: 2em, y: 0.1em))[#text(size: 0.75em)[#it.note.body]]
}

#let fcite(clabel) = {
  footnote(cite(form: "full", label(clabel)))
}

#let mail(email) = {
  text(size: 1.3em)[#raw(email)]
}

#let author = block(inset: 0.1em)[
  #table(inset: 0.5em, stroke: none, columns: (auto, 4fr),  align: (left, left),
    [#alert[*Nicolas Farabegoli*]], [#mail("nicolas.farabegoli@unibo.it")],
    [#text(size: 0.9em)[Supervisor]], [#text(size: 0.9em)[Prof. Mirko Viroli]],
  )
  #place(right)[
    #figure(image("images/disi.svg", width:40%))
  ]
]

#title-slide(
  title: "Intelligent Pulverised Collective-adaptive Systems",
  // subtitle: "Subtitle",
  author: author,
  // date: datetime.today().display("[day] [month repr:long] [year]"),
)

#new-section-slide("Motivation and Challenges")

#slide(title: "Edge-cloud Continuum")[

]

#slide(title: "Collective-adaptive Systems")[
]

#slide(title: "Pulverisation and Macro-program partitioning")[

]

#new-section-slide("Contribution and Objectives")

#slide(title: "Pulverised systems characteristics")[

]

#slide(title: "MARL + GNN")[

]

#new-section-slide("Methodology and Preliminary Results")

#slide(title: "Reconfiguration")[

]

#slide(title: "Communication")[
]

#slide(title: "Scheduling")[

]

#new-section-slide("Future Work and Research Plan")

#slide(title: "Step 1")[

]

#slide(title: "Step 2")[

]

#slide(title: "Step 3")[

]

#slide[
  #bibliography("bibliography.bib")
]
