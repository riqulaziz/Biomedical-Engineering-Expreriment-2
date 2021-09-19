record=xlsread('Data.xlsx');
% AF3= record(:,1);
% F7= record(:,2);
% F3= record(:,3);
% FC5= record(:,4);
% T7= record(:,5);
% P7= record(:,6);
% O1= record(:,7);
% O2= record(:,8);
% P8= record(:,9);
% T8= record(:,10);
% FC6= record(:,11);
% F4= record(:,12);
% F8= record(:,13);
% AF4= record(:,14);
%Spektrum Delta
% mySignal=[AF3' F7' F3' FC5' T7' P7' O1' O2' P8' T8' FC6' F4' F8' AF4'];
mySignal=record;
fs=128;
[baris,kolom]=size (mySignal);
[N,M]=size (mySignal);
f=0:fs/N:(fs/2)-fs/N;
% Call The Function : 
% t = 0:1/Fs:1; 
% waveletFunction = 'db8'; 
waveletFunction = 'db4'; 
for j=1:kolom
[Gamma(:,j),Beta(:,j),Alpha(:,j),Theta(:,j),Delta(:,j)]=Wavelet128(mySignal(:,j),waveletFunction);
PowerDelta(:,j) = abs(sum(Delta(:,j).^2));
PowerTheta(:,j) = abs(sum(Theta(:,j).^2));
PowerAlpha(:,j) = abs(sum(Alpha(:,j).^2));
PowerBeta(:,j) = abs(sum(Beta(:,j).^2));
end

%hanya untuk menunjukkan dalam rentang frekuensi di fourier. 
% perbedaan hasil frekuensi krn koefisien wavelet merupakan skala bukan frekuensi. perlu konversi tersendri.
zt=(fft(Theta(:,14)));
PSt=abs(zt).^2;
figure;plot(f,PSt(1:N/2))
title('Sinyal Thetha Push')
xlabel('frekuensi');ylabel('magnitude')

zb=(fft(Beta(:,14)));
PSb=abs(zb).^2;
figure;plot(f,PSb(1:N/2))
title('Sinyal Beta Push')
xlabel('frekuensi');ylabel('magnitude')

za=(fft(Alpha(:,14)));
PSa=abs(za).^2;
figure;plot(f,PSa(1:N/2))
title('Sinyal Alpha Push')
xlabel('frekuensi');ylabel('magnitude')

zd=(fft(Delta(:,14)));
PSd=abs(zd).^2;
figure;plot(f,PSd(1:N/2))
title('Sinyal Delta Normal')
xlabel('frekuensi');ylabel('magnitude')