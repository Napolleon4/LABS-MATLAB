clear all 
clc
f1=50;
f2=200;
f3=500;
Fs=5000;
dt=1/Fs; 
t=-0.05:dt:0.05;

x= 0.1*sin(2*pi*f1*t) + 0.5*cos(2*pi*f2*t) - 0.9*sin(2*pi*f3*t);

N=length(x);
f= linspace(-Fs/2,Fs/2,N);
xfft=fft(x,N);

figure(1)
subplot(2,1,1)
plot(t,x)
xlabel("t")
ylabel("f(x)")
subplot(2,1,2)
plot(f, abs(fftshift(xfft))/ N);



[b1_low,a1_low]=butter(1,75/2500,"low")
[b7_low,a7_low]=butter(7,75/2500,"low")

[b1_high,a1_high]=butter(1,350/2500,"high")
[b7_high,a7_high]=butter(7,350/2500,"high")

[b1_bandpass,a1_bandpass]=butter(1,[75 350]./2500,"bandpass")
[b7_bandpass,a7_bandpass]=butter(7,[75 350]./2500,"bandpass")

h1_low=freqz(b1_low,a1_low,2500)
h7_low=freqz(b7_low,a7_low,2500)

h1_high=freqz(b1_high,a1_high,2500)
h7_high=freqz(b7_high,a7_high,2500)

h1_bandpass=freqz(b1_bandpass,a1_bandpass,2500)
h7_bandpass=freqz(b7_bandpass,a7_bandpass,2500)


figure(2)
subplot(3,1,1)
hold on
xlim([0 1000])
plot(abs(h1_low))
plot(abs(h7_low))
title("Lowpass")
legend("n=1","n=7")
xlabel("Frekans")

subplot(3,1,2)
hold on
xlim([0 1000])
plot(abs(h1_high))
plot(abs(h7_high))
title("Highpass")
legend("n=1","n=7")
xlabel("Frekans")



subplot(3,1,3)
hold on
plot(abs(h1_bandpass))
plot(abs(h7_bandpass))
title("Bandpass")
legend("n=1","n=7")
xlabel("Frekans")


lpf_y = filter(b7_low, a7_low, x);
hpf_y = filter(b7_high, a7_high, x);
bpf_y = filter(b7_bandpass,a7_bandpass,x);

yfft_L=fft(lpf_y,N);
yfft_H=fft(hpf_y,N);
yfft_B=fft(bpf_y,N);

figure(3)
subplot(4,1,1)
plot(f, abs(fftshift(xfft))/ N);
title("x(t)")
xlabel("Frekans")

subplot(4,1,2)
plot(f, abs(fftshift(yfft_L))/ N);
title("Y_LPF")
xlabel("Frekans")

subplot(4,1,3)
plot(f, abs(fftshift(yfft_H))/ N);
title("Y_HPF"),
xlabel("Frekans")


subplot(4,1,4)
plot(f, abs(fftshift(yfft_B))/ N);
title("Y_BPF")
xlabel("Frekans")


