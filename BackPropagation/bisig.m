function [out, deri] = bisig(y, sig)
%bisig
%Calculate the sigmoid and derivative of the sigmoid for the given inputs 
    if sig == 0
        sig = 1;
    end
    out = 1/(1+exp(-sig*y));
    deri = sig*out*(1-out);
end

