function MBQ_LM = norm_Dist(U2,Label,SHparam)

num_row=size(U2,1);
num_column=size(Label,1);
MBQ_LM=zeros(num_row,num_column);

%for i=1:num_row
    for i=1:num_column
       % MBQ_LM(i,j)=norm(U2(i,:)-U1(j,:));  
       for j=1:size(U2,2)
            U1(1,j)=SHparam.codebook3(Label(i,j)+1,j);
       end
       MBQ_LM(:,i)=sum(abs(U2-repmat(U1(1,:),num_row,1)),2);
    end
%end
