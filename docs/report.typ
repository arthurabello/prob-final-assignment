#import "@preview/ctheorems:1.1.3": *
#import "@preview/plotst:0.2.0": *
#import "@preview/codly:1.2.0": *
#import "@preview/codly-languages:0.1.1": *
#codly(languages: codly-languages)

#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#show link: underline
#show ref: underline

#set heading(numbering: "1.1.")
#set page(numbering: "1")
#set heading(numbering: "1.")
#set math.equation(
  numbering: "(1)",
  supplement: none,
)

#set par(first-line-indent: 1.5em,justify: true)
#show ref: it => {
  // provide custom reference for equations
  if it.element != none and it.element.func() == math.equation {
    // optional: wrap inside link, so whole label is linked
    link(it.target)[eq.~(#it)]
  } else {
    it
  }
}

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#ffeeee")) //theorem color
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))
#let example = thmplain("example", "Example").with(numbering: "1.")
#let proof = thmproof("proof", "Proof")

//shortcuts

#let inv(arg, power) = $arg^(-power)$
#let herm(arg) = $arg^*$
#let transpose(arg) = $arg^T$
#let inner(var1, var2) = $angle.l var1, var2 angle.r$
#let Var(arg) = $"Var"(arg)$
#let int = $integral$
#let Exp(arg) = $"Exp"(arg)$

#align(center, text(20pt)[
 *Final Assignment - Probability Theory*
])

#align(center, text(15pt)[
  Arthur Rabello Oliveira
  #footnote[#link("https://emap.fgv.br/")[Escola de Matemática Aplicada, Fundação Getúlio Vargas (FGV/EMAp)], email: #link("mailto:arthur.oliveira.1@fgv.edu.br")]

  #datetime.today().display("[day]/[month]/[year]")
])

#align(center)[
  *Abstract*\
_coming soon_
]


//  TABLE OF CONTENTS ----------------------------------
#outline()
#pagebreak()

= Introduction
<section_introduction>

= User Parameters
<section_user_parameters>

The parameters used in the simulation are:

$
  "ID" = 02\
  m = 5,5\
  c = 0.02\
  f = 0.035\
  N = 425\
  M = 3000
$ <equation_user_parameters>

= Problem 1
<section_problem1>
== Problem 1 (a)
<section_problem1a>

The simulation for this problem can be found #link("https://github.com/arthurabello/prob-final-assignment/blob/main/src/assignment.ipynb")[here]

== Problem 1 (b)
<section_problem1b>

We have 2 kinds of customers, so the waiting time $S$ is a combination of distributions:

$
  EE(S) = f EE(S_"fast") + (1 - f) EE(S_"slow")
$ <equation_expected_waiting_time>

From @section_user_parameters we have a $f approx 0.35$ of fast customers and a PDF of:

$
  g(phi) = 0.25 + c(phi - 4), 2 < phi < 6, c = 0.02
$ <equation_pdf_fast_customers>

The expected value is, therefore:

$
  EE(S_"fast") = int_(-oo)^oo phi g(phi) d phi = int_2^6 phi (0.25 + 0.02(phi - 4)) d phi\

  = int_2^6 0.25 phi d phi + int_2^6 0.02 phi^2 d phi - int_2^6 0.08 phi d phi\

  = 0.25 int_2^6 phi d phi + 0.02 int_2^6 phi^2 d phi - 0.08 int_2^6 phi d phi\

  = 0.25 [phi^2/2]_2^6 + 0.02 [phi^3/3]_2^6 - 0.08 [phi^2/2]_2^6\

  = 0.25 (36 - 4) + 0.02 (216 - 8) - 0.08 (36 - 4)\

  = 32/4 + 0.02 dot 208/3 - 0.08 dot 32/4 approx 4.10
$

The remaining $S_"slow" ~ Exp(m = 5.5)$ customers have an expected value of $EE(S_"slow") = 5.5$, so the total expected waiting time is:

$
  EE(S) = 0.35 dot 4.10 + 0.65 dot 5.5 approx 5.01 "minutes"
$ <equation_final_expected_waiting_time>.

On @section_problem1a our simulation shows an average waiting time of $5.060 "min"$, close enough to the analytical expected value.

Now for the standard deviation, we calculate the variance of $S$ as follows:

$
  E(S_"fast") = 4.10\
  E(S_"fast"^2) = int_(-oo)^oo phi^2 g(phi) d phi = int_2^6 phi^2 (0.25 + 0.02(phi - 4)) d phi\

  = 0.25 int_2^6 phi^2 d phi + 0.02 int_2^6 phi^3 d phi - 0.08 int_2^6 phi^2 d phi\

  = 0.25 [phi^3/3]_2^6 + 0.02 [phi^4/4]_2^6 - 0.08 [phi^3/3]_2^6 approx 18.18
$

And now for the slow customers $S_"slow" ~ Exp(5.5)$:

$
  EE(S_"slow") = 5.5\

  EE(S_"slow"^2) = 2m^2 = 2 dot 5.5^2 = 60.5
$

Therefore the total variance is:

$
  EE(S) = 5.01\

  EE(S^2) = f EE(S_"fast"^2) + (1 - f) EE(S_"slow"^2)\

  = 0.35 dot 18.18 + 0.65 dot 60.5 approx 45.69\

  Var(S) = EE(S^2) - EE(S)^2 = 45.69 - 5.01^2 approx 20.56
$ <equation_variance_waiting_time>

And finally the standard deviation is:

$
  sigma_S = sqrt(Var(S)) approx 4.53 "minutes"
$

On @section_problem1 our simulation shows a standard deviation of $4.508 "minutes"$, which is close enough to the analytical value.

= Problem 2
<section_problem2>

The simulation for this problem can also be found #link("https://github.com/arthurabello/prob-final-assignment/blob/main/src/assignment.ipynb")[here]

On the last cell of the notebook, there is a small comparative analysis of the results (switching/not switching stickers).
