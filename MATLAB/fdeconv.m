function output=fdeconv(inputa,inputb,deltat,alpha)
% use fdeconv(A,B) to deconv B from A

% a deconv b, output length is a
n=length(inputa)+length(inputb)-1;
nout=length(inputa);
nwith0=2^(int32(log2(n))+1);
% fft
A=fft(inputa,nwith0);
B=fft(inputb,nwith0);
AdecBfre=zeros(1,nwith0);
freW=zeros(1,nwith0);
gauss_para=ones(1,nwith0);
% water level is fixed
Bmax=max(abs(B));
for i=1:length(B)
    if abs(B(i))<0.001*Bmax
        B(i)=0.001*Bmax;
    end
    AdecBfre(i)=A(i)*conj(B(i))/abs(B(i));
    if nargin>2
        dw=2*pi/double(nwith0*deltat);
        if i<=nwith0/2
            freW(i)=(i-1)*dw;
        else
            freW(i)=(i-nwith0-1)*dw;
        end
        if nargin==4
            gauss_para(i)=exp(-freW(i)^2/(4*alpha^2));
        else
            gauss_para(i)=exp(-freW(i)^2/(4*2.5^2));
        end
        AdecBfre(i)=AdecBfre(i)*gauss_para(i);
    end
end
AdecB=ifft(AdecBfre);
% output length of a
output=AdecB(1:nout);