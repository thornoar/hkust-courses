#import "@local/common:0.0.0": *
#import "@local/templates:0.0.0": *

#import "@local/theorem:0.0.0": *
#let thmstyle = thmstyle.with(base: none)
#show: thmrules
#let args = (base: none, titlefmt: it => underline(strong(it)))

#let lm = statestyle("lemma", "Lemma", ..args)
#let def = plainstyle("definition", "Definition", ..args)
#let note = plainstyle("note", "Note", ..args)

#show: math-preamble("Part 3", "Fri, Sep 27")
#set math.equation(supplement: "Formula", numbering: "(1)")
#show: equate.with(sub-numbering: false, number-mode: "label")

#attention(color: black, font: none, title: [*PLEASE READ*])[
  When proving $x_n scripts(->)_(n -> oo) l$ using the formal definition of limit, it is sufficient to show that for every $epsilon > 0$ _there exists_ $N$, such that $abs(x_n - l) < epsilon$ for $n > N$. It is _not required_ to provide _the exact value_ for $N$. For example, proving that $1/sqrt(n) -> 0$ by saying that $1/n < delta^2$ for sufficiently large $n$ for all $delta > 0$ (with a formal definition of "sufficiently large") is sound mathematical logic based on the convergence of $1/n$ to 0, and I will appeal if you count this as a mistake. Providing exact values of $N$ is redundant and it runs against the whole intuition of limit --- that it doesn't matter how many first terms to exclude, as long as the desired behavior is achieved starting _from some point._
]

We will now give a rigorous definition for "sufficiently large", in order to simplify our proofs.

#def[
  Let $P(n)$ be a predicate on the set of natural numbers $NN$, that is, $P(n)$ is either tue or false for all $n$. We say that $P(n)$ holds _for sufficiently large $n$,_ if there exists $N in NN$ such that $n > N$ implies the truth of $P(n)$.
]

#note[
  We will assume throughout the proofs that for all $a in RR$, $a < n$ for sufficiently large $n$, and for all $a > 0$, $1/n < a$ for sufficiently large $n$. These two statements are trivial and they follow from the formal convergence of $1/n$ to 0.
]

#note[
  The definition of limit can be re-formulated as follows:
  #centering[
    $limits(lim)_(n -> oo) x_n = l <==> $ for all $epsilon > 0$, $abs(x_n - l) < epsilon$ for sufficiently large $n$.
  ]
  In fact, this definition is perfectly identical to the traditional one, but it is more convenient in proofs.
]

#lm[
  If predicates $P(n)$ and $Q(n)$ both hold for sufficiently large $n$, then their conjunction also holds for sufficiently large $n$.
] <conj>
#pf[
  Let $N_P$ be such that $n > N_P$ implies $P(n)$, and $N_Q$ be such that $n > N_Q$ implies $Q(n)$. Take $N = max{N_P, N_Q}$. Now, for $n > N$ we have both $n > N_P$ and $n > N_Q$, and thus the conjunction $P(n) and Q(n)$ holds.
]

#math-problem("1.2.1 (1)") Explain $1/2 n^2 < n^2 + (-1)^n n - 5 < 2 n^2$ for sufficiently large $n$.\
#math-solution The left inequality is equivalent to
$
  (-1)^(n+1)n + 5 < 1/2 n^2.
$
For sufficiently large $n$, we have $5 < n$ and $4\/n < 1$ (since $4\/n -> 0$). Thus,
$
  (-1)^(n+1)n + 5 <= abs((-1)^(n+1)n + 5) <= n + 5 < 2n = (2n^2)/(n) = 4/n dot 1/2 n^2 < 1/2 n^2.
$
It immediately follows that
$
  (-1)^n n - 5 <= abs((-1)^n n - 5) = abs((-1)^(n+1) n + 5) < 1/2 n^2 < n^2,\
  n^2 + (-1)^n n - 5 < 1/2 n^2 < 2n^2,\
$
proving the right inequality as well.

#math-problem("1.2.2 (3)") Rigorously find the limit of
$
  (2 n^2 - 3n + 2)/(3 n^2 - 4n + 1).
$
#math-solution We claim that the limit is $2\/3$. To prove this, consider an arbitrarily small $epsilon > 0$. For sufficiently large $n$, we have
$
  abs((2 n^2 - 3n + 2)/(3 n^2 - 4n + 1) - 2/3) = (4/3 n - 1/3)/(3 n^2 - 4 n + 1) < (2n)/(2n^2) = 1/n,
$
which is less than $epsilon$ for sufficiently large $n$, since $1/n ->_(n -> oo) 0$. Hence, by @conj the given sequence indeed tends to $2/3$.

#math-problem("1.2.2 (6)") Rigorously find the limit of
$
  (sqrt(n) + a)/(n+b).
$
#math-solution We claim that the limit is 0. Consider an arbitrary $delta > 0$. For sufficiently large $n$, we have\ $0 < sqrt(n) + a < 2 sqrt(n)$, #h(.15cm) $n + b > 1/2 n$, #h(.1cm) and $1\/n < (delta\/4)^2$. Taking $N$ to be the maximum of the respective thresholds ($N = max {N_1, N_2, N_3}$), we can see that all three properties hold for $n > N$. Now, for such $n$ we have
$
  abs((sqrt(n) + a)/(n + b) - 0) = (sqrt(n) + a)/(n + b) < (2 sqrt(n))/(1/2 n) = 4 1/sqrt(n) < delta,
$
and we are done.

#math-problem("1.2.4 (3)") Rigorously find the limit of
$
  sqrt(n + a) - sqrt(n + b)
$
#math-solution Let $delta > 0$ be arbitrary. Without loss of generality, assume that $a > b$. Now, for sufficiently large $n$ we have
$
  abs(sqrt(n + a) - sqrt(n + b) - 0) = ((sqrt(n+a) - sqrt(n+b))(sqrt(n+a) + sqrt(n+b)))/(sqrt(n+a) + sqrt(n+b)) = (a-b)/(sqrt(n+a) + sqrt(n+b)) < (2(a-b))/sqrt(n) < delta,
$
because
$
  1/n < (delta/(2(a-b)))^2
$
for sufficiently large $n$. Therefore, $sqrt(n+a) - sqrt(n+b) ->_(n -> oo) 0$.

If we have $a < b$, then we write
$
  sqrt(n + a) - sqrt(n + b) = -(sqrt(n+b) - sqrt(n+a)) ->_(n -> oo) -0 = 0,
$
reducing the problem to a case we already considered.

#math-problem("1.2.7") Rigorously prove $limits(lim)_(n -> oo) n^5.4/n! = 0$. Then prove $limits(lim)_(n -> oo) n^p/n! = 0$.\
#math-solution We will first prove that $n^m/n! ->_(n -> oo) 0$, where $m$ is a positive integer. Let $delta > 0$. We write
$
  n^m/n! &= n/n dot n/(n-1) dot ... dot n/(n-(m-1)) dot 1/(n-m)!\
         &= (1 + 1/(n-1)) (1 + 1/(n-2)) ... (1 + 1/(n-(m-1))) dot 1/(n-m)!\
         &<= m (1 + 1/(n - m)) dot 1/(n-m)!.
$
For sufficiently large $n$, $1/(n-m)!$ will be less than $delta\/(2m)$ (since $1/(n-m)! <= 1/(n-m)$) and $1/(n-m)$ will be less than 1. Consequently, we have
$
  m (1 + 1/(n - m)) dot 1/(n-m)! < m dot (1 + 1) dot delta/(2m) = delta
$
for sufficiently large $n$, which proves that $n^m/n!$ approaches 0.

We will now return to the solution. Let $delta > 0$ be freely chosen. Write
$
  n^5.4/n! <= n^6/n! < delta,
$
where the last inequality holds for sufficiently large $n$ since $n^6/n! -> 0$. This proves that $n^5.4/n!$ also tends to 0.

As for the general case $p in RR$, we employ a similar tactic. There is a positive integer $m$ such that $p < m$. Similarly, we have
$
  n^p/n! < n^m/n! < delta
$
for sufficiently large $n$, where $delta > 0$ is arbitrarily chosen in advance. Hence, $n^p/n! -> 0$.

#math-problem("1.2.9") Rigorously prove $limits(lim)_(n -> oo) n!/(n^n) = 0$.\
#math-solution Let $epsilon > 0$ be arbitrary. We simply write
$
  n!/(n^n) = 1/n dot 2/n dot ... dot (n-1)/n dot n/n <= 1/n < epsilon
$
for sufficiently large $n$, since $1\/n -> 0$. Hence the given limit is also 0.

#math-problem("1.2.10") Prove that if $limits(lim)_(n -> oo) x_n = l$, then $limits(lim)_(n -> oo) abs(x_n) = abs(l)$.\
#math-solution Consider an $epsilon > 0$. For sufficiently large $n$, we have $abs(x_n - l) < epsilon$. Additionally, we have the triangle inequalities for $x_n$ and $l$:
$
  abs(x_n) <= abs(l) + abs(x_n - l) ==> abs(x_n) - abs(l) <= abs(x_n - l),\
  abs(l) <= abs(x_n) + abs(l - x_n) ==> abs(l) - abs(x_n) <= abs(x_n - l).\
$
Combining these two inequalities, we see that $abs(abs(x_n) - abs(l)) <= abs(x_n - abs(l))$. Finally, we write
$
  abs(abs(x_n) - abs(l)) <= abs(x_n - l) < epsilon
$
for sufficiently large $n$, proving that $abs(x_n) ->_(n -> oo) abs(l)$.

#math-problem("1.2.13") Suppose $limits(lim)_(n -> oo) x_n = 0$.
+ If $x_n >= 0$, prove that $limits(lim)_(n -> oo) sqrt(x_n) = 0$.
+ If $x_n >= 0$ and $p > 0$, prove thath $limits(lim)_(n -> oo)x_n^p = 0$.
+ Prove that $limits(lim)_(n -> oo) root(3,x_n) = 0$.
#math-solution
+ Let $delta > 0$. Starting at some index, we have $x_n < delta^2$, by the definition of convergence. Then, starting at the same index, we have
  $
    sqrt(x_n) < sqrt(delta^2) = delta,
  $
  and we are done.
+ For sufficiently large $n$, we have $x_n < delta^(1/p)$ and $x_n^p < delta$, where $delta > 0$ is freely chosen in advance. Therefore, $x_n^p -> 0$.
+ For any $delta > 0$, we have $abs(x_n) < delta^3$ starting at some index $n = N$. Thus, we have $abs(root(3,x_n)) = root(3, abs(x_n)) < delta$ starting from the same index $N$.

#math-problem("1.2.16") For $a > 0$, by taking $x_n = y_n - l$ in Example 1.2.13 and Exercise 1.2.15, and using Exercise 1.2.11, rigorously argue that
$
  limits(lim)_(n -> oo) y_n = l ==> limits(lim)_(n -> oo) a^(y_n) = a^l.
$
#math-solution With Example 1.2.13 and Exercise 1.2.15 at hand (Exercise 1.2.15 follows trivially from Example 1.2.13 by cosidering $b = 1\/a$ and arguing that $limits(lim)_(n -> oo) a^(x_n) = limits(lim)_(n -> oo) (1/b)^(x_n) = 1\/(limits(lim)_(n -> oo) b^(x_n)) = 1$), we can conclude that for $x_n -> 0$ and $a > 0$ we have $a^(x_n) -> 1$. Now assume that $y_n -> l$. Defining $x_n$ as $y_n - l$, we see that $x_n -> 0$ and conclude that $a^(x_n) -> 0$. Finally, by using Exercise 1.2.11, we write
$
  a^(y_n) = a^(x_n + l) = a^(x_n) dot a^l -> 1 dot a^l = a^l,
$
and we are done.

#math-problem("1.2.19") Prove that if a sequence $x_n$ converges to $l$, then any subsequence $x_(n_k)$ also converges to $l$.\
#math-solution Consider an arbitrary $epsilon > 0$. Then, since $x_n -> l$, there exists $N in NN$ such that $abs(x_n - l) < epsilon$ for all $n > N$. Take $K = N$. Now, for all $k > K$, we have $n_k >= k > N$, and thus
$
  abs(x_(n_k) - l) < epsilon,
$
q.e.d.

#math-problem("1.2.21") Suppose two sequences $x_n$ and $y_n$ satisfy $x_n = y_(n+K)$ for a constant integer $K$ and sufficiently large $n$. Prove that $limits(lim)_(n -> oo)$ exists iff $limits(lim)_(n -> oo) y_n$ exists and the two limit values are equal.\
#math-solution Suppose that for all $n > M$, we have $x_n = y_(n+K)$. Let $l in RR$ be arbitrary. Assume, for now, that $x_n ->_(n -> oo) l$. We will prove that $y_n$ approaches $l$ as well. Consider some $epsilon > 0$. Then, there is an integer $N$ such that $abs(x_n - l) < epsilon$ for $n > N$. By taking $N' = max{N+K, M+K}$, we have
$
  abs(y_n - l) = abs(x_(n-K) - l) < epsilon,
$
for $n > N'$, since $n - K > N'-K >= N$. This proves that $y_n$ approaches $l$. Conversely, an analogical argument proves that if $y_n$ converges to $l$, then $x_n$ also converges to $l$. Therefore, we have
$
  x_n ->_(n -> oo) l <==> y_n ->_(n -> oo) l,
$
which proves the desired statement. Indeed, if $limits(lim)_(n -> oo) x_n$ exists and is equal to $l$, then $limits(lim)_(n -> oo) y_n$ anso exists and is equal to $l$, and vice versa.

#math-problem("1.2.22 (1)") Prove that the following is equivalent to the definition of $limits(lim)_(n -> oo) x_n = l$:
#[
  #set math.equation(supplement: "Condition")
  $
    #text([
      For any $1 > epsilon > 0$, there is $N$, such that $n > N$ implies $abs(x_n - l) < epsilon$.
    ])
  $ <condition>
]
#math-solution It is clear that the definition of limit implies @condition, because the latter is just a restriction of the former. If something holds for all $epsilon > 0$, it holds for al $1 > epsilon > 0$ as well. Now, let us prove that if the above condition holds, then $x_n ->_(n -> oo) l$. Let $epsilon > 0$ be arbitrary, and define $delta = min{epsilon, 1/2}$. Now, by the condition we assumed, there is a number $N$ such that $abs(x_n - l) < delta$ for $n > N$. Finally, for $n > N$ we have
$
  abs(x_n - l) < min{epsilon, 1/2} <= epsilon,
$
and we are done.

#math-problem("1.2.23") Which are equivalent to the definition of $limits(lim)_(n -> oo) x_n = l$?
+ For $epsilon = 0.001$, we have $N = 1000$, such that $n > N$ implies $abs(x_n - l) < epsilon$ --- #text(red)[NO.]
+ For any $0.001 > epsilon > 0$, there is $N$, such that $n > N$ implies $abs(x_n - l) < epsilon$ --- #text(green)[YES.]
+ For any $epsilon > 0.001$, there is $N$, such that $n > N$ implies $abs(x_n - l) < epsilon$ --- #text(red)[NO.]
+ For any $epsilon > 0$, there is a natural number $N$, such that $n > N$ implies $abs(x_n - l) < 1/2 epsilon$ --- #text(green)[YES.]
+ For any $epsilon > 0$, there is $N$, such that $n > N$ implies $abs(x_n - l) < 2 epsilon^2$ --- #text(green)[YES.]
+ For any $epsilon > 0$, there is $N$, such that $n > N$ implies $abs(x_n - l) < epsilon + 1$ --- #text(red)[NO.]
+ For any $epsilon > 0$, we have $N = 1000$, such that $n > N$ implies $abs(x_n - l) < epsilon$ --- #text(red)[NO.]
+ For any $epsilon > 0$, there are infinitely many $n$, such that $abs(x_n - l) < epsilon$ --- #text(red)[NO.]
+ For infinitely many $epsilon > 0$, there is $N$, such that $n > N$ implies $abs(x_n - l) < epsilon$ --- #text(red)[NO.]
+ For any $epsilon > 0$, there is $N$, such that $n > N$ implies $l - 2 epsilon < x_n < l + epsilon$ --- #text(green)[YES.]

// #lm("order rule")[
//   Let $x_n$ and $y_n$ be sequences such that $x_n <= y_n$ for sufficiently large $n$ (starting from $n = N$, for instance). Assume that both $x_n$ and $y_n$ converge to $alpha$ and $beta$ respectively. Then $alpha <= beta$.
// ]
// #pf[
//   We will do a proof by contradiction. Suppose that $alpha > beta$. Denote the value $(alpha - beta)\/2$ by $epsilon$. By the definition of convergence, for sufficiently large $n$ we have
//   $
//     abs(x_n - alpha) < epsilon #h(5mm)"and"#h(5mm) abs(y_n - beta) < epsilon.
//   $
//   Now, we have $x_n > alpha - epsilon = beta + epsilon > y_n$ for all $n$ starting from some point, in contradiction with the condition $x_n <= y_n$.
// ]


// #lm("sandwich rule")[
//   Let $x_n$ and $z_n$ be sequences converging to the same limit $alpha$, and let $y_n$ be such that $x_n <= y_n <= z_n$ for sufficiently large $n$. Then $y_n$ also has a limit and it equals $alpha$.
// ]
// #pf[
//   Consider an arbitrary $epsilon > 0$. For sufficiently large $n$, we have $abs(x_n - alpha) < epsilon/4$ and $abs(z_n - alpha) < epsilon/4$. As a consequence, we see that
//   $
//     abs(z_n - x_n) = abs((z_n - alpha) - (x_n - alpha)) <= abs(z_n - alpha) + abs(x_n - alpha) < epsilon/2,
//   $
//   if $n$ is large enough. Now, since $x_n <= y_n <= z_n$ for large $n$, we have $y_n - x_n <= z_n - x_n$. Finally, we write
//   $
//     abs(y_n - alpha) = abs((y_n - x_n) + (x_n - alpha)) <= abs(y_n - x_n) + abs(x_n - alpha) <= abs(z_n - x_n) + abs(x_n - alpha) < epsilon/2 + epsilon/4 < epsilon,
//   $
//   q.e.d.
// ]
