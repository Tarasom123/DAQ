function Dh = hamming_Dist (B1, B2)
%symmetric distance

num_test=size(B1,1);
num_base=size(B2,1);
Dh=zeros(num_test,num_base);
for i=1:num_base    
    Dh(:,i)=sum(abs(B1-repmat(B2(i,:),num_test,1)),2);
end