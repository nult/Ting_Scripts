function []=image_su(filename1)
% parameters:
% filename1,amlitude_factor1,filename2,amlitude_factor2,lowlimit,highlimit,deltat
% 2020/09/10 update the code 
% the amplitude of the waveform is normalized by the inter station space
cptbwr=load('clmp_bwr.txt');
cptbwr=cptbwr/255;
[a,b,~]=ReadSu(filename1);
[nstep,trace]=size(a);
deltat=b(1).dt*10^(-6);
time_series=deltat:deltat:deltat*nstep;
% deltat=0.01;
for i=1:trace
    temp_a=a(:,i);
    filt_a(i,:)=temp_a/max(temp_a);
end
imagesc(time_series,1:trace,filt_a,[-1 1]);
colormap(cptbwr);
set(gca,'Ydir','normal');
xlabel('Time/s','FontSize',14);
ylabel('Station Serial Mumber','FontSize',14);
set(gca,'FontSize',14);
end