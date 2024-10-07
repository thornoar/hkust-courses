settings.outformat = "svg";
size(12cm);
defaultpen(fontsize(12pt) + linewidth(.7pt));

// draw((0,0)--(1,1), blue);

real dt = 0.001;
int iter1 = 400;
int iter2 = 600;
real th = 54;
pair v0 = 8.3*dir(th);
real g = 9.807;
real b = 1.2;
real m = 1;

pair r = (0,0);
pair v = v0;
real t = 0;

real xmax = 3;
real ymax = 1.8;
real margin = .1;
draw(
    (0-margin, 0)--(xmax + margin, 0),
	arrow = Arrow(SimpleHead),
    L = Label("$x$", position = EndPoint, align = E)
);
draw(
    (0, 0-margin)--(0, ymax + margin),
	arrow = Arrow(SimpleHead),
    L = Label("$y$", position = EndPoint, align = N)
);

void update ()
{
    t += dt;
    pair r_new = r + dt*v;
    v -= b/m*v*dt;
    v += dt*(0,-g);

    draw(
        r -- r_new,
        red
    );

    r = r_new;
}

for (int i = 0; i < iter1; ++i) update();
pair r_snap = r;
pair v_snap = .15*v;
for (int i = 0; i < iter2; ++i) update();

draw(
    r_snap -- (r_snap + v_snap),
	arrow = Arrow(SimpleHead),
	L = Label("$\vec{v}$", position = EndPoint, align = Relative(W))
);
draw(
    r_snap -- (r_snap + (0,-.5)),
    blue,
	arrow = Arrow(SimpleHead),
	L = Label("$m\vec{g}$", position = EndPoint, align = Relative(W), p = currentpen)
);
draw(
    r_snap -- (r_snap - b*v_snap),
    blue,
	arrow = Arrow(SimpleHead),
	L = Label("$-b\vec{v}$", position = EndPoint, align = Relative(E), p = currentpen)
);
dot(r_snap, L = Label("$\vec{r}$", align = N));
dot((0,0), L = Label("$0$", align = S+W));
