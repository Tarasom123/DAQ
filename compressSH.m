function [U] = compressSH(X, SHparam)
%
% [B, U] = compressSH(X, SHparam)
%
% Input
%   X = features matrix [Nsamples, Nfeatures]
%   SHparam =  parameters (output of trainSH)
%
% Output
%   B = bits (compacted in 8 bits words)
%   U = value of eigenfunctions (bits in B correspond to U>0)
%
%
% Spectral Hashing
% Y. Weiss, A. Torralba, R. Fergus. 
% Advances in Neural Information Processing Systems, 2008.

[Nsamples Ndim] = size(X);
nbits = SHparam.nbits;

X = X*SHparam.pc;
X = X-repmat(SHparam.mn, [Nsamples 1]);
omega0=pi./(SHparam.mx-SHparam.mn);
omegas=SHparam.modes.*repmat(omega0, [nbits 1]);

U = zeros([Nsamples nbits]);
for i=1:nbits
    omegai = repmat(omegas(i,:), [Nsamples 1]);
    ys = sin(X.*omegai+pi/2);
    yi = prod(ys,2);
    U(:,i)=yi;    
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function cb = compactbit(b)
%
% b = bits array
% cb = compacted string of bits (using words of 'word' bits)

[nSamples nbits] = size(b);
nwords = ceil(nbits/8);
cb = zeros([nSamples nwords], 'uint8');

for j = 1:nbits
    w = ceil(j/8);
    cb(:,w) = bitset(cb(:,w), mod(j-1,8)+1, b(:,j));
end


