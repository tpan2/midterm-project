data_matrix = zeros(4, 3);
data_matrix(3:4,1) = 1;
data_matrix(:, 2) = [2 4 8 7];
data_matrix(:, 3) = [3 1 9 6];
% creating fake data matrix

angry_data = [];
happy_data = [];
for ii = 1:size(data_matrix, 1)
    % going across the rows in the data matrix
    if data_matrix(ii, 1) == 0
        angry_data(ii,:)= data_matrix(ii, 2:3)
        %  wherever the condition is 0 in the first column, angry_data will
        %  be populated with the preference values
    end
    if data_matrix(ii, 1) == 1
        happy_data(ii, :) = data_matrix(ii, 2:3)
        % same as above, just for happy data
    end
end
angry_data = nonzeros(angry_data);
happy_data = nonzeros(happy_data);
%reorganizes all the data into columns and gets rid of zeroes

mean(happy_data);
mean(angry_data);
std(happy_data);
std(angry_data);

ttest(angry_data, happy_data)
%disp(data_matrix);
%disp(angry_data)
%disp(happy_data)