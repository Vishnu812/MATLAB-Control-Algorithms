classdef testQuadraticSolver < matlab.unittest.TestCase
    % Unit tests for quadraticSolver.m
    % Covers:
    %  - two distinct real roots
    %  - repeated (double) root
    %  - complex conjugate roots
    %  - linear equation (a == 0, b ~= 0)
    %  - inconsistent equation (a == 0, b == 0, c ~= 0) -> error
    %  - infinite solutions (a == 0, b == 0, c == 0) -> error
    %  - invalid (non-numeric) inputs -> error

    methods(Test)
        function testTwoRealRoots(tc)
            a = 1; b = -5; c = 6; % roots 2 and 3
            r = quadraticSolver(a,b,c);
            tc.verifyLessThan(abs(polyval([a b c], r(1))), 1e-10);
            tc.verifyLessThan(abs(polyval([a b c], r(2))), 1e-10);
        end

        function testRepeatedRoot(tc)
            a = 1; b = 2; c = 1; % double root -1
            r = quadraticSolver(a,b,c);
            tc.verifyLessThan(abs(polyval([a b c], r(1))), 1e-10);
            tc.verifyLessThan(abs(polyval([a b c], r(2))), 1e-10);
            tc.verifyEqual(r(1), r(2), 'AbsTol', 1e-12);
        end

        function testComplexRoots(tc)
            a = 1; b = 0; c = 1; % roots i and -i
            r = quadraticSolver(a,b,c);
            tc.verifyLessThan(abs(polyval([a b c], r(1))), 1e-10);
            tc.verifyLessThan(abs(polyval([a b c], r(2))), 1e-10);
        end

        function testLinear(tc)
            a = 0; b = 2; c = -4; % linear root x = 2
            r = quadraticSolver(a,b,c);
            tc.verifyEqual(r, 2, 'AbsTol', 1e-12);
        end

        function testInconsistent(tc)
            % a=0, b=0, c~=0 should throw an error (no solution)
            threw = false;
            try
                quadraticSolver(0,0,1);
            catch
                threw = true;
            end
            tc.verifyTrue(threw);
        end

        function testInfiniteSolutions(tc)
            % a=0, b=0, c==0 should throw an error (infinite solutions)
            threw = false;
            try
                quadraticSolver(0,0,0);
            catch
                threw = true;
            end
            tc.verifyTrue(threw);
        end

        function testNonNumericInput(tc)
            threw = false;
            try
                quadraticSolver('a', 1, 2);
            catch
                threw = true;
            end
            tc.verifyTrue(threw);
        end

        function testMissingArguments(tc)
            % calling with fewer than 3 arguments should error
            threw = false;
            try
                quadraticSolver(1,2);
            catch
                threw = true;
            end
            tc.verifyTrue(threw);
        end

        function testNonScalarInputs(tc)
            % non-scalar a,b,c should error
            threw = false;
            try
                quadraticSolver([1 2], 1, 2);
            catch
                threw = true;
            end
            tc.verifyTrue(threw);
        end

        function testPrintedOutputAndShape(tc)
            % capture printed output to exercise fprintf lines and check return shape
            a = 1; b = -5; c = 6;
            out = evalc('r = quadraticSolver(a,b,c);');
            tc.verifyNotEmpty(strfind(out, 'Root 1'));
            tc.verifyNotEmpty(strfind(out, 'Root 2'));
            tc.verifySize(r, [2,1]);

            % linear case prints and returns scalar
            out2 = evalc('x = quadraticSolver(0,2,-4);');
            tc.verifyNotEmpty(strfind(out2, 'Linear root'));
            tc.verifyEqual(x, 2, 'AbsTol', 1e-12);
        end
    end
end
