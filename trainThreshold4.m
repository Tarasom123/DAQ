function [ threshold4,codebook4]=trainThreshold4(X)

 
 num_bits=size(X,2);
 
 for i=1:num_bits
 [threshold4(:,i),codebook4(:,i)]=lloyds(X(:,i),16);
 end
 threshold4=flipud(threshold4);
 codebook4=flipud(codebook4);