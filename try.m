% addpath feat_read

% Xdata = load('cifar-10-batches-mat\data.mat');
% Xtest = Xdata.Xtest;
image = cell(10000,1);
for i = 1:10000
    image{i}(:,:,1) = (reshape(Xtest(i,1:1024),32,32)');
    image{i}(:,:,2) = (reshape(Xtest(i,1025:2048),32,32)');
    image{i}(:,:,3) = (reshape(Xtest(i,2049:3072),32,32)');
end

