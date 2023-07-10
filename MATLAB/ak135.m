function [vp,vs,rho]=ak135(z)
% input the depth z
% output [vp,vs,rho]

% 0-20
if z>=0 && z<20
    vp=5.8;
    vs=3.46;
    rho=2.72;
    return;
end
% 20-35
if z>=20 && z<35
    vp=6.5;
    vs=3.85;
    rho=2.92;
    return;
end
% 35-77.5
if z>=35 && z<77.5
    vp=8.04+(z-35)*(8.045-8.04)/(77.5-35);
    vs=4.48+(z-35)*(4.49-4.48)/(77.5-35);
    rho=3.32+(z-35)*(3.345-3.32)/(77.5-35);
    return;
end
% 77.5-120
if z>=77.5 && z<120
    vp=8.045+(z-77.5)*(8.05-8.045)/(120-77.5);
    vs=4.49+(z-77.5)*(4.5-4.49)/(120-77.5);
    rho=3.32+(z-77.5)*(3.345-3.32)/(120-77.5);
    return;
end
% 120-165
if z>=120 && z<165
    vp=8.0505+(z-120)*(8.175-8.0505)/(165-120);
    vs=4.5+(z-120)*(4.5090-4.5)/(165-120);
    rho=3.4268+(z-120)*(3.3711-3.4268)/(165-120);
    return;
end
% 165-210
if z>=165 && z<210
    vp=8.1750+(z-165)*(8.3007-8.175)/(210-165);
    vs=4.5090+(z-165)*(4.5184-4.5090)/(210-165);
    rho=3.3711+(z-165)*(3.3243-3.3711)/(210-165);
    return;
end
% 210-260
if z>=210 && z<=260
    vp=8.3007+(z-210)*(8.4822-8.3007)/(260-210);
    vs=4.5184+(z-210)*(4.6094-4.5184)/(260-210);
    rho=3.3243+(z-210)*(3.3663-3.3243)/(260-210);
    return;
end