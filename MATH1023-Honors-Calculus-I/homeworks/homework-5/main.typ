#import "@local/common:0.0.0": *
#import "@local/templates:0.0.0": *
#import "@local/drawing:0.0.0": *

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

#math-problem("1.5.2 (2)")
Compute the partial sum and the sum of the series:
$
  /* sum_(n = 1)^oo x_n = */ sum_(n = 1)^oo 1/((a + n d)(a + (n+1)d)).
$
#math-solution
The partial sums are
$
  s_k = sum_(n = 1)^k 1/((a + n d)(a + (n+1)d)) = 1/d sum_(n = 1)^k (1/(a + n d) - 1/(a + (n+1)d)) = 1/d (1/(a+d) - 1/(a + (k+1)d)).
$
The sum is
$
  lim_(k -> oo) s_k = lim_(k -> oo) 1/d (1/(a+d) - 1/(a + (k+1)d)) = 1/(d(a+d)).
$

#math-problem("1.5.5")
Find the partial sum of $sum_(n = 1)^oo n x^n$ by multiplying $1-x$.
Then find the sum.\
#math-solution
Assume that $abs(x) < 1$.
For the partial sum $s_n = x + 2x^2 + 3x^3 + ... + n x^n$ we write
$
  (1-x) s_n = (x + 2x^2 + 3n^3 + ... + n x^n) - (x^2 + 2 x^3 + ... + n x^(n+1)) = x + x^2 + ... + x^n - n x^(n+1) =\ = x((1 - x^n)/(1-x) - n x^n),\
  s_n = (x(1 - (n+1)x^n + n x^(n+1)))/(1-x)^2.
$
The sum will calculate as follows:
$
  sum_(n = 1)^oo n x^n = lim_(n -> oo) s_n = lim_(n -> oo) (x(1 - (n+1)x^n + n x^(n+1)))/(1-x)^2 = x/(1-x)^2.
$
If $abs(x) >= 1$, then the derivation of the partial sums doesn't change, however, the series will diverge, since $n x^n$ will not approach zero.

#math-problem("1.5.7")
Find the area of the Sierpinski carpet.\
#math-solution
Let $K$ denote the Sierpinski carpet and $K_n$ ($n = 1, 2, ...$) denote the intermediate shapes.
For a shape $X$ let $S(X)$ denote its area.
For $K_n$, we have $S(K_(n+1)) = 8/9 dot S(K_n)$, since every iteration removes one square out of nine:
#figure(
  cz.canvas(
    length: 4cm,
    {
      import cz.draw: *

      let fillcolor = luma(170)
      let drawcarpet(pos, scale, first-call, iter) = {
        if (first-call) {
          rect(
            (pos.at(0)-scale*.5, pos.at(1)-scale*.5),
            (pos.at(0)+scale*.5, pos.at(1)+scale*.5),
            fill: fillcolor
          )
        }
        if (iter > 0) {
          rect(
            (pos.at(0)-scale/3*.5, pos.at(1)-scale/3*.5),
            (pos.at(0)+scale/3*.5, pos.at(1)+scale/3*.5),
            fill: white
          )

          line(
            (pos.at(0)-scale*.5, pos.at(1)+scale/3*.5),
            (pos.at(0)-scale/3*.5, pos.at(1)+scale/3*.5),
            stroke: (paint: luma(100), dash: "dashed"),
            mark: (end: none)
          )
          line(
            (pos.at(0)-scale/3*.5, pos.at(1)+scale*.5),
            (pos.at(0)-scale/3*.5, pos.at(1)+scale/3*.5),
            stroke: (paint: luma(100), dash: "dashed"),
            mark: (end: none)
          )
          line(
            (pos.at(0)+scale/3*.5, pos.at(1)+scale*.5),
            (pos.at(0)+scale/3*.5, pos.at(1)+scale/3*.5),
            stroke: (paint: luma(100), dash: "dashed"),
            mark: (end: none)
          )
          line(
            (pos.at(0)+scale*.5, pos.at(1)+scale/3*.5),
            (pos.at(0)+scale/3*.5, pos.at(1)+scale/3*.5),
            stroke: (paint: luma(100), dash: "dashed"),
            mark: (end: none)
          )
          line(
            (pos.at(0)+scale*.5, pos.at(1)-scale/3*.5),
            (pos.at(0)+scale/3*.5, pos.at(1)-scale/3*.5),
            stroke: (paint: luma(100), dash: "dashed"),
            mark: (end: none)
          )
          line(
            (pos.at(0)+scale/3*.5, pos.at(1)-scale*.5),
            (pos.at(0)+scale/3*.5, pos.at(1)-scale/3*.5),
            stroke: (paint: luma(100), dash: "dashed"),
            mark: (end: none)
          )
          line(
            (pos.at(0)-scale/3*.5, pos.at(1)-scale*.5),
            (pos.at(0)-scale/3*.5, pos.at(1)-scale/3*.5),
            stroke: (paint: luma(100), dash: "dashed"),
            mark: (end: none)
          )
          line(
            (pos.at(0)-scale*.5, pos.at(1)-scale/3*.5),
            (pos.at(0)-scale/3*.5, pos.at(1)-scale/3*.5),
            stroke: (paint: luma(100), dash: "dashed"),
            mark: (end: none)
          )

          let dx = scale/3
          let dy = scale/3
          drawcarpet((pos.at(0)+dx, pos.at(1)-dy), scale/3, false, iter - 1)
          drawcarpet((pos.at(0)+dx, pos.at(1)+.0), scale/3, false, iter - 1)
          drawcarpet((pos.at(0)+dx, pos.at(1)+dy), scale/3, false, iter - 1)
          drawcarpet((pos.at(0)+.0, pos.at(1)+dy), scale/3, false, iter - 1)
          drawcarpet((pos.at(0)-dx, pos.at(1)+dy), scale/3, false, iter - 1)
          drawcarpet((pos.at(0)-dx, pos.at(1)+.0), scale/3, false, iter - 1)
          drawcarpet((pos.at(0)-dx, pos.at(1)-dy), scale/3, false, iter - 1)
          drawcarpet((pos.at(0)+.0, pos.at(1)-dy), scale/3, false, iter - 1)
        }
      }

      set-style(mark: (end: "stealth"))  

      drawcarpet((-1.5,0), 1, true, 0)
      content((-1.5, -.65), [ $S = 1$ ])
      line((-.9,0), (-.6, 0))
      drawcarpet((0,0), 1, true, 1)
      content((0, -.65), [ $S = 8/9$ ])
      line((.6,0), (.9, 0))
      drawcarpet((1.5,0), 1, true, 2)
      content((1.5, -.65), [ $S = (8/9)^2$ ])
    }
  ),
  gap: 0.6cm,
  caption: "The areas of Sierpinski carpet iterations"
) <sierpinski>
Hence, we see that $S(K_n) = (8/9)^n ->_(n -> oo) 0$.
Now, since $K$ is contained in every $K_n$, we see that\
$S(K) <= S(K_n)$ for every $n$. Therefore, $S(K) = 0$.

#math-problem("1.5.11")
Prove that if $a_n > 0$ and $sum_(n = 1)^oo a_n$ converges, then $sum_(n = 1)^oo a_n^2$ converges. Moreover, prove that the converse is not true.\
#math-solution
Since $sum a_n$ converges, we see that $a_n ->_(n -> oo) 0$, meaning that $a_n < 1$ for sufficiently large $n$. For such $n$, we have $a_n^2 < a_n$. Hence, by the comparison test, we conclude that $sum a_n^2$ converges as well.\
The converse is not true, as shown by the example $a_n = 1/n$. We have that $sum a_n^2$ converges, while $sum a_n$ diverges.

#math-problem("1.5.14 (2, 5)")
Determine the convergence, $b, d, p, q > 0$:
2. $ sum (3n^2 - 2n^3)/(sqrt(4n^5 + 5n^4)); $
5. $ sum (c + n d)^q/(a + n b)^p. $

#math-solution
2. Consider the square of the common term:
  $
    x_n^2 = (2n^3 - 3n^2)^2/(4n^5 + 5n^4) =
    (4n^6 - 12n^5 + 9n^4)/(4n^5 + 5n^4).
  $
  This is a rational expression where the degree of the polynomial in the numerator is greater than the that of the polynomial in the denominator.
  Hence, $x_n^2$ diverges to infinity.
  As a consequence, $x_n$ diverges as well, and we see that the series diverges since the necessary condition that $x_n ->_(n -> oo) 0$ fails.

5. We manipulate the common term as follows:
  $
    x_n = (c + n d)^q/(a + n b)^p = n^(q-p) (c/n + d)^q/(a/n + b)^p = n^(q-p) dot A_n.
  $
  The multiplier $A_n$ converges to $d^q/b^p$, and can thus be bounded below and above by $mu = 1/2 d^q/b^p$ and $nu = 2 d^q/b^p$, respectively (for sufficiently large $n$).
  Now, if $q - p < alpha < -1$ for some $alpha$, then we have
  $
    sum_(n = 1)^oo x_n <= sum_(n = 1)^oo nu/n^alpha,
  $
  and the series converges by the comparison test.

  If, however, $q - p >= 1$, then we have
  $
    sum_(n = 1)^oo x_n >= sum_(n = 1)^oo mu/n,
  $
  and the series diverges by the converse of the comparison test.

#math-problem("1.5.17 (3)")
Determine the convergence of
$
  sum (5^(n-1) - n^2 2^n)/(3^(n+1)).
$
#math-solution
The common term can be expressed as
$
  x_n = (5^(n-1) - n^2 2^n)/(3^(n+1)) = 1/15 dot (5/3)^n - 1/3 dot n^2 dot (2/3)^n.
$
The right part of the resulting difference converges to 0 (since $2/3 < 1$), while the left part diverges to infinity (since $5/3 > 1$). Hence, $x_n$ diverges to infinity, and the series diverges due to the failure of the necessary condition that $x_n ->_(n -> oo) 0$.

#math-problem("1.5.18 (2)")
Determine the convergence of
$
  sum n x^(n^2).
$
#math-solution
If $abs(x) >= 1$, then the series obviously diverges, since the common term does not converge to 0. Otherwise, we have $abs(x) < 1$.
// It immediately follows from the comparison test that if $sum abs(x_n)$ converges, then $sum x_n$ converges (by taking $y_n = abs(x_n)$).
We recall that the series $sum n abs(x)^n$ converges, as was shown in Exercise 1.5.5.
Now, since $abs(x) < 1$, we write
$
  abs(n x^(n^2)) = n abs(x)^(n^2) <= n abs(x)^n,
$
and conclude the convergence of the original series due to the convergence test.

#math-problem("1.5.19 (1, 5)")
Determine the convergence, $a, b > 0$:
1. $ sum_(n = 0)^oo (a^n + b^n)^p; $
5. $ sum_(n = 1)^oo n^p/(a + b/n)^n. $
#math-solution
1. If either of $a, b$ equals or exceeds $1$ (say, $a$), then we have
  $
    sum (a^n + b^n)^p >= sum (a^p)^n = +oo,
  $
  and the series diverges.

  If both $a$ and $b$ lie in the interval $(0,1)$, then we have
  $
    sum_(n = 0)^oo (a^n + b^n)^p <= sum_(n = 0)^oo (2 dot max(a,b)^n)^p = 2^p dot sum_(n = 0)^oo (max(a,b)^p)^n = 2^p dot 1/(1 - max(a,b)^p),
  $
  and the series converges by the comparison test.

5. Consider three cases for $a$:
  - $0 < a < 1$.
    Then, for sufficiently large $n$, we have $b/n < (1-a)/2$ and
    $a + b/n < a + (1-a)/2 = 1 - (1-a)/2 = alpha < 1$. Then, we have
    $
      n^p/(a + b/n)^n >= n^p (1/alpha)^n.
    $
    Since the series of the right terms diverges (as $1/alpha > 1$ and $n^p (1/alpha)^n ->_(n -> oo) +oo$), the series of the left terms must diverge as well.

  - $a = 1$. Then, if $p >= -1$, then we have
    $
      (a + b/n)^n = (1 + b/n)^n = ((1 + 1/(n\/b))^(n\/b))^b < e^b,
    $
    and therefore
    $
      sum n^p/(a + b/n)^n >= sum n^p/e^b >= sum 1/(e^b dot n) = +oo,
    $
    and the series diverges. If, however, $p < -1$, then we write
    $
      sum n^p/(1 + n/b)^n <= sum n^p,
    $
    and the former series converges by the comparison test, since the latter series converges.

  - $a > 1$. We again consider different cases for $p$. If $p <= 1$, we write
    $
      sum n^p/(a + b/n)^n <= sum n^p/a^n <= sum n dot (1/a)^n.
    $
    The convergence of the last series has been established in Exercise 1.5.5, and so the original series converges as well, by the comparison test.

    If $p > 1$, we do a trick:
    $
      n^p/a^n = (n/(a^(1\/p))^n)^p.
    $
    Since $alpha = a^(1\/p)$ is still greater than 1,
    we have $n/(alpha^n) = n dot (1/alpha)^n ->_(n -> oo) 0$,
    and so $n/alpha^n < 1$ for sufficiently large $n$.
    Since $p > 1$, for such $n$ we also have $(n/alpha^n)^p < n/alpha^n$.
    Finally, we write
    $
      n^p/(a + b/n)^n <= n^p/a^n = (n/alpha^n)^p <= n/alpha^n,
    $
    and then apply the comparison test to conclude that the original series converges.

#math-problem("1.5.20 (2)")
Determine convergence:
$
  2/4 + (2 dot 6)/(4 dot 7) +  (2 dot 6 dot 10)/(4 dot 7 dot 10) + dots.h.c .
$
#math-solution
Seeing through the pattern, we recognize this as
$
  sum_(n = 0)^oo (2 dot 6 dot ... dot (2 + 4n))/(4 dot 7 dot ... dot (4 + 3n)) = sum_(n = 0)^oo (product_(k = 0)^n (2 + 4n)/(4 + 3n))
$
Consider the ratio of consecutive terms (here $x_n$ are the terms of the series):
$
  x_n/x_(n-1) = (2+4n)/(4+3n).
$
We see that $x_n/x_(n-1)$ converges to $4/3 > 1$. As a consequence, there is a number $alpha$ such that $1 < alpha < 4/3$ and for sufficiently large $n$ (say, from $n = N$) we have
$
  x_n/x_(n-1) > alpha.
$
Now, for $n > N$
$
  x_n = x_N dot x_(N+1)/x_N dot ... dot x_n/x_(n-1) > x_N dot alpha^(n-N) ->_(n -> oo) +oo.
$
Hence $x_n$ diverges to $+oo$, and thus the series $sum x_n$ diverges, since the necessary condition that $x_n -> 0$ fails.

#math-problem("1.5.21 (4)")
Determine convergence:
$
  sum_(n = 1)^oo ((a+c)(a+2c)^2 dots.h.c (a+n c)^n)/((b+d)(b+2d)^2 dots.h.c (b+n d)^n).
$
#math-solution
Consider the ratio of consecutive terms:
$
  x_n/x_(n-1) = (a + n c)^n/(b + n d)^n = ((c + a/n)/(d + b/n))^n, // = (c/d)^n dot ((1 + 1/(n dot c/a))^(n dot c/a))^(a\/c) dot ((1 + 1/(n dot d/b))^(n dot d/b))^(-b\/d)
$
where $x_n$ are the terms of the series.
First, assume that $abs(c) < abs(d)$. Then we see that
$
  abs((c + a/n)/(d + b/n)) ->_(n -> oo) abs(c/d) < 1.
$
Then there is $alpha$ such that $abs(c\/d) < alpha < 1$ and for sufficiently large $n$ (say, from $n > N$), we have
$
  abs(x_n/x_(n-1)) = abs((c + a/n)/(d + b/n))^n < alpha^n < alpha.
$
// for some $abs(c\/d) < alpha < 1$.
As a result, we can bound $x_n$ above by $x_N dot alpha^(n-N)$, and the original series converges by the comparison test, since $sum alpha^n$ converges.

Now, let $abs(c) >= abs(d)$. We will have to consider some more cases:
- $d = 0$. Then $b != 0$, and we consider another couple of cases:
  + $c = 0$. Then the ratio $x_n\/x_(n-1)$ reduces to $(a\/b)^n$.
    If $abs(a) < abs(b)$, then the series converges,
    by the same reason we provided in the case $abs(c) < abs(d)$.
    If $a = b$, then $x_n = 1$ for all $n$, and thus the series diverges to $+oo$.
    If $abs(a) > abs(b)$, then
    $
      abs(x_n/x_(n-1)) = abs(a/b)^n > abs(a/b) > 1,\
      abs(x_n) = abs(x_1) dot abs(x_2/x_1) dot ... dot abs(x_n/x_(n-1)) > abs(a/b)^n ->_(n -> oo) +oo,
    $
    and therefore $abs(x_n)$ diverges to $+oo$, which means that the series diverges as well.
  + $c != 0$. Then we have
    $
      abs(x_n/x_(n-1)) = abs((a + c n)/b)^n ->_(n -> oo) +oo,
    $
    which again means that the series diverges, by logic similar to the previous case (where $abs(a) > abs(b)$).

- $d != 0$. Then $c != 0$, since $abs(c) >= abs(d) > 0$.
  Another couple of cases:
    + $abs(c) > abs(d)$. Then, since
      $
        abs((c + a/n)/(d + b/n)) ->_(n -> oo) abs(c/d) > 1,
      $
      we have that $abs(x_n/x_(n-1)) > alpha > 1$ for some $alpha$, for sufficiently large $n$.
      Again, the series diverges, by logic similar to previous cases.
    + $c = d$.
      Denote $f = c = d$. We will require the following lemma:
      #lm(numbering: "1.")[
        For all $x in RR$, we have the convergence
        $
          (1 + x/n)^n ->_(n -> oo) e^x.
        $
      ]
      #pf[
        If $x = 0$, then the result is obvious, a constant sequence converging to $1 = e^0$. If $x > 0$, then
        $
          (1 + x/n)^n = ((1 + 1/(n\/x))^(n\/x))^x = ((1 + 1/k)^k)^x ->_(k -> oo) e^x.
        $
        Here we do a substitution $k = n\/x$. This is justified since $n -> oo$ if and only if $k -> oo$.

        If $x < 0$, then we write
        $
          (1 + x/n)^n = (1 - (-x)/n)^n = ((1 - 1/(-n\/x))^(-n\/x))^(-x) = ((1 - 1/k)^k)^(-x) ->_(k -> oo) (1/e)^(-x) = e^x,
        $
        substituting $-n\/x$ with $k$.
      ]
      #note(numbering: "1.")[
        The formulation of the lemma is usually taken as the _definition_ of the function $exp(x) = e^x$, and subsequently for defining real number exponentiation. If the present course adopts the same approach, the lemma is unnecessary. Plus, prof. Yan Min claimed that putting this exercise at this stage of the course was a mistake, since we haven't learned the right tools yet. If my reasoning is insufficiently rigorous, all questions to him.
      ]
      With this statement, we write
      $
        abs(x_n/x_(n-1)) = abs((f + a/n)/(f + b/n))^n = abs((1 + (a\/f)/n)/(1 + (b\/f)/n))^n ->_(n -> oo) e^(a\/f)/e^(b\/f) = e^((a-b)/f)
      $
      If $a = b$, then all of the terms $x_n$ equal 1, and the series diverges.\
      If $(a-b)f < 0$, then we have
      $
        abs(x_n/(x_(n-1))) < alpha < 1
      $
      for some $alpha$ for sufficiently large $n$, since $e^((a-b)/f) < 1$. In this case, the series converges by logic already stated before.\
      If $(a-b)f > 0$, then for some $alpha$ we will have
      $
        abs(x_n/x_(n-1)) > alpha > 1
      $
      for sufficiently large $n$. This means that $x_n$ does not converge to 0, and thus the series diverges.\
      This concludes the cases.
*So, what's the result?* The series converges in the following cases and only then:
+ $abs(c) < abs(d)$;
+ $c = d = 0$ and $abs(a) < abs(b)$;
+ $c = d$ and $(a-b)d < 0$.

#math-problem("1.5.22 (4, 5)")
Determine convergence. There might be values of $x$ for which no conclusion can yet be made.
4. $ sum n^n/n! x^n; $
5. $ sum n!/n^n x^n. $
#math-solution
4. Consider the ratio of consecutive terms:
  $
    x_(n+1)/x_n = ((n+1)^(n+1)/(n+1)! x^(n+1))/(n^n/n! x^n) = x (1 + 1/n)^n ->_(n -> oo) e dot x.
  $
  If $abs(x) < 1/e$, then we see that
  $
    lim_(n -> oo) abs(x_(n+1)/x_n) = e dot abs(x) < 1,
  $
  meaning that the series converges.\
  If $abs(x) = 1/e$, then the series diverges, but the proof requires integration techniques we now lack.\
  If $abs(x) > 1/e$, then for sufficiently large $n$
  $
    abs(x_(n+1)/x_n) > 1,
  $
  meaning that $x_n$ does not converge to 0, and the series diverges.

#math-problem("1.6.5") Prove that $limits(lim)_(n -> oo) (x_n,y_n) = (k,l)$ with respect to the $L^1$-norm if and only if $limits(lim)_(n -> oo) x_n = k$ and $limits(lim)_(n -> oo) y_n = l$.\
#math-solution
/ $==>:$: Assume $limits(lim)_(n -> oo) (x_n, y_n) = (k,l)$.
  We will prove that $limits(lim)_(n -> oo) x_n = k$.
  Let $epsilon > 0$ be arbitrary. Then there is $N$ such that $n > N$ implies
  $
    norm((x_n, y_n) - (k,l))_1 = abs(x_n - k) + abs(y_n - l) < epsilon.
  $
  Consequently, $abs(x_n - k) < epsilon$ for $n > N$. Hence, $x_n$ converges to $k$.\
  Similarly, $y_n$ also converges to $l$, by the same logic (or by symmetry).

/ $<==:$: Assume $limits(lim)_(n -> oo) x_n = k$ and $limits(lim)_(n -> oo) y_n = l$.
  Let $epsilon > 0$ be freely chosen.
  For $delta = epsilon/2$, we have $N_1$ and $N_2$ such that
  $
    n > N_1 ==> abs(x_n - k) < delta
    #h(1cm)
    "and"
    #h(1cm)
    n > N_2 ==> abs(y_n - l) < delta.
  $
  Hence, for $n > N = max(N_1, N_2)$ we have
  $
    norm((x_n, y_n) - (k,l))_1 = abs(x_n - k) + abs(y_n - l) < 2 delta = epsilon.
  $
  Therefore, $(x_n, y_n)$ converges to $(k,l)$.

#math-problem("1.6.8") Extend the relation between the $L^2$-norm and the $L^oo$-norm on $RR^n$.\
#math-solution
First of all, we see that
$
  norm(arrow(x))_oo = max_(1 <= k <= n) abs(x_k) = sqrt((max_(1 <= k <= n) abs(x_k))^2) <= sqrt(sum_(k = 1)^n x_k^2) = norm(arrow(x))_2.
$
On the other hand,
$
  norm(arrow(x))_2 = sqrt(sum_(k = 1)^n x_k^2) <= sqrt(n dot (max_(1 <= k <= n) x_k)^2) = sqrt(n) dot norm(arrow(x))_oo.
$
