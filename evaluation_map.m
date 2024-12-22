function map = evaluation_map(Wtrue,tf)

num_test=size(tf,1);
%num_base=size(Dhat,2);
num_true=size(Wtrue,2);
%Wtrue = Wtrue + 1;
precision =zeros(num_test,1);
n(1,1:num_true)=1:num_true;
for i = 1:size(tf,1)
    t=find(tf(i,:)==1);
    temp=t(1,1:num_true);
    p=n./temp;
    precision(i,1)=sum(p,2)/num_true;  
end
map=mean(precision(:))*100;


