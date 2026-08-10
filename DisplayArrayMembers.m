function val = DisplayArrayMembers(A, idx)
% DisplayArrayMembers Display array element safely and return its value.
% Usage:
%   val = DisplayArrayMembers(A, idx)
% Returns the value at A(idx) when in range, otherwise returns empty and
% prints a warning and the array contents.

if nargin < 2
	error('Usage: DisplayArrayMembers(A, idx) - provide both array and index.');
end

validateattributes(A, {'numeric'}, {'vector','nonempty'}, mfilename, 'A', 1);
validateattributes(idx, {'numeric'}, {'scalar','integer','positive'}, mfilename, 'idx', 2);

if idx >= 1 && idx <= numel(A)
	val = A(idx);
	fprintf('A(%d) = %g\n', idx, val);
else
	val = [];
	warning('Index %d out of range. Array has %d elements.', idx, numel(A));
	fprintf('Array contents: ');
	disp(A);
end
end