function precision = evaluation_precision1(Dhat,qLabel,bLabel)

num_query = size(qLabel,1);
num_base = size(bLabel,1);

for i = 1:num_query
    [~,Coords(1,:)]=sort(Dhat(i,:),2);
    temp=qLabel(i,1);
    for j = 1:num_base
        if(bLabel(Coords(1,j),1)~=temp)
            continue;
        else
            precision(i)=1/j;
            break;
        end
    end
end
precision=mean(precision(:))*100;
