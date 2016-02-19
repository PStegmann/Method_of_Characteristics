function [a,n,x,y] = simple(ai,ni,xi,yi,le,g)
    % properties of the incoming wave boundary 
    
    % determine sign of wave
    c = sign(le);
    le = abs(le);
    
    % initialise output variables
    nwaves = length(ai);
    a = nan([2 nwaves]);
    n = a;
    x = a;
    y = a;
    a(1,:) = ai;
    a(2,:) = ai;
    n(1,:) = ni;
    n(2,:) = ni;
    x(1,:) = xi;
    y(1,:) = yi;
    
    mi = asin(1./m_nu(ni,g));    % mi is Mach angle vector
    x(2,1) = xi(1) + le*cos(ai(1)+c*mi(1));
    y(2,1) = yi(1) + le*sin(ai(1)+c*mi(1));
    
    for j = 2:nwaves
        [x(2,j),y(2,j)] = intercept(xi(j),yi(j),ai(j)+c*mi(j),x(2,j-1),y(2,j-1),(ai(j-1)-c*mi(j-1)+ai(j)-c*mi(j))/2.);
    end
end