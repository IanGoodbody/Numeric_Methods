function [x, error] = halving( Y, x1, x2, yTarget)
%halving solves the expression Y for a given yTarget value in the range
%between xLow and xHigh using a simple halving algorithm
%
%   The halving algorithm numerically approximates the solution to a
%   continuous function Y by calculating the value of the funciton at the
%   center of of the given range, then reassigning the range based on
%   whether that value was greater or less than yTarget. The process is
%   performed itteritvely until the the range is within 0.00001. The
%   solution must exist between the values of x1 and x2 in accordance with
%   the intermediate value theorem

    if (Y(x1)-yTarget)*(Y(x2)-yTarget) < 0 %Checks that solution exists
        while (true)
            x = x1+(x2-x1)./2;
            if (Y(x) - yTarget) * (Y(x1) - yTarget) > 0
                x1 = x;
            else
                x2 = x;
            end
            %Exit condition for the while loop
            if (abs(x2-x1) <= 0.00001)
                break;
            end
        end
        error = Y(x)-yTarget;
    else %Return an error
        error = NaN;
        x = NaN;
    end
end

