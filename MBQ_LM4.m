function U1=MBQ_LM4(X,SHparam)
%Num=SHparam.Num;

threshold3=SHparam.threshold3;
codebook3=SHparam.codebook3;
% threshold2=SHparam.threshold2;
% codebook2=SHparam.codebook2;
% codebook1=SHparam.codebook1;

[Nsamples Ndim] = size(X);
nbits = SHparam.nbits;

X = X*SHparam.pc;
X = X-repmat(SHparam.mn, [Nsamples 1]);
omega0=pi./(SHparam.mx-SHparam.mn);
omegas=SHparam.modes.*repmat(omega0, [nbits 1]);

%U = zeros([Nsamples SHparam.n(1,1)+SHparam.n(1,2)+SHparam.n(1,3)]);
U=zeros([Nsamples nbits]);
U1=U;
for i=1:nbits%SHparam.n(1,1)+SHparam.n(1,2)+SHparam.n(1,3)
    omegai = repmat(omegas(i,:), [Nsamples 1]);
    ys = sin(X.*omegai+pi/2);
    yi = prod(ys,2);
    U(:,i)=yi;
end

for i=1:nbits%SHparam.n(1,1)
    temp=find(U(:,i)>=threshold3(1,i));
    %U1(temp,i)=codebook3(1,i);
    U1(temp,i)=0;
    
    temp=find(U(:,i)>=threshold3(2,i));
    temp1=find(U(:,i)<threshold3(1,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(2,i);
    U1(temp2,i)=1;
    
    temp=find(U(:,i)>=threshold3(3,i));
    temp1=find(U(:,i)<threshold3(2,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(3,i);   
    U1(temp2,i)=2;
  
    temp=find(U(:,i)>=threshold3(4,i));
    temp1=find(U(:,i)<threshold3(3,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(4,i);  
    U1(temp2,i)=3;
    
    temp=find(U(:,i)>=threshold3(5,i));
    temp1=find(U(:,i)<threshold3(4,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(5,i);
    U1(temp2,i)=4;
    
    temp=find(U(:,i)>=threshold3(6,i));
    temp1=find(U(:,i)<threshold3(5,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(6,i);  
    U1(temp2,i)=5;
    
    temp=find(U(:,i)>=threshold3(7,i));
    temp1=find(U(:,i)<threshold3(6,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(7,i);
    U1(temp2,i)=6;

    temp=find(U(:,i)>=threshold3(8,i));
    temp1=find(U(:,i)<threshold3(7,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(8,i);
    U1(temp2,i)=7;
    
    temp=find(U(:,i)>=threshold3(9,i));
    temp1=find(U(:,i)<threshold3(8,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(9,i); 
    U1(temp2,i)=8;
  
    temp=find(U(:,i)>=threshold3(10,i));
    temp1=find(U(:,i)<threshold3(9,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(10,i);
    U1(temp2,i)=9;
    
    temp=find(U(:,i)>=threshold3(11,i));
    temp1=find(U(:,i)<threshold3(10,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(11,i);
    U1(temp2,i)=10;
    
    temp=find(U(:,i)>=threshold3(12,i));
    temp1=find(U(:,i)<threshold3(11,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(12,i); 
    U1(temp2,i)=11;
    
    temp=find(U(:,i)>=threshold3(13,i));
    temp1=find(U(:,i)<threshold3(12,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(13,i);
    U1(temp2,i)=12;
    
    temp=find(U(:,i)>=threshold3(14,i));
    temp1=find(U(:,i)<threshold3(13,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(14,i);
    U1(temp2,i)=13;
  
    temp=find(U(:,i)>=threshold3(15,i));
    temp1=find(U(:,i)<threshold3(14,i));
    temp2=intersect(temp,temp1);
    %U1(temp2,i)=codebook3(15,i); 
    U1(temp2,i)=14;
    
    temp=find(U(:,i)<threshold3(15,i));
    %U1(temp,i)=codebook3(16,i);
    U1(temp,i)=15;
end

