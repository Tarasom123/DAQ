function  [threshold3,codebook3]=trainThreshold3(X)

% num_X=size(X,1);
 num_bits=size(X,2);
 
 for i=1:num_bits
 [threshold3(:,i),codebook3(:,i)]=lloyds(X(:,i),8);
 end
 threshold3=flipud(threshold3);
 codebook3=flipud(codebook3);
% 
% % each_num=num_X/7;
% % each_num=floor(each_num);
% sort_X=sort(X,1);
% sort_X=flipud(sort_X);
% num_training=num_X;
% 
% threshold3=zeros(4,num_bits);
% for i=1:num_bits
% [b,c] = get0Fix3MeansThreshold(X(1:num_training,i),num_training);
% % temp1=find(X(1:num_training,i)<=d);
% % temp2=find(X(1:num_training,i)>=a);
% % temp=intersect(temp1,temp2);
% % num_temp=size(temp,1);
% % [b,c] = get0Fix3MeansThreshold(X(temp,i),num_temp);
% temp1=find(X(:,i)<b);
% temp=X(temp1,i);
% a=computethreshold3(temp);
% temp1=find(X(:,i)>c);
% temp=X(temp1,i);
% d=computethreshold3(temp);
% 
% threshold3(1,i)=d;
% threshold3(2,i)=c;
% threshold3(3,i)=b;
% threshold3(4,i)=a;
% end
% 
% 
% 
% % z_index=zeros(1,num_bits);
% % for i=1:num_bits
% %     z_index(1,i)=find(sort_X(:,i)<0,1,'first');
% % end
% % z_index_1=z_index-each_num-each_num*4;
% % z_index_2=z_index-each_num-each_num*2;
% % z_index_3=z_index-each_num;
% % z_index_4=z_index+each_num;
% % z_index_5=z_index+each_num+each_num*2;
% % z_index_6=z_index+each_num+each_num*4;
% % for i=1:num_bits
% %     if(z_index_6(1,i)>num_X)
% %         z_index_6(1,i)=num_X;
% %     end
% % end
% 
% % for i=1:num_bits
% %     threshold3(1,i)=sort_X(each_num,i);
% %     threshold3(2,i)=sort_X(2*each_num,i);
% %     threshold3(3,i)=sort_X(3*each_num,i);
% %     threshold3(4,i)=sort_X(4*each_num,i);
% %     threshold3(5,i)=sort_X(5*each_num,i);
% %     threshold3(6,i)=sort_X(6*each_num,i);
% % end