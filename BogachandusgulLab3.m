
clear all 
clc 

t=0  : 1/5000 : 4;
tf=0 : 1/5000 : 3 - 1/5000
ts=3 : 1/5000 : 4


x1=tf
x2=ones(1,length(ts)).*3
x3=[x1,x2]


 y=sin(2*pi*1*t)

z=x3+y

figure(1)
subplot(3,1,1)
plot(t,y)
grid on
subplot(3,1,2)
plot(t,x3)
grid on
subplot(3,1,3)
plot(t,z)
grid on


k=-1000:1:1000
dt=1/5000
w=(2 * pi )/4
ak=zeros(1,length(k))

bk=zeros(1,length(k))

ck=zeros(1,length(k))

i= 1 

for k=-1000:1:1000
    j=1
    for t=0:1/5000:4
        ak(i)=ak(i)+ (1/4 * x3(j) * exp(-sqrt(-1) * k * w * t) * dt)
        j=j+1 
    end 
    i=i+1 
end 
