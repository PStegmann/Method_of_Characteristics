function n = nu(m,g)
% Prandtl-Meyer function
    n = sqrt((g+1)/(g-1))*atan(sqrt((g-1)/(g+1)*(m.^2-1)))-atan(sqrt(m.^2-1));