function Label=MBQ_LM1(X,SHparam)
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
    Label(temp,i)=0;
   % U1(temp,i)=codebook3(1,i);
        
    temp=find(U(:,i)<threshold3(1,i));
    Label(temp,i)=1;
    %U1(temp,i)=codebook3(2,i);
end

