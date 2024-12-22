function precision = evaluation_precision(recallbits,tf)

precision =zeros(size(recallbits,2),1);
i=0;
for k=recallbits
    i=i+1;
    precision(i,1)=sum(sum(tf(:,1:k),2))/(k*size(tf,1));                   
end