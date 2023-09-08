t=linspace(0,1,1000);
x1=-exp(-4*t);
x2=cos(2*pi*t);

y1=x1.*x1;
y2=x2.*x2;

x3=2*x1 + 3*x2;
y3=x3.*x3;
y4=2*y1 + 3*y2;

if(y3 == y4)
    disp(" H is Linear system")
else 
    disp("H is Non-linear")
end

figure(1)

plot(t,x1,"r")
plot(t,x2,"b")
title("Lab1")
xlabel("time")
ylabel("amplitude")
legend("x1","x2")

hold on 
grid on 


figure(2)
subplot(2,1,1)
plot(t,y3)
title("Y3")
xlabel("time")
ylabel("amplitude")
legend("y3")
grid on 


subplot(2,1,2)
plot(t,y4)
title("Y4")
xlabel("time")
ylabel("amplitude")
legend("y4")
grid on