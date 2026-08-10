# `square` (implemented in find_square.m)

Description
-----------

`square` computes the square of a numeric input. The implementation supports scalars and arrays (element-wise).

Function signature
------------------

```matlab
y = square(x)
```

Inputs
------

- `x` : Numeric scalar or array. `x` may be real or complex.

Outputs
-------

- `y` : Same size as `x`. Each element of `y` is the square of the corresponding element of `x` (i.e. `y = x.^2`).

Behavior and notes
------------------

- The implementation performs element-wise squaring, so calling `square([1 2 3])` returns `[1 4 9]`.
- If `x` is complex, the result follows MATLAB's arithmetic rules (e.g. `square(1+2i)` returns `(1+2i).^2`).
- The file containing the function is named `find_square.m`, while the function itself is `square`. For MATLAB compatibility and to avoid confusion, it is recommended to rename the file to `square.m`.

Examples
--------

```matlab
% scalar
y = square(3)
% returns 9

% row vector
y = square([1 2 3])
% returns [1 4 9]

% column vector
y = square([1;2;3])
% returns [1;4;9]

% complex
y = square(1+2i)
% returns (1+2i).^2
```

Recommended next steps
----------------------

- Rename the file `find_square.m` to `square.m` so the filename matches the function name.
- Add a one-line unit test in a separate file (e.g. `tests/test_square.m`) if you maintain automated tests.

References
----------

- Implementation: [find_square.m](find_square.m)
