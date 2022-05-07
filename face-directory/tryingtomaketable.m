folder = fileparts(which('Output.xlsx'))
fullFileName = fullfile(folder, 'Output.xlsx');
[status, sheetNames] = xlsfinfo('Output.xlsx');
numSheets = length(sheetNames);
t2=[];
for kk = 1:numSheets;
    t1 = readtable('Output.xlsx', 'Sheet',kk)
    t2 = [t2;t1]
end

data_matrix=table2array(t2);

angry_data = [];
happy_data = [];
for ii = 1:size(data_matrix, 1)
    % going across the rows in the data matrix
    if data_matrix(ii, 1) == 0
        angry_data(ii,:)= data_matrix(ii, end)
        %  wherever the condition is 0 in the first column, angry_data will
        %  be populated with the preference values
    end
    if data_matrix(ii, 1) == 1
        happy_data(ii, :) = data_matrix(ii, end)
        % same as above, just for happy data
    end
end
angry_data = nonzeros(angry_data)
happy_data = nonzeros(happy_data)
%reorganizes all the data into columns and gets rid of zeroes

mean(happy_data);
mean(angry_data);
std(happy_data);
std(angry_data);

ttest(angry_data, happy_data)

%D'Agostino test to determine normality
    %if not normal distr on both sets > Mann Whitney u-test
    %if normal, 
        %if equal variance > student t test
        %if unequal variance > student t-test with Welch's correction
