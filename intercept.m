function [x,y] = intercept(x1,y1,t1,x2,y2,t2)

% Computes the intercept point of a line of angle t1, starting at (x1,y1) and
% line of angle t2, starting at (x2,y2).

if t2 == t1
    x = nan;
    y = nan;
else
    x = ((y1-y2)*cos(t1)*cos(t2)+x2*sin(t2)*cos(t1)-x1*sin(t1)*cos(t2))/sin(t2-t1);
    y = ((x1-x2)*sin(t1)*sin(t2)+y2*cos(t2)*sin(t1)-y1*cos(t1)*sin(t2))/sin(t1-t2);
end