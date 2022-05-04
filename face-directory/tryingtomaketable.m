folder = fileparts(which('Output.xlsx'))
fullFileName = fullfile(folder, 'Output.xlsx');
[status, sheetNames] = xlsfinfo('Output.xlsx');
numSheets = length(sheetNames);
t2=[];
for kk = 1:numSheets;
    t1 = readtable('Output.xlsx', 'Sheet',kk)
    t2 = [t2;t1]
end