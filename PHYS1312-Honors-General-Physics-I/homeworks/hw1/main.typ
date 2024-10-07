#import "@local/common:0.0.0": *
#import "@local/templates:0.0.0": *

#show: physics-preamble("Part 1", "Fri, Sep 20")

#physics-problem("1")\
Let's draw a diagram of the particle's motion and the forces acting on it:
#align(center)[
  #figure(
    image("./figures/path.svg"),
    caption: "The trajectory of the projectile"
  ) <fig1>
]

The Newtonian equation of motion for this projectile will take the form
$
  m (d^2 arrow(r))/(d t^2) = -b (d arrow(r))/(d t) + m arrow(g),
$ <base-eq>
where $arrow(g)$ is defined as $(0,-g)$. Our goal is to solve this differential equation in order to obtain the expression of $y$ in terms of $x$. We will now utilise the method of nondimensionalization, choosing characteristic values as follows:
+ $v_c = m g\/b$ --- characteristic speed.
+ $t_c = v_c\/g = m\/b$ --- characteristic time.
+ $l_c = v_c t_c = (m^2 g)\/b^2$ --- characteristic length.

Variables with primes will denote the dimensionless counterparts of the corresponding variables, e.g.
$ t' = t/t_c, #h(1cm) x' = x/l_c, #h(1cm) arrow(v)' = arrow(v)'/v_c, #h(1cm) v_x' = v_x/(v_c)_x, #h(1cm) a' = a/a_c = a/g. $
Dividing @base-eq by $m g$ and applying algebraig transformations yields a modified differential equation in terms of dimensionless quantities:
$
  (d^2 arrow(r)')/(d t'^2) = - (d arrow(r)')/(d t') + arrow.b #h(1cm) "or" #h(1cm) (d arrow(v)')/(d t') = -arrow(v)' + arrow.b,
$ <nondim-eq>
where $arrow.b$ denotes the vector $(0,-1)$. This is a separable differential equation in $v'$, which we will solve separately by each coordinate. The result is
$
  v'_x (t') = v'_0 cos theta dot e^(-t'), #h(1cm) v'_y (t') = (v'_0 sin theta + 1) e^(-t') - 1.
$ <closed-v>

Integrating @closed-v, we obtain the closed-form solutions for $x'$ and $y'$:
$
  x'(t') = v'_0 cos theta (1 - e^(-t')), #h(1cm) y'(t') = (v'_0 sin theta + 1)(1 - e^(-t')) - t'.
$ <closed-xy>
Finally, we write down the formula for $y'(x')$:
$
  y' &= (v'_0 sin theta + 1)(1 - e^(-t')) - t'\
     &= v'_0 sin theta dot (1 - e^(-t')) + (1 - e^(-t')) - t'\
     &= tan theta dot x' + x'/(v'_0 cos theta) + ln(1 - x'/(v'_0 cos theta))\
     &= x' (tan theta + 1/(v'_0 cos theta)) + ln(1 - x'/(v'_0 cos theta)).
$

#physics-problem("2")\
We first examine the system from a laboratory frame. Let $v_(p x)$ and $v_(p y)$ denote the horizontal and vertical components of the particle, respectively, with $v_p$ being the total velocity. By $v_s$ we will denote the horizontal speed of the hemisphere (directed in the same direction as $v_(p x)$, and thus having a negative value). Here is a sketch of the situation:
#align(center)[
  #figure(
    image("./figures/hemisphere.svg"),
    caption: "The free body diagram in the laboratory frame"
  ) <labframe>
]
We then make use of the laws of conservation of mechanical energy (since all interactions are frictionless, and thus elastic), and conservation of linear momentul along the horizontal direction, obtaining
$
  m v_(b x) + M v_s = 0, #<clm>\
  (M v_s^2)/2 + (m v_p^2)/2 = m g R (1 - cos(theta)). #<cme>
$

Let $arrow(v)'_p$ denote the velocity of the particle relative to the hemisphere. We easily see that
$
  arrow(v)'_p = (v_(p x) - v_s, v_(p y)).
$ <lth>

At every moment in time, in the frame of the hemisphere, the particle is instantaneously moving in circular motion along a circle of radius $R$, and thus we can use Newton's second law to describe its centripetal acceleration:
$
  (m v'_p^2)/R = m g cos(theta) - N.
$ <centripetal>

Now, we shall derive a condition that is satisfied when the particle begins to detach from the hemisphere. We note two facts specific to this moment in time:
+ The velocity vector of the particle _in the reference frame of the hemisphere_ is tangent to the hemisphere, as opposed to $arrow(v)_p$ shown on @labframe in the laboratory frame.
+ There is no longer any interaction between the hemisphere and the particle, meaning that $arrow(N) = arrow(0)$.

With $N = 0$, @centripetal yields
$
  v'_p^2 = g R cos(theta).
$ <main>

On the other hand, by @clm we have $v_s = -r v_(p x)$, and by fact 1 we have
$
  v_(p y)/(v_(p x) - v_s) = tan(theta),
$
since $arrow(v)'_p$ is tangent to the hemisphere. Combining these expressions, we write
$
  v'_p^2 = (v_(p x) - v_s)^2 + v_(p y)^2 = (v_(p x) - v_s)^2 (1 + tan^2(theta)) = (v_(p x)^2 (1 + r)^2)/(cos^2(theta)).
$ <eq1>

Further, from @cme we have
$
  2 m g R (1 - cos(theta)) &= r m v_(p x)^2 + m(v_(p x)^2 + v_(p y)^2),\
  2 g R (1 - cos(theta)) &= v_(p x)^2 (1 + r) + v_(p y)^2\
                         &= v_(p x)^2 ((r+1) + (r+1)^2tan^2(theta)),\
  v_(p x)^2 &= (2 g R)/(r + 1) dot (1 - cos(theta))/(1 + (r+1)tan^2theta).
$

Substituting this into @eq1 and using @main, we obtain that
$
  g R cos(theta) = (2 g R (1+r)^2)/((1 + r) cos^2(theta)) dot (1 - cos(theta))/(1 + (r+1)tan^2theta),\
  (cos^3(theta))/(r+1) = (2 (1 - cos(theta)))/(1 + (r+1)tan^2(theta)).
$

Cross-multiplying this equation and cancelling like terms, we write
$
  2(1 + r)(1 - cos(theta)) &= cos^3(theta) (1 + (r+1)tan^2(theta)),\
  2(1 + r) - 2 (1 + r) cos(theta) &= cos^3 (theta) + (1 + r)cos(theta) sin^2(theta)\
  &= cos^3(theta) - r cos^3(theta) - cos^3(theta) + (1 + r) cos(theta),\
  r cos^3(theta) - 3 (1 + r) cos(theta) + 2(1 + r) &= 0,
$
q.e.d.
