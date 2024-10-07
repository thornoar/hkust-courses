#import "@local/common:0.0.0": *
#import "@local/templates:0.0.0": *

#show: physics-preamble("Part 2", "Wed, Oct 2")

#physics-problem("1")\

Imagine a mass $M$ hanging from a ceiling suspended on two springs $S_1$, $S_2$ with coefficients $k_1$ and $k_2$.
We will show that the resulting string coefficient (as the system were one large spring) is $k_1 + k_2$.
Divide the mass $M$ into two smaller masses $m_1$, $m_2$ such that they, suspended from $S_1$ and $S_2$, produce the same extension $x$ in both springs.
We write Newton's third law together with Hooke's law:
$
  m_1 g = k_1 x,\
  m_2 g = k_2 x.
$
Now, if we tie the masses together with a rope, there will be no change in their positions or in the tension of the springs.
However, the result will be $M$ suspended from both of the springs simultaneously with extension $x$. We again write Newton's third law and Hooke's law for the system:
$
  K x = M g = (m_1 + m_2) g = m_1 g + m_2 g = k_1 x + k_2 x = (k_1 + k_2) x,\
  K = k_1 + k_2,
$
and we are done.

#physics-problem("2")\

The Sierpinski triangle consists of three smaller triangles, each similar to the whole, but scaled down by a factor of $1\/2$. Let the mass of the original triangle be $M$. Then, the mass of each of the three sub-triangles will be $m = M\/3$.

#align(center)[
  #figure(
    image("figures/triangle.svg", fit: "contain", width: auto),
    caption: "The Sierpinski triangle and moments of inertia at different points"
  ) <triangle>
]
//|sub|[figures/triangle.asy]

Note that the moment of inertia of the entire triangle about $c_1$ (denoted $I$) is three times the moment of inertia of the blue sub-triangle about $c_1$ (denoted $i$). In turn, $i$ can be expressed in terms of the moment about the center of mass of the blue triangle, $i'$, as follows:
$
  I/3 = i = i' + m d^2 = i' + M/3 dot (l/(2 sqrt(3)))^2 = i' + (M l^2)/36.
$ <one>

On the other hand, the big triangle has double the size of the blue one, and triple the mass. Since the moment of inertia around the center of mass is proportional to mass and to the square of side length (by definition), we have
$
  I = 3 dot 2^2 dot i' = 12 i'.
$ <two>

Substituting @two into @one, we have
$
  I/3 &= I/12 + (M l^2)/36,\
  I/4 &= (M l^2)/36,\
  I &= 1/9 M  l^2,
$
and we are done.
