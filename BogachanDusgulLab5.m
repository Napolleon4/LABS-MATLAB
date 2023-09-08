clear all 
clc 

f1=5;
f2=300;
dt=0.001;
t=0:dt:1;

x_t=-2*sin(pi*f2*t).^2 +2*sin(pi*f1*t).*cos(pi*f1*t) + 1 ; 

figure(1);
plot(t,x_t)

intx_t=zeros(1,length(-500:1:500));


for f=-500:1:500
    i=1;
  for t=0:dt:1
    intx_t(501+f)= intx_t(501+f) +  x_t(i)*exp(-1j*2*pi*f*t)*dt;
  i=i+1;
  end
end 

figure(2)
subplot(2,1,1)
f=-500:1:500;
plot(f,abs(intx_t))
xlabel("Fourier Transform X(F) without fft")
subplot(2,1,2)
fs=1000;
N=1000;
x_tfft=fft(x_t,N);
f_v = linspace(-fs / 2, fs / 2, N);
plot(f_v,abs(fftshift(x_tfft)/N))
xlabel("Fourier Transform X(F) with fft")


dt = 1 /fs;
t = -3 : dt : 3;
xt = zeros(1, length(t));
for i = 2001 : 1 : 4001
    xt(i) = 1;
end
figure(3)
plot(t,xt)
xlabel("x(t)")

H1=zeros(1,length(-fs/4:1:fs/4));
H2=1 ; 
H1f=[H1,H2];
Yf=conv(xt,H1f);
subplot(2,1,1)
plot(Yf)
subplot(2,1,2)
plot(ifft(Yf))

