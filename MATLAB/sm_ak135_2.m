function [vp_s,vs_s,rho_s]=sm_ak135(z,interface_depth,sm_fac)
% input the depth z, interface_depth, smooth_factor
% output [vp_s,vs_s,rho_s]
% test z=10;
% test sm_fac=10;

dep=0:1:260;
for i=1:length(dep)
    if dep(i)<=interface_depth
        vp(i)=6.1;vs(i)=3.627;rho(i)=2.806;
    else
        vp(i)=8.1;vs(i)=4.5;rho(i)=3.4;
    end
end
s=zeros(length(dep),1);

for i=1:length(dep)
    s(i)=exp(-(z-dep(i))^2/sm_fac^2);
end
sums=sum(s);

vp_s=vp*s/sums;
vs_s=vs*s/sums;
rho_s=rho*s/sums;
return
