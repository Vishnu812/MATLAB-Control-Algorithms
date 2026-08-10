% run_tests.m
% Run MATLAB unit tests for the project and summarize results.

results = runtests('tests');
disp(table(results));

failCount = sum([results.Failed]);
if failCount > 0
    fprintf('\n%d test(s) failed.\n', failCount);
else
    fprintf('\nAll tests passed.\n');
end
