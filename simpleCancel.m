function [a,n,x,y] = simpleCancel(ai,ni,xi,yi,c,x0,y0,a0,g)
    nwaves = length(ai);
    a = nan([2 nwaves]);
    n = a;
    x = a;
    y = a;
    a(1,:) = ai;
    n(1,:) = ni;
    a(2,:) = ai;
    n(2,:) = ni;
    x(1,:) = xi;
    y(1,:) = yi;
    mi = asin(1./m_nu(ni,g));
    [x(2,1), y(2,1)] = intercept(xi(1),yi(1),ai(1)+c*mi(1),x0,y0,(a0+ai(1))/2);
    for j = 2:nwaves
        [x(2,j),y(2,j)] = intercept(xi(j),yi(j),ai(j)+c*mi(j),...
            x(2,j-1),y(2,j-1),(ai(j-1)+ai(j))/2);
    end
end