function U=MBQ_LM_test(X,SHparam)
%Num=SHparam.Num;


[Nsamples Ndim] = size(X);
nbits = SHparam.nbits;

X = X*SHparam.pc;
X = X-repmat(SHparam.mn, [Nsamples 1]);
omega0=pi./(SHparam.mx-SHparam.mn);
omegas=SHparam.modes.*repmat(omega0, [nbits 1]);

%U = zeros([Nsamples SHparam.n(1,1)+SHparam.n(1,2)+SHparam.n(1,3)]);
U=zeros([Nsamples nbits]);
%U1=U;
for i=1:nbits%SHparam.n(1,1)+SHparam.n(1,2)+SHparam.n(1,3)
    omegai = repmat(omegas(i,:), [Nsamples 1]);
    ys = sin(X.*omegai+pi/2);
    yi = prod(ys,2);
    U(:,i)=yi;
end


