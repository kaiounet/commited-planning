// cover.typ

#page(numbering: none, margin: 2.5cm)[
  #align(center)[
    #text(size: 14pt, weight: "bold")[EHEI Oujda / GI & IG] \
    #v(0.5em)
    #text(size: 12pt)[Année académique 2025 - 2026]
  ]

  #v(1fr)

  #align(center)[
    #text(size: 14pt)[Fiche Projet de Fin d'Année] \
    #v(1em)
    #rect(inset: 1em, stroke: 1pt + black, radius: 5pt)[
      #text(size: 20pt, weight: "bold")[
        CommitEd : PLATEFORME D’ÉVALUATION INTELLIGENTE
      ]
    ]
    #v(1em)
    #text(style: "italic")[Une approche Dev-First pour l'enseignement supérieur]
  ]

  #v(1fr)

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    align(center)[
      #text(weight: "bold")[Réalisé par :] \
      #v(0.5em)
      EL AISSAOUI Iliass \
      MAKOURI Loqman \
      SGHIOURI IDRISSI Youness \
      TALEB Fayza
    ],
    align(center)[
      #text(weight: "bold")[Sous l'encadrement de :] \
      #v(0.5em)
      M. MOUHIB Imad
    ],
  )

  #v(2fr)
  #align(center)[
    #text(size: 12pt)[01 Décembre 2025]
  ]
]
// Reset page counter after the title page
#counter(page).update(1)
