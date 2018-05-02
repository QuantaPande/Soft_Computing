clc;
close all;
clear all;

temp = 22.5;
pressure = 1.5;

%Membership functions for Temperature
t = 10:0.1:90;
Lt = trimf(t, [10 10 25]);
BAt = trimf(t, [15 30 45]);
At = trimf(t, [40 50 60]);
AAt = trimf(t, [55 70 85]);
Ht = trimf(t, [75 90 90]);
subplot(3,2,1)
plot(t,Lt,t,BAt,t,At,t,AAt,t,Ht)
xlabel('Temperature')
ylabel('Membership Function')
title('Temperature Membership Function')

%Membership Function for Pressure
p = 1:0.05:5;
Lp = trimf(p, [1 1 1.75]);
BAp = trimf(p, [1.25 2 2.75]);
Ap = trimf(p, [2.5 3.25 4]);
AAp = trimf(p, [3.75 4.25 4.75]);
Hp = trimf(p, [4.25 5 5]);
subplot(3,2,2)
plot(p, Lp, p, BAp, p, Ap, p, AAp, p, Hp)
xlabel('Pressure')
ylabel('Membership Function')
title('Pressure Membership Function')

%Membership Function for Power
P = 1:0.05:5;
LP = trimf(P, [1, 1, 1.5]);
MLP = trimf(P, [1.25 2 2.75]);
MP = trimf(P, [2.5 3.125 3.75]);
MHP = trimf(P, [3.5 4 4.5]);
HP = trimf(P, [4.25 5 5]);
subplot(3,2,3)
plot(P, LP, P, MLP, P, MP, P, MHP, P, HP)
xlabel('Power')
ylabel('Membership Function')
title('Power Membership Function')

%Evaluate the membership functions values
temp_ba = (temp - 15)/(30-15);
pressure_ba = (pressure - 1.25)/(2 - 1.25);
temp_low = (25 - temp)/(25 - 10);
pressure_low = (1.75 - pressure)/(1.75 - 1);
min1 = min(temp_low, pressure_low);
min2 = min(temp_ba, pressure_ba);

%If Temperature and pressure both are low, then power is high
subplot(3,2,4)
plot(P, min(HP, min1))
xlabel('Power')
ylabel('Membership Function')
title('Inference from Rule 1')

%IF Temperature and pressure both are below average, then the power is
%medium high
subplot(3,2,5)
plot(P, min(MHP, min2))
xlabel('Power')
ylabel('Membership Function')
title('Inference from Rule 2')

%final output
f = max(min(HP, min1), min(MHP, min2));
subplot(3,2,6)
plot(P, f)
hold on
Pint = defuzz(P, f, 'mom');
stem(Pint, max(f))
hold off
xlabel('Power')
ylabel('Membership Function')
title('Final Defuzzified Output')
X = sprintf('The Final power is %d', Pint);
disp(X)

