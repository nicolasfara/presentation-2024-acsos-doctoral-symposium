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
#show quote: set text(style: "italic")

#set raw(tab-size: 4)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 1em,
  radius: 0.7em,
  width: 100%,
)

#show bibliography: none
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
  subtitle: [Doctoral Symposium \@ ACSOS 2024],
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

  #place(right, dx: -26.2em)[
    #line(start: (0em, 0em), end: (0em, 60%), stroke: 0.05em + rgb("#23373b"))
  ]

  #v(1em)

  #side-by-side(columns: (auto, 1fr), gutter: 2em)[
    #figure(image("images/channel.svg", height: 45%))
  ][
    #figure(image("images/ac.svg"))
  ]

  #v(0.3em)

  #align(center)[Typical deployments assume that all the devices *can* execute the program.]
]

#slide(title: "Edge-cloud Continuum")[
  #side-by-side(columns: (2fr, auto), gutter: 2em)[
    Aggregation of #alert[computational resources] along the data path from the *edge* to the *cloud* #fcite("DBLP:journals/access/MoreschiniPLNHT22")

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
    #align(center)[*Pulverisation* #fcite("FARABEGOLI2024545")]
    #figure(image("images/pulverisation.svg", height: 49%))
    
  ][
    #align(center)[*Macro-program partitioning*]
    #figure(image("images/collective-local-components.svg", height: 49%))
  ]
  How can we manage the components' #alert[reconfiguration] to cope with the *ECC*? \
  How can we improve #alert[non-functional] properties like *latency* and *consumption*?
]

#slide(title: "Research objectives")[
  == Research question

  #quote[
    How can we manage the runtime execution and deployment of *pulverised* systems
    when dealing with #alert[unpredictable] and #alert[changing] conditions of the #alert[ECC]?
  ]

  #v(0.5em)

  == Scenarios

  / Disaster Management: In such scenarios, where conditions change rapidly, the system could #alert[adapt to unpredictable] and #alert[evolving environments] (e.g., shifting areas of priority for rescue operations).

  / Adaptive Traffic Management: A city's traffic light system #alert[dynamically adjusts] based on real-time data from sensors monitoring traffic flow, accidents, or events.

]

#new-section-slide("Contribution and Objectives")

#slide(title: "Pulverised systems characteristics")[
  A *pulverised system* is composed of #underline[several entities] forming a #alert[dynamic graph]:

  - *large scale*: thousands of devices
  - *locality*: edge devices are spatially distributed
  - *partial observability*: devices perceive only neighbours
  - *heterogeneity*: resources of the #underline[ECC] have varying capabilities and constraints

  // Standard supervised learning techniques may #underline[not suitable] for dealing with the characteristic elements of the ECC: *difficult* to determine the correct behaviour #alert[a priori].
]

#slide(title: "AC + MARL + GNN")[
  // We envision a combination of:

  #side-by-side(columns: (1fr, 1fr, 1fr), gutter: 2em)[
    *Aggregate Computing*

    encoding the #alert[collective] \
    nature of the system.
  ][
    *Graph Neural Network* #fcite("DBLP:journals/tnn/WuPCLZY21")

    for encoding device \
    #alert[spatial relationships].
  ][
    *MARL* #fcite("DBLP:journals/corr/abs-2209-03859")

    for encoding #alert[large-scale] \
    system dynamics.
  ]

  #figure(image("images/ac-gnn-marl.svg", height: 37%))
]

#slide(title: "Proposed approach")[
  #figure(image("images/marl-gnn-algorithm-2.svg"))
]

#new-section-slide("Methodology and Preliminary Results")

#slide(title: "Reconfiguration")[
  #side-by-side(columns: (2fr, auto), gutter: 2em)[
    Dynamic components' relocation to improve the system's #alert[performance].

    - Difficult to determine the #alert[placement] #alert[a priori]
    - Pre-defined #alert[rules] cannot adapt to changing conditions (ECC)

    #alert[MARL] and #alert[GNN] can leverage *neighbours* information to determine the best #alert[placement], and allowing the definition of #alert[new once].
  ][
    #figure(image("images/offloading-surrogate.svg"))
  ]
]

#slide(title: "Communication")[
  #side-by-side(columns: (2fr, auto), gutter: 2em)[
    In distributed #underline[collective] systems #alert[communication] & #alert[coordination] are essential to achieve a #underline[global goal].

    #alert[MARL] and #alert[GNN] can help to:
    - reduce the *amount of information* exchanged
    - optimising the *message frequency*, and 
    - selecting the *appropriate neighbours*

    This can *minimise* the #alert[bandwidth] and #alert[power] consumption.
  ][
    #figure(image("images/communication.svg"))
  ]
]

#slide(title: "Scheduling")[
  #side-by-side(columns: (2fr, auto))[
    *Pulverised systems* lack pre-defined policy for computing a new #alert[device state].

    Depending on the deployment consitions, #alert[different] scheduling policies can be used to #alert[reduce] power consumption.

    #alert[MARL] and #alert[GNN] can help to determine more sophisticated #alert[scheduling policies].
  ][
    #figure(image("images/scheduling.svg"))
  ]
]

#new-section-slide("Future Work and Research Plan")

#slide(title: "Future directions in 3 steps")[

  1. #alert[Enhance] and #alert[extend] the macro-program partitioning model to accomodate *constraints* and *capabilities* fo the different components
  2. Integrate #alert[MARL] and #alert[GNN] in the pulverisation model completing the *toolchain*, and evaluate the effectiveness of the approach in scenarios like #alert[smart cities], #alert[IoT], etc.
  3. Investigate *continual learning* techniques to adapt the system to #alert[changing] conditions and #alert[requirements]. 
]

#focus-slide[
  Thank you for your attention!

  // keep the bib at the end
  #bibliography("bibliography.bib")
]
