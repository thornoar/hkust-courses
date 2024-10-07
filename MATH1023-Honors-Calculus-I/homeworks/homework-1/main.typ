// #import "./local-template.typ": *
#import "@local/common:0.0.0": *
#import "@local/templates:0.0.0": *

#show: math-preamble("Part 1", "Fri, Sep 13")
#set math.equation(supplement: "Formula")

// #math-problem("1.1.3") Explain that, if $limits(lim)_(n -> oo) x_n = k$ and $limits(lim)_(n -> oo) y_n = l$, then $limits(lim)_(n -> oo) (x_n - y_n) = k - l$.\
// #math-solution $limits(lim)_(n -> oo) (x_n - y_n) = limits(lim)_(n -> oo) x_n + limits(lim)_(n -> oo) (-y_n) = k + (-l) = k-l$.
//
// #attention([
//   Consider an arbtrary $epsilon > 0$. Then, by the definition of limit, there exist numbers $N_x, N_y in NN$ such that
//   $
//     abs(x_n - k) < epsilon/2 " for " n >= N_x ", and " abs(y_n - l) < l " for " n >= N_y.
//   $
//   Consequently, we recognize that
//   $
//     abs((x_n - y_n) - (k - l)) = abs((x_n - k) - (y_n - l)) <= abs(x_n - k) + abs(y_n - l) <= epsilon/2 + epsilon/2 = epsilon,
//   $
//   starting from the index $N := max(N_x, N_y)$.
// ], title: [ a more low-level solution ], color: black, stroke: 1pt, font: none)

#math-problem("1.1.3") Explain that, if $limits(lim)_(n -> oo) x_n = l$ and $p$ is a positive integer, then $limits(lim)_(n -> oo) x_n^p = l^p.$
#math-solution We will prove this statement by induction.
+ If $p = 1$, then the result follows trivially.
+ Suppose that the result holds for $p-1$. Now, with reference to the arithmetic rule, we can write
$
  limits(lim)_(n -> oo) x_n^p = limits(lim)_(n -> oo) (x_n^(p-1) dot x_n) = (limits(lim)_(n -> oo) x_n^(p-1)) dot (limits(lim)_(n -> oo) x_n) = l^(p-1) dot l = l^p.
$

#math-problem("1.1.5 (6)") Find the limit ($n -> oo$) of
$
  ((n^2 + 1)(n+2))/((n+1)(n^2+2)).
$
#math-solution
$
  ((n^2 + 1)(n+2))/((n+1)(n^2+2)) = (n^3 + p_1 n^2 + q_1 n + s_1)/(n^3 + p_2 n^2 + q_2 n + s_2) = (1 + p_1/n + q_1/(n^2) + s_1/(n^3))/(1 + p_2/n + q_2/(n^2) + s_2/(n^3)) ->_(n -> oo) 1.
$

#math-problem("1.1.7 (5)") Find the limit ($n -> oo$) of
$
  (c n + d)/((sqrt(n) + a)(sqrt(n) + b)).
$
#math-solution
$
  (c n + d)/((sqrt(n) + a)(sqrt(n) + b)) = (c n + d)/(n + p sqrt(n) + q) = (c + d/n)/(1 + p/sqrt(n) + q/n) ->_(n -> oo) c.
$

#math-problem("1.1.9 (3)") Find the limit ($n -> oo$) of
$
  (5^5(2 sqrt(n) + 1)^2 - 10^10)/(10 n - 5).
$
#math-solution
$
  (5^5(2 sqrt(n) + 1)^2 - 10^10)/(10 n - 5) = (5^5 dot 4 n + p sqrt(n) + q)/(10 n - 5) ->_(n -> oo) (5^5 dot 4)/10 = 1250.
$

#math-problem("1.1.11 (1)") Find the limit ($n -> oo$) of
$
  (n^2 + a_1 n + a_0)/(n + b) - (n^2 + c_1 n + c_0)/(n + d).
$

#pagebreak()

#math-solution
$
  (n^2 + a_1 n + a_0)/(n + b) - (n^2 + c_1 n + c_0)/(n + d) = ((n+d)(n^2 + a_1 n + a_0) - (n+b)(n^2 + c_1 n + c_0))/((n+d)(n+b)) =\ = ((d - b + a_1 - c_1)n^2 + p_1 n + q_1)/(n^2 + p_2 n + q_2) ->_(n -> oo) d - b + a_1 - c_1.
$

#math-problem("1.1.15 (8)") Find the limit ($n -> oo$) of
$
  cos(n)/sqrt(n + sin(sqrt(n))).
$
#math-solution It is trivial to see that
$
  0 <-_(n -> oo) (-1)/sqrt(n - 1) <= cos(n)/sqrt(n + sin(sqrt(n))) <= 1/sqrt(n - 1) ->_(n -> oo) 0,
$
which implies that the the limit in question is equal to 0, by the sandwich rule.

#math-problem("1.1.15 (16)") Find the limit ($n -> oo$) of
$
  (n + sin(n))/(n - cos(n)).
$
#math-solution The answer is 1 by the sandwich rule, since
$
  1 <-_(n -> oo) (n - 1)/(n + 1) <= (n + sin(n))/(n - cos(n)) <= (n + 1)/(n - 1) ->_(n -> oo) 1.
$

#math-problem("1.1.21 (11)") Find the limit ($n -> oo$) of $sqrt(n^2 + a n + b) - sqrt(n^2 + c n + d)$.\
#math-solution Consider two real numbers $alpha, beta > 0$. From the algebraic rule $x^2 - y^2 = (x-y)(x+y)$, it follows that
$
  sqrt(alpha) - sqrt(beta) = (alpha - beta)/(sqrt(alpha) + sqrt(beta)).
$
Now assume that $alpha >= beta$. Then, since $2 sqrt(beta) <= sqrt(alpha) + sqrt(beta) <= 2 sqrt(alpha)$, we can bound the difference $sqrt(alpha) - sqrt(beta)$ in the following way:
#[
  #set math.equation(numbering: "(1)")
  $
  (alpha - beta)/(2 sqrt(alpha)) <= sqrt(alpha) - sqrt(beta) <= (alpha - beta)/(2 sqrt(beta)).
  $ <ab>
]
With respect to the original problem, we first note that for all $a, b in RR$, the expression $n^2 + a n + b$ will become positive as $n$ goes to infinity, and thus the square roots can be considered to be well-defined. Further, it is clear by exhausting the relative positions of $a$, $b$, $c$, and $d$ that one of the expressions\ $n^2 + a n + b$ and $n^2 + c n + d$ will not exceed the other, starting at some point. This is explained by the fact that their difference is an affine function of $n$, and it acquires a constant sign as $n$ approaches infinity. In other words, without loss of generality, we can assume that
#[
  #set math.equation(numbering: "(1)")
  $
  (n^2 + a n + b) >= (n^2 + c n + d)" as " n -> oo.
  $ <btoet>
]
(In case the sign is $<=$, we switch the expressions, moving into an analogous situation)\
Now, in view of @ab and @btoet, we can write that
$
  ((a - c) n + (b - d))/(2 sqrt(n^2 + a n + b)) <= sqrt(n^2 + a n + b) - sqrt(n^2 + c n + d) <= ((a-c) n + (b-d))/(2 sqrt(n^2 + c n + d)).
$

By squaring the non-negative sequences on the left and the right, we see that they both approach $(a-c)/2$, meaning that, by the sandwich rule, the sequence in the middle also approaches $(a-c)/2$.

#math-problem("1.1.24 (3)") Find the limit ($n -> oo$) of
$
  ((n-2)/(n+1))^(-sqrt(2)).
$
#math-solution
$
  1 <= ((n-2)/(n+1))^(-sqrt(2)) = ((n+1)/(n-2))^sqrt(2) <= ((n+1)/(n-2))^2 = (1 + 3/(n-2))^2 ->_(n -> oo) 1,
$
and therefore the limit is 1.

#math-problem("1.1.27") Suppose that $limits(lim)_(n -> oo) x_n = 1$, $x_n >= 1$, and $y_n$ is bounded. Prove that $limits(lim)_(n -> oo) x_n^(y_n) = 1.$\
#math-solution Let $a >= 1$. Then, if $b_1 <= b_2$, we have $a^(b_1) <= a^(b_2)$. Now, since $y_n$ is bounded, there exist numbers $mu, nu in RR$ such that $mu <= y_n <= nu$ for all $n$. Consequently, we have
$
  1 <-_(n -> oo) x_n^mu <= x_n^(y_n) <= x_n^nu ->_(n -> oo) 1,
$
and we are done.
