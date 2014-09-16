function [x, iterations] = secant( Y, x1, x2 )
%SECANT uses a secant line interpolation alogrithm to find the zero of the
%funciton from two nearby points
%   The secant algorithm uses a secant line algorithm to either interpolate
%   or extrapolate a root based on two points on the curve which are
%   relatively close to the root. The secant line predicts the zero on the
%   x axis then uses that point on the curve to construct the next secant
%   line.

    iterations = 1;
    x = x1 - Y(x1)*(x2-x1)/(Y(x2)-Y(x1));
    x1 = x2;
    x2 = x;
    while (true)
        x = x1 - Y(x1)*(x2-x1)/(Y(x2)-Y(x1));
        if abs(x2-x1) < 0.00001
            break;
        end
        x1 = x2;
        x2 = x;
        iterations = iterations + 1;
    end
end

