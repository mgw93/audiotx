
clear all
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
D=1i.^randi([0 3],1,l);
syncseq=[+1 +1 -1 +1 -1];
D(1:5)=syncseq;
tr=zeros(1,(l+10)*samplespersymbol);

pulselen=length(tp);

t=0:1/sps:(length(tr)-1)/sps;

for k=1:l
    start_ind=(k-1)*samplespersymbol+1;
    end_ind=start_ind+pulselen-1;
    tr(start_ind:end_ind)=tr(start_ind:end_ind)+D(k)*p;
end

%plot3(t,real(tr),imag(tr));

lo=exp(2*pi*1i*t*3500);
tx=real((tr.*lo));

tx=tx./max(abs(tx));
figure;
%plot(2*log10(abs(fft(tx))))
sound(tx,sps)

rx=conv(tx.*conj(lo),p);

syncf=zeros(1,length(syncseq)*samplespersymbol);
syncf(samplespersymbol/2:samplespersymbol:length(syncf))=syncseq;
sync=conv(rx,syncf);

%plot(real(sync))




rx=rx(ceil(pulselen/2):ceil(length(rx)-pulselen/2));

samplepoints=ceil(pulselen/2):samplespersymbol:length(rx);
rr=rx(samplepoints);
plot3(1:length(rx),real(rx),imag(rx)); hold on;
plot3(samplepoints,real(rr),imag(rr),'rx');
%figure
























