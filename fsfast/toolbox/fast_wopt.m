function [w, Sigma_s, Sigma_r, M] = fast_wopt(y,Xf,Xr)
% [w, Sigma_s, Sigma_r] = fast_wopt(y,Xf,<Xr>)

w = [];
Sigma_s = 0;
Sigma_r = 0;
if(nargin < 2 | nargin > 3)
  fprintf('[w, Sigma_s, Sigma_r] = fast_wopt(y,Xf,<Xr>)\n');
  return;
end

if(~exist('Xr','var')) Xr = []; end


X = [Xf Xr];
Xf0 = [Xf zeros(size(Xr))];

[ntp nobs] = size(y);
dof = ntp - size(X,2);
if(dof < nobs )
  fprintf('ERROR: dof = %d < number of observations = %d\n',...
	  dof,nobs);
  return;
end

beta = (inv(X'*X)*X')*y;
r = y - X*beta;
s = Xf0*beta;

Sigma_r = r'*r;
Sigma_s = s'*s;

M = Sigma_s*inv(Sigma_r);

[u s v] = svd(M);

w = u(:,1);

return;





  
  
  