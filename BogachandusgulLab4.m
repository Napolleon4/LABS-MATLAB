clear all 
T=10;
dt=0.001;
f=0.2;
teta=6*dt;

x1=0:dt:5;
x2 = 5 + dt:dt:10;

xf=-exp(-x1);
xs=-sin((2*pi*f*x2)+teta);

mltx1x2=[x1,x2];
intxt = [xf,xs];

xc = zeros(1, length(intxt));
xc(1) = 1;
i = 2;
for t = dt:dt:T
    xc(i) = (intxt(i) - intxt(i - 1)) / dt;
    i = i + 1;
end

figure(1)
plot(mltx1x2, intxt);
hold on;
grid on ; 
plot(mltx1x2, xc);
legend("x(t) integral", "x(t)");

k=-3000:1:3000 ;
ak = zeros(1, length(k));

w=(2*pi)/10;

for k = -3000:1:3000
    j = 1;
    for t = 0:dt:10
        ak(3001+k) = ak(3001+k) + (1/10)*xc(3001+k)*exp(-sqrt(-1)*k*w*t)*dt;
        j = j + 1;
    end
end


Nv1=zeros(1,length(k));
Nv2=zeros(1,length(k));
Nv3=zeros(1,length(k));
Nv4=zeros(1,length(k));

t=0:dt:10
for k=-3000:1:3000
    
    for n=-50:1:50
        Nv1(3001+k)=Nv1(3001+k)+ak(3001+k)*exp(-1i*k*w*t);
     
    end 
end 

for k=-3000:1:3000
    for t=0:dt:10
    for n=-200:1:200
        Nv2(3001+k)=Nv2(3001+k)+ak(3001+k)*exp(-sqrt(-1)*k*w*t);

     end 
    end 
end 

for k=-3000:1:3000
    for t=0:dt:10
    for n=-500:1:500
        Nv3(3001+k)=Nv3(3001+k)+ak(3001+k)*exp(-sqrt(-1)*k*w*t);

     end
    end 
end 
t=0:dt:10
for k=-3000:1:3000
    
    for n=-1000:1:1000
        Nv4(3001+k)=Nv4(3001+k)+ak(3001+k)*exp(-sqrt(-1)*k*w*t);

     end 
    
end 


figure(2)
plot(mltx1x2,N1)
grid on

figure(3)
plot(mltx1x2,N2)
grid on

figure(4)
plot(mltx1x2,N3)
grid on

figure(5)
plot(mltx1x2,N4)
grid on



