function [a,n,x,y] = complex3free(ai,ni,xi,yi,bc,g)
% Properties at the incoming wave boundary in vectors of length n, ordered
% starting from the upstream side:
%   ai - flow angles in radians
%   ni - P-M angles
%   xi - x positions
%   yi - y positions
%   bc - boundary condition, PM angle on free boundary
%   g - gamma
%   a - angle of flow at all points in net, size nxn (upper diagonal
%   matrix)
%   n - PM angles at all points in net, size nxn (upper diagonal matrix)
%   x,y - x and y positions of all grid points size nxn (upper diagional
%   matrix)

    % determine sign of incoming wave
    test = atan2(yi(2)-yi(1), xi(2)-xi(1))-ai(1);
    if abs(test - asin(1./m_nu(ni(1),g))) < abs(test + asin(1./m_nu(ni(1),g)))
        c = -1; % incoming wave is C-
    else
        c = 1;  % incoming wave is C+
    end
    
    % initialise output variables
    nwaves = length(ai);
    a = nan(nwaves);
    n = a;
    x = a;
    y = a;
    m = a;  % m is Mach angle array
    a(1,:) = ai;
    n(1,:) = ni;
    m(1,:) = asin(1./m_nu(ni,g)); 
    x(1,:) = xi;
    y(1,:) = yi;
    
    % Compute missing variables and geometry
    for i = 2:nwaves
        for j = i:nwaves
            if i == j   % boundary condition point, only coded for constant pressure
                n(i,j) = bc; % This line and the next are the only functional differences to complex3()
                a(i,j) = a(i-1,j) + c*(n(i,j) - n(i-1,j));
                m(i,j) = asin(1./m_nu(n(i,j),g));
                [x(i,j), y(i,j)] = intercept(x(i-1,j-1),y(i-1,j-1),...
                    (a(i-1,j-1)+a(i,j))/2,x(i-1,j),y(i-1,j),...
                    (a(i-1,j)+c*m(i-1,j)+a(i,j)+c*m(i,j))/2);
            else    % non-bc point
               a(i,j) = 0.5*(a(i,j-1)+a(i-1,j)+c*(n(i,j-1)-n(i-1,j)));
               n(i,j) = n(i,j-1) + c*(a(i,j-1)-a(i,j));
               m(i,j) = asin(1./m_nu(n(i,j),g));
               [x(i,j), y(i,j)] = intercept(x(i,j-1),y(i,j-1),(a(i,j-1)-c*m(i,j-1)+a(i,j)-c*m(i,j))/2,...
                   x(i-1,j),y(i-1,j),(a(i-1,j)+c*m(i-1,j)+a(i,j)+c*m(i,j))/2);
            end
        end
    end
end