function [ XNorm] = reNormalize( X, mu, sigma )
%RENORMALIZE Summary of this function goes here
%   Detailed explanation goes here

%I do size(1) instead of length(X) because when using a 1d vector, length gives width not height.
sx = size(X);
%lx = length x
lx = sx(1);
hasOnesForTheta0 = isequal(X(:,1),ones(lx,1));

if hasOnesForTheta0
    XNorm = X(:,2:size(X,2));
else
    XNorm = X;
end
    

XNorm = ((XNorm-mu)./sigma)

if hasOnesForTheta0
    XNorm = [ones(length(XNorm), 1) XNorm]
end

end