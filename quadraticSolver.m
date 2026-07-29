% quadraticSolver.m

a = 0;
b = -5;
c = 6;

D = b^2 - 4*a*c;

if D >= 0
    x1 = (-b + sqrt(D))/(2*a);
    x2 = (-b - sqrt(D))/(2*a);

    fprintf('Root 1 = %.2f\n', x1);
    fprintf('Root 2 = %.2f\n', x2);
else
    disp('Complex roots')
end