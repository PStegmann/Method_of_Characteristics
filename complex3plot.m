function complex3plot(a,n,x,y,g,cl,ch)
    % plots triangles coloured by internal Mach number average
    figure(1);
    hold on;
    
    nwaves = length(a);
    map = colormap;
    m = zeros(size(n));
    m(:) = m_nu(n(:),g);    % determine Mach numbers
    
    for i = 2:nwaves % plot Mach number colors
        for j = i:nwaves
            if i == j % boundary condition point, only coded for constant predetermined angle
                xp = [x(i,j) x(i-1,j-1) x(i-1,j)]; % triangle for polygon fill
                yp = [y(i,j) y(i-1,j-1) y(i-1,j)]; % triangle edge vertex
                coli = round(1+((m(i,j)+m(i-1,j-1)+m(i-1,j))/3-cl)/(ch-cl)*63);
                if coli<1
                    coli = 1;
                elseif coli>64
                    coli = 64;
                end
                fill(xp,yp,map(coli,:));
                hold on
            else
                xp = [x(i,j) x(i,j-1) x(i-1,j-1) x(i-1,j)];
                yp = [y(i,j) y(i,j-1) y(i-1,j-1) y(i-1,j)];
                % normalised Mach number average over triangle vertices
                coli = round(1+((m(i,j)+m(i,j-1)+m(i-1,j-1)+m(i-1,j))/4-cl)/(ch-cl)*63);
                if coli<1
                    coli = 1;
                elseif coli>64
                    coli = 64;
                end
                fill(xp,yp,map(coli,:));
            end
        end
    end
    hold off
end