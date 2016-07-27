recorder1 = audiorecorder(44100,16,1)
recordblocking(recorder1, 5);
x=getaudiodata(recorder1).';
