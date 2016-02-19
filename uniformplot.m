function uniformplot(a,n,x,y,g,cl,ch)
    figure(1);
    hold on;
    map = colormap;
    m = zeros(size(n));
    m(:) = m_nu(n(:),g);
    xp = x;
    yp = y;
    coli = round(1+(mean(m(:))-cl)/(ch-cl)*63);
    
    if coli<1
        coli = 1;
    elseif coli > 64
        coli = 64;
    end
    fill(xp,yp,map(coli,:));
    hold off
end