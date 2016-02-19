clear all
g = 1.4;
minf = 2;
ductHeight = 1;
ai = -(0:.25:10).*pi/180;
x0 = 0;
y0 = 0;
L = 0.2*ductHeight; % L is the length of the turn
xi = linspace(x0, x0+L, length(ai));
yi = y0 + 0.5*tan(ai).*(xi-x0);
ni = nu(minf,g) - ai;
le = ductHeight*minf;

figure(1);
clf(1);
cl = minf;
ch = m_nu(nu(minf,g) - min(ai),g);
[a1,n1,x1,y1] = simple(ai,ni,xi,yi,le,g);
simpleplot(a1,n1,x1,y1,g,cl,ch);

[a2,n2,x2,y2] = complex3free(a1(end,:),n1(end,:),x1(end,:),y1(end,:),nu(minf,g),g);
complex3plot(a2,n2,x2,y2,g,cl,ch);

[a3,n3,x3,y3] = simpleCancel(a2(:,end),n2(:,end),x2(:,end),y2(:,end),-1,xi(end),yi(end),ai(end),g);
simpleplot(a3,n3,x3,y3,g,cl,ch);

uniformplot([a1(1,1) a1(2,1) a1(1,1)], [n1(1,1),n1(2,1), n1(1,1)], [x1(1,1), x1(2,1), x1(1,1)],...
    [y1(1,1) y1(2,1) y1(2,1)], g, cl, ch);
uniformplot([a1(1,end) a1(2,end) a3(2,1)], [n1(1,end) n1(2,end) n3(2,1)], [x1(1,end) x1(2,end) x3(2,1)],...
    [y1(1,end) y1(2,end) y3(2,1)], g, cl, ch);

[xe,ye] = intercept(x3(1,end), y3(1,end), a3(1,end), x3(2,end), y3(2,end), a3(2,end)+pi/2);
uniformplot([a3(1,end) a3(2,end) a3(1,end)], [n3(1,end) n3(2,end) n3(1,end)], [x3(1,end) x3(2,end) xe],...
    [y3(1,end) y3(2,end) ye], g, cl, ch);

hold off
caxis([cl ch]);
colorbar;
axis image