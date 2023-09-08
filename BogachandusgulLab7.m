clearvars; clc; close all;
d = 2; 
load handel.mat
filename = 'handel.flac';
audiowrite(filename,y,Fs);
samples = [1,d*Fs];
clear Fs
[x,Fs] = audioread(filename,samples); 
soundsc(x);

Ts=1/Fs;
t=0:Ts:d;



x1n=downsample(x,4);

x2n=downsample(x,8);



Fs_1=Fs/4;
Fs_2=Fs/8;

f=linspace(-Fs/2,Fs/2,length(x));
Fs1=linspace(-Fs_1/2,Fs_1/2,length(x1n));
Fs2=linspace(-Fs_2/2,Fs_2/2,length(x2n));

fft_X=fft(x,length(x));
fft_Xn1=fft(x1n,length(x1n));
fft_Xn2=fft(x2n,length(x2n));

figure(1);
subplot(3,1,1)
plot(f,abs(fftshift(fft_X))/length(x));
subplot(3,1,2)
plot(Fs1,abs(fftshift(fft_Xn1))/length(x1n));
subplot(3,1,3)
plot(Fs2,abs(fftshift(fft_Xn2))/length(x2n));

Ts1= 1/ Fs_1;
Ts2= 1/ Fs_2;

t1=0:Ts1:d-Ts1;
t2=0:Ts2:d-Ts2;

x1n_interp=interp1(t1,x1n,t);
x2n_interp=interp1(t2,x2n,t);

figure(2);
subplot(3,1,1)
plot(x);
subplot(3,1,2)
plot(t,x1n_interp);
subplot(3,1,3)
plot(t,x2n_interp);



