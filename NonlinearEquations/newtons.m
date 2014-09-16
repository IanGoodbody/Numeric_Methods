function [zero, error] = newtons(Y, dY, xGuess)
%NEWTONS uses newton's method to determine the zero of a function given the
%function and its deriviative
%   Netwton's method uses the slope of the function at a guessed x value to
%   to project where the zero would be if the function were a line at that
%   point. The algorithm then itteratively uses the new guessed zero until
%   the function is negligibly small at that point (< 10E-6) or the 
%   deriviative is zero. Note this method was not designed to operate on
%   very steep curves

    while (true)
        zero = xGuess-Y(xGuess)/dY(xGuess);
        if (abs(Y(zero)) < 0.000001) || (dY(zero)== 0)
            break
        end
        xGuess = zero;
    end
    error = Y(zero);
end
