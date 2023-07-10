function []=wf_update(filename1,filename2,filename3,lowlimit,highlimit,trace_index)
% parameters:
% filename1,filename2,filename3,lowlimit,highlimit,trace_index
% 2020/09/28
% this code is applied to check the waveform update with the iterartions.

% read data
[a,b,~]=ReadSu(filename1);
[ao,bo,~]=ReadSu(filename2);
[au,bu,~]=ReadSu(filename3);
[nstep,~]=size(a);
deltat=b(1).dt*10^(-6);
% deltat=0.01;
% filter the data
temp1=bandpass(a(:,trace_index),lowlimit,highlimit,deltat);
temp2=bandpass(ao(:,trace_index),lowlimit,highlimit,deltat);
temp3=bandpass(au(:,trace_index),lowlimit,highlimit,deltat);
% plot the waveform
plot(deltat:deltat:nstep*deltat,temp1/max(temp1),'k','LineWidth',1.2);
hold on;
plot(deltat:deltat:nstep*deltat,temp2/max(temp2),'g--','LineWidth',1.2);
plot(deltat:deltat:nstep*deltat,temp3/max(temp3),'r','LineWidth',1.2);
xlabel('Time/s');
ylabel('Amplitude');
legend('obs data','syn before','syn after');
% ylim([-1 1]);
title(['source 00, recevier ',num2str(trace_index-1),', ',num2str(lowlimit),'s - ',num2str(highlimit),'s']);
set(gca,'Fontsize',14);
box on;
end