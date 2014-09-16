function [x, yError] = linInt(Y, x1, x2, yTarget)
%linInt calculates the zero of Y between xLow and xHigh using liniar inter
%interpolation
%
%   The linear interpolation alogorithm approximates the curve betweeen
%   xLow and xHigh as linear then solves for x according to that
%   approximation. The function is evaluated at x and compared to the
%   target y value. xLow or xHigh are are set to x depending on if the
%   function evaluation was less or greater than the target y respectively.
%   The process is performed iteratively until the x range is 0.00001 or y 
%   is in 0.01% of the target.
%
%   This algorithm is ideal for plots with low curvature in the analized
%   region.

    if (Y(x1)-yTarget)*(Y(x2)-yTarget) < 0
        while (true)
            x = x2 - ((Y(x2)-yTarget)*(x2-x1))/(Y(x2)-Y(x1));
            if (Y(x) - yTarget)*(Y(x2) - yTarget) > 0;
                x2 = x;
            else
                x1 = x;
            end
            if (abs(Y(x)-yTarget)/yTarget <= 0.0001 || abs(x1-x2)...
                    <= 0.0001)
                %end condition for the while loop
                break;
            end
        end
        yError = abs((Y(x)-yTarget)/yTarget);
    else
        x = NaN;
        yError = NaN;
    end
end

