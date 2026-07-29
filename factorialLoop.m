% factorialLoop.m
% Calculate factorial using a loop

n = 5;
fact = 1;

for i = 1:n
    fact = fact * i;
end

fprintf('Factorial of %d = %d\n', n, fact);