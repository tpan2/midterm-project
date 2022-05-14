folder = fileparts(which('Output.xlsx'));
fullFileName = fullfile(folder, 'Output.xlsx');
sheets=sheetnames('Output.xlsx');
numSheets = length(sheets);
t2=[];
for kk = 1:numSheets
    t1 = readtable('Output.xlsx', 'Sheet',kk);
    t2 = [t2;t1];
end

t2.Properties.VariableNames = ["condition","happinessdata"];
%change names of columns of table

%generate summary statistics
stat1 = grpstats(t2, "condition",["mean", "std","sem","var","min","max"])

%convert table to array
data_matrix=table2array(t2);
condition = table2array(t2(:,1));
happinessdata = table2array(t2(:,2));

angry_data = [];
happy_data = [];
for ii = 1:size(data_matrix, 1)
    % going across the rows in the data matrix
    if data_matrix(ii, 1) == 0
        angry_data(ii,:)= data_matrix(ii, end);
        %  wherever the condition is 0 in the first column, angry_data will
        %  be populated with the preference values
    end
    if data_matrix(ii, 1) == 1
        happy_data(ii, :) = data_matrix(ii, end);
        % same as above, just for happy data
    end
end
angry_data = nonzeros(angry_data);
happy_data = nonzeros(happy_data);
%reorganizes all the data into columns and gets rid of zeroes

normality_angry = adtest(angry_data);
normality_happy = adtest(happy_data);
%Anderson-Darling test to determine normality
  if (normality_angry == 0) && (normality_happy ==0)
      %if normal > student t test
      [h,ttest_significance, ci, stats] = ttest(angry_data, happy_data)
      disp(['ttest_significance is ', num2str(ttest_significance)]);
  else
      %if not normal distr on both sets > Mann Whitney u-test
      [h,mww_significance, ci, stats]= ranksum(angry_data, happy_data);
      disp(['mww_significance is ', num2str(mww_significance)]);
  end

%make simple boxplot to visualize data
boxplot(happinessdata, condition)
xlabel('Condition (0 = Angry, 1 = Happy)')
ylabel('Happiness Rating')
title('Happiness Ratings by condition')
