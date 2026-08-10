function roots = quadraticSolver(a, b, c)
% quadraticSolver Solve quadratic or linear equations.
% Usage:
%   r = quadraticSolver(a,b,c)
% Returns:
%   - If a ~= 0: 2x1 column vector [x1; x2] (may be complex)
%   - If a == 0 and b ~= 0: scalar root for linear equation
%   - If a == 0 and b == 0: error for invalid or infinite solutions

if nargin < 3
    error('quadraticSolver requires three input arguments: a, b, c.');
end

if ~isnumeric(a) || ~isscalar(a) || ~isnumeric(b) || ~isscalar(b) || ~isnumeric(c) || ~isscalar(c)
    error('Inputs a, b, c must be numeric scalars.');
end

if a == 0
    % Linear equation: b*x + c = 0
    if b == 0
        if c == 0
            error('Infinite solutions: 0 = 0.');
        else
            error('No solution: equation is inconsistent.');
        end
    else
        x = -c / b;
        fprintf('Linear root = %g\n', x);
        roots = x;
        return;
    end
end

% Quadratic case
D = b^2 - 4*a*c;

% sqrt handles negative discriminant producing complex results in MATLAB
x1 = (-b + sqrt(D)) / (2*a);
x2 = (-b - sqrt(D)) / (2*a);

fprintf('Root 1 = %s\n', num2str(x1));
fprintf('Root 2 = %s\n', num2str(x2));

roots = [x1; x2];
end