t=0:0.0000001:0.002;


w1=(2*pi)/.10^6
Q1=1000
R1=3*.10^5

w2=(2*pi)/.10^6
Q2=100
R2=R1

w3=(2*pi)/(50*.10^3)
Q3=1000
R3=R1

w4=w3
Q4=100
R4=R1

g1=((w1*R1)/Q1).*(exp(-(w1*t)/(2*Q1))).*cos(w1*t)
g2=((w2*R2)/Q2).*(exp(-(w2*t)/(2*Q2))).*cos(w2*t)
g3=((w3*R3)/Q3).*(exp(-(w3*t)/(2*Q3))).*cos(w3*t)
g4=((w4*R4)/Q4).*(exp(-(w4*t)/(2*Q4))).*cos(w4*t)

figure(1)
subplot(4,2,1)
plot(t,g1)
grid on
title("g1")


subplot(4,2,2)
plot(t,g2)
grid on
title("g2")

subplot(4,2,3)
plot(t,g3)
grid on 
title("g3")

subplot(4,2,4)
plot(t,g4)
grid on
title("g4")




figure(2)
a1=5*.10^-4;
a2=2*.10^-4;
a3=2*.10^-8;
h1=exp(-(t).*(t)/(2*a1*a1));

h2=exp(-(t).*(t)/(2*a2*a2))

h3=exp(-(t).*(t)/(2*a3*a3));

subplot(3,2,1)
plot(t,h1)
grid on
title("h1")


subplot(3,2,2)
plot(t,h2)
grid on
title("h2")

subplot(3,2,3)
plot(t,h3)
grid on
title("h3")




