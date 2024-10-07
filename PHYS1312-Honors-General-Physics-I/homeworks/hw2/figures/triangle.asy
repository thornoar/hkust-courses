size(x = 10cm);
settings.outformat = 'svg';
import export;
//|return|[../main.typ]

void mydot(pair pos, pen p = currentpen, real rad = 0.012)
{
    fill(circle(pos, rad), p);
}

void draw_sierpinski(pair pos, real dist, int depth, pen p1 = currentpen, pen p2 = currentpen)
{
    if (depth == 0)
    {
        draw(
            (pos + dist*dir(90)) -- (pos + dist*dir(210)) -- (pos + dist*dir(330)) -- cycle,
            p = p1
        );
    }
    else
    {
        real x = dist/2;
        draw_sierpinski(
            pos + x*dir(90),
            x,
            depth-1,
            p1,
            p1
        );
        draw_sierpinski(
            pos + x*dir(90 + 120),
            x,
            depth-1,
            p1,
            p1
        );
        draw_sierpinski(
            pos + x*dir(90 + 240),
            x,
            depth-1,
            p2,
            p2
        );
    }
}

real dist = 1;
real l = sqrt(3)*dist;

pair c1 = (0,0);
pair c2 = 0.5*dir(-30);

draw_sierpinski(c1, dist, 7, p2 = blue);

draw((0,1)+.07*dir(30) -- (dir(-30) + .07*dir(30)), bar = Bars(), L = Label("$l$", position = MidPoint, align = Relative(1.5*W)));

real x = 0.8;
draw(c1--dir(-30), red);
draw(c1--x*dir(60), dashed);
draw(c2-- (c2+x*dir(60)), dashed);
// draw(dir(-30)-- (dir(-30)+(x-.1)*dir(60)), dashed);

draw(x*dir(60) -- (c2+x*dir(60)), bar = Bars(), L = Label("$\frac{l}{2\sqrt{3}}$", position = MidPoint, align = Relative(W)));
// draw((x-.1)*dir(60) -- (dir(-30)+(x-.1)*dir(60)), bar = Bars(), L = Label("$\frac{l}{2\sqrt{3}}$", position = MidPoint, align = Relative(W)));

label(c1, Label("$c_1$", align = .7*W+S));
label(c2, Label("$c_2$", align = .3*W+1.4*S));

pair istart = 2*c2 - (.25*sqrt(3),.05);
pair ifinish = dir(-100);
pair ipstart = c2+.5*dir(50);
pair ipfinish = dir(-20);

draw(c1 -- dir((200+120)/2), dashed+opacity(.5));
draw(arc(c1, dir(200), dir(120), direction = CW), arrow = Arrow(SimpleHead), L = Label("$I$", position = MidPoint, align = Relative(W)));
draw(c1 -- length(istart)*unit(unit(istart)+unit(ifinish)), dashed+opacity(.5));
draw(arc(c1, istart, ifinish, direction = CW), blue, arrow = Arrow(SimpleHead), L = Label("$i$", position = MidPoint, align = Relative(W), p = currentpen));
draw(c2 -- c2+length(ipstart-c2)*unit(unit(ipstart-c2)+unit(ipfinish-c2)), dashed+opacity(.5));
draw(arc(c2, ipstart, ipfinish, direction = CW), blue, arrow = Arrow(SimpleHead), L = Label("$i'$", position = MidPoint, align = Relative(W), p = currentpen));

mydot(c1);
mydot(c2);
mydot(dir(-30));

export(margin = .5cm);
