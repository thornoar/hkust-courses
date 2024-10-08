#import "@local/common:0.0.0": *
#import "@local/templates:0.0.0": *

#import "@local/theorem:0.0.0": *
#let thmstyle = thmstyle.with(base: none)
#show: thmrules
#let args = (base: none, titlefmt: it => underline(strong(it)))

#let lm = statestyle("lemma", "Lemma", ..args)
#let def = plainstyle("definition", "Definition", ..args)
#let note = plainstyle("note", "Note", ..args)

#show: math-preamble("Part 5", "Fri, Oct 11")
#set math.equation(supplement: "Formula", numbering: "(1)")
#show: equate.with(sub-numbering: false, number-mode: "label")

#math-problem("1.5.1")
Suppose the partial sum $s_n = n/(2n+1)$.
Find the series $sum x_n$ and its sum.\
#math-solution
First, we find $x_n$:
$
  x_n = s_n - s_(n-1) = n/(2n+1) - (n-1)/(2n-1) = (1)/(4n^2 - 1).
$
Here, the derivation works for all $n >= 1$, with $s_0$ being equal to 0.

Now, we find the sum of the series:
$
  sum_(n = 1)^oo x_n = lim_(n -> oo) s_n = lim_(n -> oo) n/(2n+1) = 1/2.
$

/*

#math-problem("1.5.2 (2)")
#math-problem("1.5.5")
#math-problem("1.5.7")
#math-problem("1.5.11")
#math-problem("1.5.14 (2, 5)")
#math-problem("1.5.17 (3)")
#math-problem("1.5.18 (2)")
#math-problem("1.5.19 (1, 5)")
#math-problem("1.5.20 (2)")
#math-problem("1.5.21 (4)")
#math-problem("1.5.22 (4, 5)")
#math-problem("1.6.5")
#math-problem("1.6.8")
*/
