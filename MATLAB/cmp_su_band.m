function []=cmp_su_band(filename1,filename2,lowlimit,highlimit)
% parameters:
% filename1,amlitude_factor1,filename2,amlitude_factor2,lowlimit,highlimit,deltat
% 2020/09/10 update the code 
% the amplitude of the waveform is normalized by the inter station space

[a,b,~]=ReadSu(filename1);
[ao,bo,~]=ReadSu(filename2);
[nstep,trace]=size(a);
% deltat=b(1).dt*10^(-6);
deltat=0.01;
amplitude_factor=0.001*0.5*b(end).GroupX/trace;
for i=1:trace
    temp1=bandpass(a(:,i),lowlimit,highlimit,deltat);
    temp2=bandpass(ao(:,i),lowlimit,highlimit,deltat);
    plot(deltat:deltat:nstep*deltat,temp1*amplitude_factor/max(temp1)+b(i).GroupX/1000,'k','LineWidth',1.2);
    hold on;
    if max(a(:,i))~=0
        plot(deltat:deltat:nstep*deltat,temp2*amplitude_factor/max(temp2)+bo(i).GroupX/1000,'r','LineWidth',1.2);
    end
end
xlabel('time/s');
ylabel('distance/km');
ylim([0 b(end).GroupX*1.1/1000]);
title([num2str(lowlimit),'s - ',num2str(highlimit),'s']);

end