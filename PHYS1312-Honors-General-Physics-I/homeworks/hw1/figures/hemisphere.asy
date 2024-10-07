settings.outformat = "svg";
size(10cm);

defaultpen(linewidth(.7pt));

real R = 3;
real margin = 1;
real th = 35;
pair pos = R*(Cos(90-th), Sin(90-th));

draw(
    (-R-margin, 0)--(R+margin, 0),
	L = Label("$0$", position = MidPoint, align = S)
);
draw(
    (0, 0)--(0, R),
	L = Label("$R$", position = EndPoint, align = N)
);
draw(arc((0,0),(-R,0),(R,0), CW));

dot(pos);
draw((0,0)--pos, dashed);
draw(
    arc((0,0),(0,.2*R),pos, CW),
    L = Label("$\theta$", position = MidPoint, align = Relative(W))
);
draw(
    pos -- (pos + (0,-1)),
    blue,
    arrow = Arrow(SimpleHead),
    L = Label("$m\vec{g}$", position = EndPoint, align = S, p = currentpen)
);
draw(
    pos -- (pos + Cos(th)*(-Sin(th),-Cos(th))),
    blue,
    arrow = Arrow(SimpleHead)
    // L = Label("$m\vec{g}$", position = EndPoint, align = S, p = currentpen)
);
draw(
    pos -- (pos - .8*Cos(th)*(-Sin(th),-Cos(th))),
    red,
    arrow = Arrow(SimpleHead),
    L = Label("$\vec{N}$", position = EndPoint, align = E, p = currentpen)
);
draw(
    (pos + Cos(th)*(-Sin(th),-Cos(th))) -- (pos + (0,-1)),
    dashed+.5
);
draw(
    pos -- (pos + 1.8*(Cos(th), -Sin(th)-.3)),
    arrow = Arrow(SimpleHead),
    L = Label("$\vec{v}_p$", position = EndPoint, align = E, p = currentpen)
);
draw(
    (0,-.5)--(1,-.5),
    arrow = Arrow(SimpleHead),
    L = Label("$\vec{v}_s$", position = EndPoint, align = E, p = currentpen)
);
