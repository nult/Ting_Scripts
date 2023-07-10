function []=image_su_band(filename1,filename2,lowlimit,highlimit)
% parameters:
% filename1,amlitude_factor1,filename2,amlitude_factor2,lowlimit,highlimit,deltat
% 2020/09/10 update the code 
% the amplitude of the waveform is normalized by the inter station space


[a,b,~]=ReadSu(filename1);
[c,~,~]=ReadSu(filename2);
[nstep,trace]=size(a);
filt_a(trace,nstep)=0;
deltat=b(1).dt*10^(-6);
time_series=deltat:deltat:deltat*nstep;
% deltat=0.01;
for i=1:trace
    dist(i)=b(i).offset;
    temp_a=bandpass(a(:,i),lowlimit,highlimit,deltat);
    filt_a(i,:)=temp_a/max(temp_a);
    temp_c=bandpass(c(:,i),lowlimit,highlimit,deltat);
    filt_c(i,:)=temp_c/max(temp_c);
end
imagesc(time_series,1:trace,filt_a,[-1 1]);
hold on;
for i=1:trace
     [~,temp_ind]=findpeaks(filt_c(i,:));
%    temp_ind=find(filt_c(i,:)==max(filt_c(i,:)));
    plot(time_series(temp_ind),i,'k.');
    if abs(dist(i))<(lowlimit+highlimit)*1000
        plot(0.1*max(time_series),i,'kx');
    end
end
set(gca,'Ydir','normal');
xlabel('time/s');
ylabel('recevier number');
title([num2str(lowlimit),'s - ',num2str(highlimit),'s']);

end