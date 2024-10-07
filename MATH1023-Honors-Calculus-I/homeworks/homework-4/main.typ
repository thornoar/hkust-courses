#import "@local/common:0.0.0": *
#import "@local/templates:0.0.0": *

#import "@local/theorem:0.0.0": *
#let thmstyle = thmstyle.with(base: none)
#show: thmrules
#let args = (base: none, titlefmt: it => underline(strong(it)))

#let lm = statestyle("lemma", "Lemma", ..args)
#let def = plainstyle("definition", "Definition", ..args)
#let note = plainstyle("note", "Note", ..args)

#show: math-preamble("Part 4", "Fri, Oct 4")
#set math.equation(supplement: "Formula", numbering: "(1)")
#show: equate.with(sub-numbering: false, number-mode: "label")

#math-problem("1.3.2") Prove that if $x_n$ is bounded for sufficiently large $n$, i.e. $abs(x_n) <= B$ for $n >= N$, then $x_n$ is still bounded.\
#math-solution
Consider $N$ such that $n >= N$ implies $abs(x_n) <= B$. 
Let $B' = max{B, abs(x_1), abs(x_2), ..., abs(x_(N-1))}$.
For $1 <= n < N$, we have $abs(x_n) <= B'$ by the definition of maximum.
For $n >= N$, we have $abs(x_n) <= B'$ since $abs(x_n) <= B <= B'$.
Hence, $x_n$ is bounded by $B'$.

#math-problem("1.3.5 (2)") Show the convergence of sequences:
+ $x_n = 1/1^3 + 1/2^3 + 1/3^3 + ... + 1/n^3$;
+ $x_n = 1/1^2.4 + 1/2^2.4 + 1/3^2.4 + ... + 1/n^2.4$;
+ $x_n = 1/(1 dot 3) + 1/(3 dot 5) + 1/(5 dot 7) + 1/((2n-1)(2n+1))$
+ $x_n = 1/(1 dot 2 dot 3) + 1/(2 dot 3 dot 4) + 1/(3 dot 4 dot 5) + ... + 1/(n(n+1)(n+2))$;
+ $1/1! + 1/2! + ... + 1/n!$.
#math-solution
It is obvious that all the given sequences are increasing, so the problem reduces to showing that all these sequences are bounded above.
+ Since $1/n^3 <= 1/n^2$, we have
  $
    x_n = sum_(k = 1)^n 1/k^3 <= sum_(k = 1)^n 1/k^2 <= 2 - 1/n < 2,
  $
  as has been shown in Example 1.3.1.
+ Since $1/n^2.4 <= 1/n^2$, the boundedness follows from Example 1.3.1 as above.
+ Let us write an upper bound:
  $
    x_n = 1/(1 dot 3) + 1/(3 dot 5) + ... + 1/((2n - 1)(2n + 1)) = sum_(k = 1)^n 1/((2k-1)(2k+1)) =\
    = 1/2 dot sum_(k = 1)^n 2/((2k-1)(2k+1)) = 1/2 dot sum_(k = 1)^n (1/(2k-1) - 1/(2k+1)) = 1/2 dot (1 - 1/(2n + 1)) <= 1/2.
  $
+ Noting that $1/(n(n+1)(n+2)) <= 1/(n(n+1))$, we write
  $
    x_n = sum_(k = 1)^n 1/(n(n+1)(n+2)) <= sum_(k = 1)^n 1/(n(n+1)) = sum_(k = 1)^n (1/n - 1/(n+1)) = 1 - 1/(n+1) < 1.
  $
+ As we know from the convergence of $n^2/n!$ to zero, $n! > n^2$ for sufficiently large $n$, say, starting at $n = N$.
  Now, we write the upper bound for $x_n$ (for $n > N$):
  $
    x_n = sum_(k = 1)^n 1/k! = sum_(k = 1)^(N-1) 1/k! + sum_(k = N)^n 1/k! <= x_(N-1) + sum_(k = N)^n 1/k^2 <= x_(N-1) + sum_(k = 1)^n 1/k^2 <= x_(N-1) + 2,
  $
  making use of Example 1.3.1.
  Now, since $x_n$ is bounded for $n > N$, it is also bounded for all $n$ (see Exercise 1.3.2).

#math-problem("1.3.6") Suppose a sequence $x_n$ satisfies $x_(n + 1) = sqrt(2 + x_n)$.
+ Prove that if $-2 < x_1 < 2$, then $x_n$ is increasing and converges to 2.
+ Prove that if $x_1 > 2$, then $x_n$ is decreasing and converges to 2.
#pagebreak()
#math-solution
+ We will prove by induction that $x_n$ is increasing: $x_(n+1) > x_n$.
  - Base: $n = 1$. If $x_1 < 0$, then we have $x_1 < 0 < sqrt(2 + x_1) = x_2$.
    Otherwise, we solve the characteristic inequality:
    $
      x_1 < sqrt(2 + x_1) &<==\
      x_1^2 < 2 + x_1 &<==\
      x_1^2 - x_1 - 2 < 0 &<==\
      (x_1 + 1)(x_1 - 2) < 0&.
    $
    The last inequality holds for all admissible $x_1$,
    hence so does the inequality $x_1 < x_2$.
  - Step: $n -> n+1$. As in Example 1.3.2, we have
    $
      x_(n+1) = sqrt(2 + x_n) > sqrt(2 + x_(n-1)) = x_n.
    $
  Now, if $x < 2$, we have $sqrt(2 + x) < sqrt(2 + 2) = sqrt(4) = 2$,
  meaning that $x_n < 2$ for all $n$ (a trivial proof by induction). 
  Thus, $x_n$ is both increasing and bounded above.
  Hence $x_n$ has a limit, say $l$. Taking the limit of both sides of
  $
    x_(n+1)^2 = 2 + x_n
  $
  and applying the aruthmetic property, we have
  $l^2 = 2 + l$ and $l = 2$.
+ We prove $x_(n+1) < x_n$ analogically by induction:
  - Base: $n = 1$. We have
    $
      sqrt(2 + x_1) < x_1 &<==\
      2 + x_1 < x_1^2 &<==\
      x_1^2 - x_1 - 2 > 0 &<==\
      (x_1 + 1)(x_1 - 2) > 0&.
    $
    The last inequality holds for all $x_1 > 2$,
    and hence so does $x_2 <= x_1$.
  - Step: $n -> n+1$. By analogy with Example 1.3.2.
  If $x > 2$, then $sqrt(2 + x) > sqrt(2 + 2) = sqrt(4) = 2$, and so $x_n > 2$ for all $n$.
  Being decreasing and bounded below, $x_n$ has a limit $l$. Similarly to the previous case, the recursive relation $x_(n+1) = sqrt(2 + x_n)$ leads to $l$ being equal to 2.

#math-problem("1.3.12") Explain the _continued fraction expansion_
$
  sqrt(2) = 1 + 1/(2 + 1/(2 + 1/(2 + dots.h.c))).
$
What if 2 on the right side is changed to some other positive number?

#math-solution As in Example 1.3.2, this "infinite fraction" can be thought of as the limit of a recursive sequence, in this case with the property
$
  x_(n+1) = 1 + 1/(1 + x_n).
$
The initial term, $x_1$, we will set to an arbitrary positive number.
Our task is to prove that the resulting sequence converges to $sqrt(2)$.

First, we see that, since $0 < 1 + 1/(1 + x) < 2$ for all $x > 0$, we have $0 < x_n < 2$ for all $n$ (a trivial proof by induction).
That is, the sequence $x_n$ is bounded both above and below.

Consider two subsequences of $x_n$: $y_n = x_(2n-1)$ and $z_n = x_(2n)$.
If $y_(n+1) <= y_n$, then we have
$
  y_(n+2) = 1 + 1/(2 + 1/(1 + y_(n+1))) <= 1 + 1/(2 + 1/(1 + y_n)) = y_(n+1).
$
Similarly, if $y_(n+1) >= y_n$, then $y_(n+2) >= y_(n+1)$.
The same applies to $z_n$. In other words, both $y_n$ and $z_n$ are monotonous. Since they are also bounded, they both have limits, $l_1$ and $l_2$. Both of these numbers have to satisfy the equation
$
  x = 1 + 1/(2 + 1/(1 + x)),
$
by the logic of taking the limit of both sides of the recursive property of $y_n$ and $z_n$. Finally, we see with trivial algebra that the only positive root of this equation is $sqrt(2)$. Hence, $l_1 = l_2 = sqrt(2)$, which means that the original sequence $x_n$, as a union of $y_n$ and $z_n$, converges to $sqrt(2)$.

#math-problem("1.3.17") Extend Example 1.3.3 to a proof of $limits(lim)_(n -> oo) n^p a^n = 0$ for $abs(a) < 1$.
#math-solution
We first tackle the case when $0 <= a < 1$.
Denote $n^p a^n$ by $x_n$.
Consider the d'Alambertian quotients:
$
  x_(n+1)/x_n = ((n+1)^p a^(n+1))/(n^p a^n) = a (1 + 1/n)^p.
$ <dalam>
For sufficiently large $n$ (say, from $n = N$), the last expression in @dalam will be less than $1$, since $a < 1$ and $(1 + 1/n)^p$ converges to 1. Since all $x_n$ are positive, this means that $x_(n+1) < x_n$ starting from $x = N$. In other words, $x_n$ is decreasing for sufficiently large $n$. Since it is also bounded below by $0$, we see that $x_n$ has a limit $l$. We have
$
  l = lim_(n -> oo) n^p a^n = a dot lim_(n -> oo) ((n/(n-1))^p (n-1)^p a^(n-1)) = a dot lim_(n -> oo)(1 + 1/(n-1))^p dot lim_(n -> oo) (n-1)^p a^(n-1) =\
  = a dot 1 dot l = a l,
$
from which it follows that $l = 0$, since $a != 1$.

If $-1 < a <= 0$, then we see that $-n^p abs(a)^n <= n^p a^n <= n^p a^n$, and the limit follows from the sandwich rule.

#math-problem("1.3.19 (2)") Find the limit of
$
  (1 - 1/n)^n.
$
#math-solution
We write
$
  (1 - 1/n)^n = ((n-1)/n)^n = 1/(1 + 1/(n-1))^n = (1/(1 + 1/(n-1))^(n-1))^(n/(n-1)) ->_(n -> oo) (1/e)^1 = 1/e,
$
by the arithmetic rule, seeing that $(1 + 1/(n-1))^(n-1) -> e$.

#math-problem("1.3.22") If $x_n$ is a Cauchy sequence, is $abs(x_n)$ also a Cauchy sequence? What about the converse?
#math-solution It is true. Let $x_n$ be a Cauchy sequence. For proving $abs(x_n)$ to be Cauchy, consider an arbitrary $epsilon > 0$. Then, there is $N$ such that $n, m > N$ implies $abs(x_n - x_m) < epsilon$. However, we have the triangle inequality
$
  abs(abs(x_n) - abs(x_m)) <= abs(x_n - x_m),
$
and thus we have
$
  abs(abs(x_n) - abs(x_m)) <= abs(x_n - x_m) < epsilon
$
for $n,m > N$. Hence, $abs(x_n)$ is Cauchy.

The converse fails, as can easily be seen from the example of $x_n = (-1)^n$.

#math-problem("1.3.23 (1,3)") Use the Cauchy criterion to determine the convergence or divergence of
1.  $
      x_n = 1 + 1/sqrt(2) + 1/sqrt(3) + ... + 1/sqrt(n);
    $

3.  $
      x_n = 1/2 + 2/3 + 3/4 + dots.h.c + (n-1)/n.
    $
#math-solution
1.  With $epsilon = 1/sqrt(2)$, for any $N$ consider $n = N$ and $m = N$. We have
    $
      x_m - x_n = x_(2N) - x_N = 1/sqrt(N+1) + 1/sqrt(N+2) + dots.h.c + 1/sqrt(2N) >= N dot 1/sqrt(2N) = sqrt(N/2) >= epsilon,
    $
    and shus the Cuchy criterion fails.
3.  For all $n > 1$, we have $(n-1)/n >= 1/2$.
    Now, take $epsilon = 1/2$ and for all $N$ take $n = N$ and $m = N+1$. We write
    $
      x_m - x_n = x_(N+1) - x_N = N/(N+1) >= 1/2 = epsilon,
    $
    and thus the Cauchy criterion fails.

#math-problem("1.4.2") Prove that $limits(lim)_(n -> oo) x_n = +oo$ if and only if $x_n > 0$ for sufficiently large $n$ and $limits(lim)_(n -> oo) 1/x_n = 0$.
#math-solution
/ $==>:$: Since $x_n > B$ for sufficiently large $n$, this also applies for $B = 0$, meaning that $x_n > 0$ for sufficiently large $n$. Then, for all $epsilon > 0$, we have $x_n > 1/epsilon$ for sufficiently large $n$, and thus $1/x_n < epsilon$. Therefore, $1/x_n$ converges to 0.
/ $<==:$: Let $B$ be a real number. If $B <= 0$, we have $x_n > 0 >= B$ for sufficiently large $n$. If $B > 0$, then there is $N$ such that $n > N$ implies $1/x_n < 1/B$, or $x_n > B$. Hence, $x_n$ diverges to $+oo$.

#math-problem("1.4.3 (1,3)") Rigorously prove divergence to infinity. Determine $plus.minus oo$ if possible:
1.  $
      x_n = (n^2 - n + 1)/(n+1);
    $
3.  $
      x_n = a^n/n, #h(5mm) abs(a) > 1.
    $

#math-solution
1.  We have
    $
      (n^2 - n + 1)/(n+1) = n - (2n - 1)/(n+1) > n - 2,
    $
    which is greater than any $B$ chosen in advance, for sufficiently large $n$. Hence, the sequence diverges to $+oo$.
3.  We first tackle the case where $a > 0$.
    Consider $y_n = 1/x_n = n (1/a)^n$.
    Since $abs(1/a) < 1$, we see that $y_n ->_(n -> oo) 0$ as per Exercise 1.3.17.
    Moreover, $y_n$ is obviously positive for all $n$.
    Thus, by Exercise 1.4.2 we have that $x_n$ diverges to $+oo$.

    If $a < 0$, then the subsequences of odd and even terms,
    $x_(2n-1)$ and $x_(2n)$, diverge to $-oo$ and $+oo$ respectively,
    which is seen by applying the logic of the previous case.
    Hence, the sequence $x_n$ diverges to $oo$, but the sign cannot be determined.

#math-problem("1.4.6 (2)") Prove the extended arithmetic rule $l + (+oo) = +oo$.\
#math-solution
Let $x_n ->_(n -> oo) l in RR$ and $y_n ->_(n -> oo) +oo$.
We are tasked with proving that $(x_n + y_n) ->_(n -> oo) +oo$.
Let $B in RR$ be arbitrary.
For sufficiently large $n$, we have $x_n > l-1$ and $y_n > B - (l-1)$.
Hence,
$
  x_n + y_n > l-1 + B - (l-1) = B,
$
q.e.d.

#math-problem("1.4.7") Construct sequences $x_n$ and $y_n$, such that both diverge to infinity, but $x_n + y_n$ can have any of the following behaviors:
+ $limits(lim)_(n -> oo) (x_n + y_n) = oo$;
+ $limits(lim)_(n -> oo) (x_n + y_n) = 2$;
+ $x_n + y_n$ is bounded but does not converge.
#math-solution
+ Take $x_n = y_n = (-1)^n n -> oo$.
  We have $x_n + y_n = 2 dot (-1)^n n -> oo$.
+ Take $x_n = n -> +oo$, #h(2mm) $y_n = 2-n -> -oo$.
  Their sum equals $2$ for all $n$ and thus converges to $2$.
+ Take $x_n = n -> +oo$, #h(2mm) $y_n = -n + (-1)^n < -n+1 -> -oo$.
  Then, $x_n + y_n = (-1)^n$, which is bounded but does not converge.

#math-problem("1.4.10") Prove the extended orger rule: If $limits(lim)_(n -> oo) x_n = l in RR$ and $limits(lim)_(n -> oo) y_n = +oo$, then $x_n < y_n$ for sufficiently large $n$.\
#math-solution
For sufficiently large $n$ (say, for $n > N_1$), we have $abs(x_n - l) < 1$ and thus $x_n < l + 1$.
Also, for sufficiently large $n$ (say, for $n > N_2$) we have $y_n > l+1$.
Then, for $n > max(N_1, N_2)$
$
  x_n < l+1 < y_n,
$
q.e.d.

#math-problem("1.4.12") Prove that $limits(lim)_(n -> oo) x_(n+1)/x_n = l$ and $abs(l) > 1$, then $x_n$ diverges to infinity.\
#math-solution
// Consider the sequence $y_n = abs(x_n)$.
We easily see that
$
  limits(lim)_(n -> oo) abs(x_(n+1))/abs(x_n) = limits(lim)_(n -> oo) abs(x_(n+1)/x_n) = abs(l) > 1.
$
Hence, by the order rule, we have $abs(x_(n+1))/abs(x_n) > a > 1$ for sufficiently large $n$, where $1 < a < abs(l)$. Say that this holds for $n > N$. Then, for such $n$, we can write
$
  abs(x_n) = abs(x_N) dot abs(x_(N+1))/abs(x_N) dot ... dot abs(x_n)/abs(x_(n-1)) > abs(x_N) dot a^(n - N) -> +oo.
$
Therefore, we see that $abs(x_n)$ diverges to $+oo$, and thus $x_n$ diverges to $oo$.

#math-problem("1.4.13 (2, 4)") Explain the infinities. Determine the sign if possible.
2. $x_n = n!/(a^n + b^n)$, #h(2mm) $a + b != 0$;
4. $x_n = 1/(root(n, n) - root(n, 2n))$.
#math-solution
2.  Consider $y_n = 1/x_n = a^n/n! + b^n/n!$.
    We see that $y_n ->_(n -> oo) 0$, meaning that $x_n$ diverges to $oo$ by the extended arithmetic rule.
    Now, assume without loss of generality that $abs(a) >= abs(b)$.
    If $a > 0$, then $a^n + b^n > 0$ for sufficiently large $n$, and $x_n ->_(n -> oo) +oo$.
    If $a < 0$, then for odd $n$ we have $a^n + b^n < 0$, and thus the sign cannot be determined.
4.  Since
    $
      y_n = 1/x_n = root(n,n) - root(n,2n) ->_(n -> oo) 1 - 1 = 0,
    $
    we have $x_n ->_(n -> oo) oo$ by the extended order rule. Further, we see that $y_n < 0$ for all $n$, meaning that $x_n < 0$ and thus $x_n ->_(n -> oo) -oo$.
