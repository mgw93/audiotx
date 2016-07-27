close all
l=50;
sps=44100;
symrate=60;
%phfilt=filter();
samplespersymbol=ceil(sps/symrate);

tp=-5:(1/samplespersymbol):5;

p=sqrtcosrolloff(tp,0.4);
%p=zeros(size(tp));
%p(abs(tp)<=1/2)=1;
syncseq=[+1 +1 -1 +1 -1];
t=0:1/sps:(length(x)-1)/sps;
lo=exp(2*pi*1i*t*3500);






r=conv(x.*conj(lo),pf);
r=r*exp(1i*pi/3);
semilogy(fftshift(abs(fft(r))))
figure
subplot(2,1,1)
plot3(1:length(r),real(r),imag(r))


plot3(7948:samplespersymbol:(7948+50*samplespersymbol),real(r(7948:samplespersymbol:(7948+50*samplespersymbol))),imag(r(7948:samplespersymbol:(7948+50*samplespersymbol))),'rx')




xlabel('x')
ylabel('y')
zlabel('z')
syncf=zeros(1,length(syncseq)*samplespersymbol);
syncf(samplespersymbol/2:samplespersymbol:length(syncf))=syncseq;
sync=conv(r,syncf);

%subplot(2,1,2)
%plot(real(sync))

data=zeros(1,l*samplespersymbol);
data(samplespersymbol/2:samplespersymbol:length(data))=D;
dataconv=conv(r,data);

subplot(2,1,2)
plot(real(dataconv))