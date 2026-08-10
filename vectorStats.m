function [avg, stdev] = vectorStats(x)
% vectorStats Compute average and standard deviation of an input vector.
% Usage:
%   [avg, stdev] = vectorStats(x)
% Inputs:
%   - x : numeric vector (row or column)
% Outputs:
%   - avg   : arithmetic mean of elements of x
%   - stdev : standard deviation of elements of x (sample std, MATLAB default)

if nargin < 1
    error('vectorStats requires one input argument: the numeric vector x.');
end

validateattributes(x, {'numeric'}, {'vector','nonempty'}, mfilename, 'x', 1);

% Ensure column vector for consistent behavior
x = x(:);

avg = mean(x);
stdev = std(x);

fprintf('Average = %g\n', avg);
fprintf('Standard deviation = %g\n', stdev);
end
