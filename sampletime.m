close all


for i=1:5:735

plot(r(16000+i:samplespersymbol:(16000+i+50*samplespersymbol)),'*')
axis([-4 4 -4 4])
pause
end