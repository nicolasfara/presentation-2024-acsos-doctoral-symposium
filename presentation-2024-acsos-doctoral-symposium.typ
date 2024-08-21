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
  subtitle: [Docotoral Symposium \@ ACSOS 2024],
  author: author,
  // date: datetime.today().display("[day] [month repr:long] [year]"),
)

#new-section-slide("Motivation and Challenges")

#slide(title: "Collective-adaptive Systems")[
  *Collective-adaptive Systems* #fcite("DBLP:conf/birthday/BucchiaroneM19") refers to systems with a _large number_ of entities interacting with each other in pursuing a #alert[collective] goal without a central coordinator.

  #v(1em)
  
  Actual _behaviour_ arises as an #alert[emergent] property of the system.

  #side-by-side[
    #figure(image("images/swarms.jpg", width: 75%))
  ][
    #figure(image("images/pedastrian.png", width: 100%))
  ][
    #figure(image("images/coldplay.jpg", width: 88%))
  ]
]

#slide(title: "Aggregate computing")[
  #underline[Aggregate computing] #fcite("DBLP:journals/computer/BealPV15") as a way to *engineer* #alert[collective-adaptive systems].

  #place(right, dx: -12.2em)[
    #line(start: (0em, 0em), end: (0em, 60%), stroke: 0.05em + rgb("#23373b"))
  ]

  #v(1em)

  #side-by-side(columns: (2fr, auto), gutter: 2em)[
    #figure(image("images/ac.svg"))
  ][
    #figure(image("images/channel.svg", height: 45%))
  ]

  #v(0.3em)

  #align(center)[Typical deployments assume that all the devices *can* execute the program.]
]

#slide(title: "Edge-cloud Continuum")[
  #side-by-side(columns: (2fr, auto), gutter: 2em)[
    #quote[Aggregation of #alert[computational resources] along the data path from the *edge* to the *cloud* #fcite("DBLP:journals/access/MoreschiniPLNHT22")]

    #v(1em)

    We must deal with different #alert[capabilities] and #alert[constraints]:
    - edge devices for #underline[sense/acting], but *resources-constrained*
    - cloud instances for #underline[scalability], but *latency/privacy* issues
  ][
    #figure(image("images/edge-cloud-continuum.svg", height: 80%))
  ]
]

#slide(title: "Pulverisation and Macro-program partitioning")[
  #side-by-side(columns: (1fr, 1fr))[
    == Pulverisation
    #figure(image("images/pulverisation.svg", height: 80%))
  ][
    == Macro-program partitioning
    #figure(image("images/collective-local-components.svg", height: 80%))
  ]
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
