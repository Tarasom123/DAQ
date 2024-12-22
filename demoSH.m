clear;

%%
% 1) Data Reading
load('exp_data.mat'); 
Xtest=double(exp_data.test_cdata');
Xtraining=double(exp_data.train_cdata');
Xbase=double(exp_data.db_cdata');
Xground = exp_data.Xground;
clear exp_data;

Ntraining = size(Xtraining,1);
Ntest = size(Xtest,1);
Nbase = size(Xbase,1);

recallbits = [1:100:Nbase];
loopbits =[16 32 64 128];
Num = 2;

%%
% 2) demo hashing step
clear SHparam score
i = 0;
for nb = loopbits     
    i = i+1;
    disp(i);
    SHparam.Num=Num; 
    SHparam.nbits = floor(nb/SHparam.Num);
    
    % training
    SHparam = trainSH(Xtraining, SHparam);
    [U] = compressSH(Xtraining, SHparam);
    
    % computing thresholds and codebooks
    % [SHparam.threshold3,SHparam.codebook3]=trainThreshold1(U(:,1:nb/SHparam.Num));
    [SHparam.threshold3,SHparam.codebook3]=trainThreshold2(U(:,1:nb/SHparam.Num));
    % [SHparam.threshold3,SHparam.codebook3]=trainThreshold3(U(:,1:nb/SHparam.Num));
    % [SHparam.threshold3,SHparam.codebook3]=trainThreshold4(U(:,1:nb/SHparam.Num));
    
   %%
    Label1=MBQ_LM2(Xbase,SHparam);
    U2=MBQ_LM_test(Xtest,SHparam);   
    Label1=single(Label1);
    U2=single(U2);

    MBQLM = norm_Dist(U2,Label1,SHparam);    
    [~,Index]=sort(MBQLM,2);

    for j=1:size(Xground,1)
        tf(j,:)=ismember(Index(j,:),Xground(j,:));
    end    
    
   %%
    % evaluation
    
    disp('recall');
    [reccal_SH_DAQ(:,i)] = evaluation_recall(recallbits,tf,Xground);
    disp('precision');
    precision_SH_DAQ(:,i) = evaluation_precision(recallbits,tf);
    disp('map');
    map_SH_DAQ(1,i) = evaluation_map(Xground,tf);
     
end



