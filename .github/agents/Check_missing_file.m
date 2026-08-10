folderPath = 'C:\MyFolder';

files = dir(fullfile(folderPath, 'Result_Inside_*.xlsx'));

if ~isempty(files)
    fprintf('File(s) found:\n');

    for i = 1:length(files)
        fprintf('%s\n', files(i).name);
    
else
    fprintf('No matching files found.\n');
end