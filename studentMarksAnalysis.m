marks = [
75 82 68 91 85;
55 60 58 62 59;
90 88 95 91 94;
40 45 38 42 41;
67 72 70 69 71
];

% Vectorized statistics
avg = mean(marks, 2);
mx = max(marks, [], 2);
mn = min(marks, [], 2);

% Display results
disp('Average Marks');
disp(avg);

disp('Maximum Marks');
disp(mx);

disp('Minimum Marks');
disp(mn);

% Student Result
for i = 1:size(marks, 1)
    if avg(i) >= 75
        grade = 'Distinction';
    elseif avg(i) >= 60
        grade = 'First Class';
    elseif avg(i) >= 50
        grade = 'Pass';
    else
        grade = 'Fail';
    end
    fprintf('Student %d : %s\n', i, grade);
end