#import "@local/common:0.0.0": *
#import "@local/templates:0.0.0": *

#show: math-preamble("Part 2", "Fri, Sep 20")
#set math.equation(supplement: "Formula")

#math-problem("1.1.31 (11)") Find the limit ($n -> oo$) of $(a n^2 + b)^(c/(n+d))$, where $a > 0$.\
#math-solution In the following inequalities the $<=$ sign will mean "less than or equal to, for sufficiantly large $n$". We will also assume for now that $c >= 0$. Trivially, we have
$
  1 <= (a n^2 + b)^(c/(n+d)) <= ((a+1) n^2)^(c/(n + d)) <= ((a+1) n^2)^((2c)/n) = (a+1)^((2c)/n) dot (root(n, n))^(4c) ->_(n -> oo) 1,
$
since $limits(lim)_(n -> oo) root(n,n) = 1$, and thus the limit in question is equal to 1. When $c < 0$, the similar result follows from the arithmetic rule by considering $b_n = 1 \/ a_n$, where $a_n$ is the original sequence.

#math-problem("1.1.32 (5)") Find the limit ($n -> oo$) of $(n - cos(n))^(1/(n + sin(n)))$, where $a > 0$.\
#math-solution
$
  1 <= (n - cos(n))^(1/(n + sin(n))) <= (2n)^(2/n) = 2^(2/n) dot (root(n,n))^2 ->_(n -> oo) 1,
$
thus the original limit is 1.

#math-problem("1.1.34 (6)") Find the limit ($n -> oo$) of $root(n, 4^(2n-1) + (-1)^n 5^n)$.\
#math-solution We will rewrite $4^(2n - 1)$ as $1/4 16^n$. It is obvious that starting at some $n$, we have
$
  1/8 16^n <= (-1)^n 5^n <= 1/8 16^n.
$
Consequently, we can write
$
  16 <-_(n -> oo) 16 dot root(n, 1/8) = root(n, 1/8 16^n) <= root(n, 1/4 16^n + (-1)^n 5^n) <= root(n, 3/8 16^n) = 16 dot root(n, 3/8) ->_(n -> oo) 16,
$
which means that 16 is the answer by the sandwich rule.

#math-problem("1.1.35 (8)") Find the limit ($n -> oo$) of $(a^n - b^n)^(n/(n^2-1))$, where $a > b > 0$.\
#math-solution We will first establish that $a_n := (a^n - b^n)^(1/n) -> a$. Indeed,
$
  a >= (a^n - b^n)^(1/n) = a dot (1 - (b/a)^n)^(1/n) >= a dot (1 - (b/a))^(1/n) ->_(n -> oo) a,
$
which leads to $a_n -> a$ by the sandwith rule. Now, since $n/(n^2-1) > 1/n$ and $a^n - b^n > 1$ for sufficiently large $n$, we write
$
  a <-_(n -> oo) a dot a^(1/(n^2-1)) = a^(n^2/(n^2-1)) > (a^n - b^n)^(n/(n^2-1)) > (a^n - b^n)^(1/n) ->_(n -> oo) a,
$
and conclude that the limit in question is $a$ by the sandwich rule.

#math-problem("1.1.38") Show that $limits(lim)_(n -> oo) n^2 a^n = 0$ for $abs(a) < 1$ in two ways (Example 1.1.12, and the fact that $limits(lim)_(n -> oo) n a^n = 0$ for $abs(a) < 1$).\
#math-solution
/ (first method): We represent $abs(a)$ as $1/(1+b)$ where $b > 0$ (since $abs(a) < 1$). Now,
$
  abs(n^2 a^n) = n^2/(1+b)^n = n^2/(1 + n b + (n(n-1))/2 b^2 + (n(n-1)(n-2))/6 b^3 + ...) <= (6n^2)/(n(n-1)(n-2)b^3) = 6/b^3 dot n/(n-1) dot 1/(n-2).
$
By recognizing that $n/(n-1) -> 1$ and $1/(n-2) -> 0$, we see that $abs(n^2 a^n)$ tends to 0, meaning that $n^2 a^n$ tends to 0 as well, by Exercise 1.1.13.

/ (second method): We have that $limits(lim)_(n -> oo) n a^n = 0$ for $abs(a) < 1$. Considering that $root(n, n) -> 1$, we see that
$
  abs(root(n, n a^n)) = abs(a) root(n,n) -> abs(a),
$
and thus, for a sufficiently small $epsilon > 0$ and sufficiently large $n$, we have
$
  abs(root(n, n a^n)) < abs(a) + epsilon < 1.
$
Now, we return to the sequence in question and consider its absolute value:
$
  abs(n^2 a^n) = abs(n dot (root(n, n a^n))^n) = n dot (abs(root(n, n a^n)))^n <= n dot (abs(a) + epsilon)^n ->_(n -> oo) 0,
$
since $abs(a) + epsilon < 1$.

#math-problem("1.1.41") Show that $limits(lim)_(n -> oo) (a^n)/sqrt(n!) = 0$ for $a = 4$.\
#math-solution For sufficiently large $n$, we write
$
  0 <= 4^n/sqrt(n!) = sqrt(16^n/n!) = sqrt(16^16/16! dot 16/17 dot 16/18 dot ... dot 16/n) <= sqrt(16^16/16! dot 16/n) = A dot 1/sqrt(n) ->_(n -> oo) 0,
$
and the result follows from the sandwich rule.

#math-problem("1.1.43 (7)") Find the limit ($n -> oo$) of $(n 3^n) \/ (1 + 2^n)^2$.\
#math-solution First we will find the limit of $(n 3^n) \/ (2^n)^2$. It follows simply from Example 1.1.13 by the representation
$
  (n 3^n)/(2^n)^2 = n dot (3/4)^n,
$
that the limit is equal to 0. Now, we consider the ratio
$
  ((n 3^n)/(2^n)^2)/((n 3^n)/(1 + 2^n)^2) = (1 + 1/2^n)^2 ->_(n -> oo) 1,
$
and thus the limit of $(n 3^n) \/ (1 + 2^n)^2$ is also 0, by the arithmetic rule of division.

#math-problem("1.1.45") Show that $limits(lim)_(n -> oo) (n^p a^n)/sqrt(n!) = 0$ for any $a$.\
#math-solution We pick $b$ such that $abs(b) > abs(a)$. Now, by Example 1.1.15, we have
$
  (n^p a^n)/b^n = n^p dot (a/b)^n ->_(n -> oo) 0.
$
We also have $b^n/sqrt(n!) ->_(n -> oo) 0$ by Exercise 1.1.41. Now, multiplying the two sequences, we see that the limit in question is also 0.

#math-problem("1.1.51 (6)") Find the limit ($n -> oo$) of $root(n-2, n 2^(3n) + (3^(2n-1))/n^2)$.\
#math-solution For simplicity we will first take the $n$-th root instead of the $(n-2)$-th root. We have
$
  root(n, n 2^(3n) + (3^(2n - 1))/n^2) =
  root(n, 9^n/(3 n^2)) dot root(n, 1 + (3 n^3 8^n)/(9^n)) =
  9 dot 1/root(n,3) dot (1/root(n,n))^2 dot
  root(n, 1 + 3 n^3 (8/9)^n) ->_(n -> oo) 9 dot 1 dot 1 dot 1 = 9.
$
Now, we express $1/(n-2)$ as $1/n + 2/(n(n-2))$, and see that
$
  root(n-2, n 2^(3n) + (3^(2n-1))/n^2) = (root(n, n 2^(3n) + (3^(2n-1))/n^2)) dot (root(n, n 2^(3n) + (3^(2n-1))/n^2))^(2/(n-2)) ->_(n -> oo) 9 dot 1 = 9,
$
due to the arithmetic rule $limits(lim)_(n -> oo) x_n y_n = (limits(lim)_(n -> oo) x_n) (limits(lim)_(n -> oo) y_n)$. In the above derivation, to conclude that the right part of the product approaches 1, we used the fact that if $x_n -> xi > 0$, then $x_n^(2/(n-2)) -> 1$. This is due to the sandwich rule: let $0 < alpha < xi < beta$. Starting from some point, we have $alpha < x_n < beta$. Now,
$
  1 <-_(n -> oo) alpha^(2/(n-2)) < x_n^(2/(n-2)) < beta^(2/(n-2)) ->_(n -> oo) 1.
$
Now we can be sure that the answer is indeed 9.

#math-problem("1.1.52 (11)") Find the limit ($n -> oo$) of $((n+1)a^n + b^n)^(n/(n^2-1))$.\
#math-solution For simplicity and out of concern for the well-definition of real exponentiation, we will assume that $a > b > 0$. Consider the sequence $((n+1)a^n)^(n/(n^2-1))$. By considering its quotient with the original sequence and writing inequalities, we see that
$
  1 <= (((n+1)a^n + b^n)^(n/(n^2-1)))/((n+1)a^n)^(n/(n^2-1)) = (1 + 1/(n+1) (b/a)^n)^(n/(n^2-1)) <= (1 + (b/a)^n)^(n/(n^2-1)) <= 1 + (b/a)^n -> 1,
$
and the quotient approaches 1 by the sandwich rule. By the arithmetic rule, this means that we may instead find the limit of $((n+1)a^n)^(n/(n^2-1))$. Indeed,
$
  ((n+1)a^n)^(n/(n^2-1)) = (root(n+1, n+1))^(n/(n-1)) dot a^(n^2/(n^2-1)) = root(n+1, n+1) dot (root(n+1, n+1))^(1/(n-1)) dot a dot a^(1/(n^2-1)) ->_(n -> oo) 1 dot 1 dot a dot 1 = a.
$

If $b < a <= 0$, then the given expression is not defined for odd $n$.  If, now, $b <= 0 < a$ and $a < abs(b)$, then the expression is again not defined for odd $n$. If, however, $b <= 0 < a$, and $a >= abs(b)$, then the expression becomes well-defined since $(n+1)a^n > abs(b^n)$. In this case we bound the expression (for sufficiently large $n$) as follows:
$
  ((n+1)/2 a^n + abs(b)^n)^(n/(n^2-1)) <= ((n+1)a^n + b^n)^(n/(n^2-1)) <= ((n+1)a^n + abs(b)^n)^(n/(n^2-1)).
$
As already established, both the leftmost and the rightmost sequence approach $a$, and thus the original sequence also approaches $a$ by the sandwich rule.

#math-problem("1.1.58") Prove that if $limits(lim)_(n -> oo) abs(x_n/x_(n-1)) = l < 1$, then $x_n$ converges to 0.\
#math-solution By the order rule, for sufficiently large $n$ (say, from $N$) we have $ abs(x_n/x_(n-1)) < l + epsilon < 1, $ where $epsilon$ is a small positive number. Now, for $n > N$ we express $abs(x_n)$ as
$
  abs(x_n) = abs(x_N) dot abs(x_(N+1)/x_N) dot abs(x_(N+2)/x_(N+1)) dot ... dot abs(x_n/x_(n-1)) < abs(x_N) dot (l + epsilon)^(n - N) ->_(n -> oo) 0,
$
since $l + epsilon < 1$. Therefore, $x_n$ converges to 0.

#math-problem("1.1.59 (7)") Find $a$ such that the sequence $x_n = (a^(n^2))/sqrt(n!)$ converges to 0.\
#math-solution Consider the d'Alambertian ratios:
$
  abs(x_n/x_(n-1)) = abs(a^(2n - 1)/sqrt(n)).
$
These ratios approach 0 when $abs(a) <= 1$, and in that case the original sequence $x_n$ will approach 0 as well (by Exercise 1.1.58). If, on the other hand, $abs(a) > 1$, then the ratios diverge to infinity:
$
  abs(sqrt(n)/(a^(2n - 1))) ->_(n -> oo) 0 ==> abs(a^(2n - 1)/sqrt(n)) ->_(n -> oo) oo.
$
In the above implication, the premise can be obtained from Example 1.1.13. Therefore, since the ratios diverge to infinity, the original sequence diverges as well. We demonstrate this by picking $M > 1$ and stating that $abs(x_n/x_(n-1)) > M$ for sufficiently large $n$ (say, $n > N$). Now, for $n > N$ we have
$
  abs(x_n) = abs(x_N) dot abs(x_(N+1)/x_N) dot abs(x_(N+2)/x_(N+1)) dot ... dot abs(x_n/x_(n-1)) >= abs(x_N) dot M^(n - N) ->_(n -> oo) oo,
$
and thus $x_n -> oo$ by the order rule, meaning that $x_n$ cannot converge to a finite number.

#math-problem("1.1.61 (2, 6)") Explain the convergence/divergence of sequences.\
+ $x_n = n^((-1)^n/n)$\
  #math-solution Consider the odd subsequence: //#h(1fr)
  $
    x_(2n-1) = (2n-1)^(-1/(2n-1)) = 1/root(2n-1, 2n-1) ->_(n -> oo) 1,
  $
  by Example 1.1.9. For the even subsequence, the situation is analogous: $x_(2n) ->_(n -> oo) 1$. As a result, the entire sequence also converges to 1, as a union of two subsequences converging to 1.

+ $x_n = sqrt(n) (sqrt(n + (-1)^n) - sqrt(n))$\
  #math-solution First consider the even subsequence: $x_k = sqrt(k) (sqrt(k+1) - sqrt(k))$ with $k$ even. We multiply and divide by the conjugate:
  $
    sqrt(k) (sqrt(k+1) - sqrt(k)) = (sqrt(k) (sqrt(k+1) - sqrt(k)) (sqrt(k+1) + sqrt(k)))/(sqrt(k+1) + sqrt(k)) = sqrt(k)/(sqrt(k+1) + sqrt(k)) ->_(k -> oo) 1/2.
  $
  By analogy, we see that the odd subsequence, $x_k = sqrt(k) (sqrt(k-1) - sqrt(k))$ with $k$ odd, approaches $-1/2$. As a result, the main sequence diverges, since two of its subsequences converge to different values.

#math-problem("1.1.63") Extend Exercise 1.1.27, by dropping the requirement that all $x_n >= 1$: If $limits(lim)_(n -> oo) x_n = 1$ and $y_n$ is bounded, then $limits(lim)_(n -> oo) x_n^(y_n) = 1$.\
#math-solution Since $y_n$ is bounded, there are $p, q in RR$ such that $p <= y_n <= q$ for all $n$. Consider the subsequence $x_(k_n)$ of those elements that are not greater than 1. Then, we have
$
  x_(k_n)^q <= x_(k_n)^(y_(k_n)) <= x_(k_n)^p.
$
Both the leftmost and the rightmost sequences converge to 1 by Example 1.1.23, and thus the middle sequence converges to 1 by the sandwich rule. Now, an analogous argument (with reversed inequalities) proves that the subsequence $x_(m_n)$ of all elements $>= 1$ also has $x_(m_n)^(y_(m_n))$ converge to 1. As a result, $x_n^(y_n)$ converges to 1 as a union of two subsequences converging to 1.
