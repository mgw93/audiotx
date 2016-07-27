

t=0:1/sps:(length(x)-1)/sps;
for f=-3:0.01:3
lo=exp(2*pi*1i*t*(3500+f));
f=f+3500
r=conv(x.*conj(lo),pf);
r=r(16790:53000);
plot(mod(1:length(r),samplespersymbol),real(r)+imag(r),'.')
axis([0 750 -1 1])
pause
end