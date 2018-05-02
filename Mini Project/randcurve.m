function [xfin, yfin] = randcurve(a, b, c, N)
%returns N random points about a quadratic curve which is described by the
%co-efficients a, b and c
n = 1;
    while (n < N)
        x = -25 + 50*rand;
        y = -25 + 50*rand;
        z1 = -b + (b^2 - 4*a*(c-y))^0.5/(2*a);
        z2 = -b - (b^2 - 4*a*(c-y))^0.5/(2*a);
        %Check for real values
        if(imag(z2)==0 && imag(z1)==0)
            %Check if x lies in range
            if ((abs(x - z2) < 0.1) || abs(x - z1) < 0.1)
                %Check if y lies in range
                if (abs(y - (a*x^2 + b*x + c) < 0.1))
                    %Add the point to the return arraysa
                    n = n + 1;
                    xfin(n) = x;
                    yfin(n) = y;
                end
            end
        end
    end
end

