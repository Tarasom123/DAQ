function [ threshold2,codebook2]=trainThreshold2(X)

 
 num_bits=size(X,2);
 
 for i=1:num_bits
 [threshold2(:,i),codebook2(:,i)]=lloyds(X(:,i),4);
 end
 threshold2=flipud(threshold2);
 codebook2=flipud(codebook2);