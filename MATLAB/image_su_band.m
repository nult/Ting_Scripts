function []=image_su_band(filename1,lowlimit,highlimit)
% parameters:
% filename1,amlitude_factor1,filename2,amlitude_factor2,lowlimit,highlimit,deltat
% 2020/09/10 update the code 
% the amplitude of the waveform is normalized by the inter station space
cptbwr=load('clmp_bwr.txt');
cptbwr=cptbwr/255;

[a,b,~]=ReadSu(filename1);
[nstep,trace]=size(a);
filt_a(trace,nstep)=0;
deltat=b(1).dt*10^(-6);
time_series=deltat:deltat:deltat*nstep;
% deltat=0.01;
for i=1:trace
    temp_a=bandpass(a(:,i),lowlimit,highlimit,deltat);
    filt_a(i,:)=temp_a/max(temp_a);
end
imagesc(time_series,1:trace,filt_a,[-1 1]);
colormap(cptbwr);
set(gca,'Ydir','normal');
xlabel('Time/s','FontSize',14);
ylabel('Station Serial Mumber','FontSize',14);
title([num2str(lowlimit),'s - ',num2str(highlimit),'s']);
set(gca,'FontSize',14);
end