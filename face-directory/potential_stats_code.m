data_matrix = zeros(4, 3);
data_matrix(3:4,1) = 1;
data_matrix(:, 2) = [2 4 8 7];
data_matrix(:, 3) = [3 1 9 6];

angry_data = [];
happy_data = [];
for ii = 1:size(data_matrix, 1)
    if data_matrix(ii, 1) == 0
        angry_data(ii,:)= data_matrix(ii, 2:3);
    end
    if data_matrix(ii, 1) == 1
        happy_data(ii, :) = data_matrix(ii, 2:3);
    end
end
angry_data = nonzeros(angry_data);
happy_data = nonzeros(happy_data);

mean(happy_data);
mean(angry_data);
std(happy_data);
std(angry_data);

ttest(angry_data, happy_data)
%disp(data_matrix);
%disp(angry_data)
%disp(happy_data)