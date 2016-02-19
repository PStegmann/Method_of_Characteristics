function simpleplot(a,n,x,y,g,cl,ch)
    figure(1);
    hold on
    nwaves = length(a);
    map = colormap;
    m = zeros(size(n));
    m(:) = m_nu(n(:),g);
    
    for j = 2:nwaves
        xp = [x(2,j) x(2,j-1) x(1,j-1) x(1,j)];
        yp = [y(2,j) y(2,j-1) y(1,j-1) y(1,j)];
        coli = round(1+((m(2,j)+m(2,j-1)+m(1,j-1)+m(1,j))/4-cl)/(ch-cl)*63);
        if coli < 1
            coli = 1;
        elseif coli > 64
            coli = 64;
        end
        fill(xp,yp,map(coli,:));
    end
    hold off
end