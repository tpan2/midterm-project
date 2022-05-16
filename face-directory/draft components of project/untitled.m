files = dir('*1.png');
N = length(files);
idx = randperm(N);
for i = 1:N
    files(idx(i)).name
end