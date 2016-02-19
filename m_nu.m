function m = m_nu(n,g)
    % inverse Prandtl-Meyer polynomial based on I.M. Hall (1975)
    nu_inf = pi/2*(sqrt(6)-1);
    y = (n./nu_inf).^(2/3);
    A = 1.3604;
    B = 0.0962;
    C = -0.5127;
    D = -0.6722;
    E = -0.3278;
    m = (1+A.*y+B.*y.^2.+C.*y.^3)./(1+D.*y+E.*y.^2);
end