function output=fconv(inputa,inputb)

n=length(inputa)+length(inputb)-1;
nwith0=2^(int32(log2(n))+1);
A=fft(inputa,nwith0);
B=fft(inputb,nwith0);
temp_output=ifft(A*B);
output=temp_output(1:n);