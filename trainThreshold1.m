function [ threshold1,codebook1]=trainThreshold1(X)

 
 num_bits=size(X,2);
 
 for i=1:num_bits
 [threshold1(:,i),codebook1(:,i)]=lloyds(X(:,i),2);
 end
 threshold1=flipud(threshold1);
 codebook1=flipud(codebook1);
% function [ threshold1codebook1]=trainThreshold1(X)
% 
%  
%  num_bits=size(X,2);
%  
%  for i=1:num_bits
%     temp= find(X(:,i)>=0);
%     codebook1(1,i)=mean(X(temp,i),1);
%     
%     temp=find(X(:,i)<0);
%     codebook1(2,i)=mean(X(temp,i),1);
%     
%  end
%  threshold1=zeros(2,num_bits);
