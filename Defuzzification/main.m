clc;
close all;
clear all;

%input membership function
x = 1:100;
a1 = 10;
b1 = 30;
c1 = 50;
y1 = max(min((x - a1)/(b1 - a1), (c1 - x)/(c1 - b1)), 0);
a2 = 10;
b2 = 35;
c2 = 65;
d2 = 90;
y2 = max(min(min((x - a2)/(b2 - a2), 0.5), (d2 - x)/(d2 - c2)), 0);
y = max(y1, y2);
subplot(2,2,1)
plot(x, y)
xlabel('Members')
ylabel('Membership Function')
title('Original Membership Function')

%Maximum Defuzzification
imax = 1;
for i = 1:100
    if(y(imax)<y(i))
        imax = i;
    end
end
subplot(2,2,2)
plot(x, y)
hold on
stem(imax, y(imax))
hold off
xlabel('Members')
ylabel('Membership Function')
title('Max Membership Defuzzification Methods')
X = sprintf('For Max Membership Defuzzification Method, output is %d', imax);
disp(X)

%Weighted Average Defuzzification
num = 0;
dem = 0;
for i = 1:100
   num = num + i*y(i);
   dem = dem + y(i);
end
icent = num/dem;
icent = round(icent);
subplot(2,2,3)
plot(x, y)
hold on
stem(icent, y(icent))
hold off
xlabel('Members')
ylabel('Membership Function')
title('Weighted Average Defuzzification Methods')
Y = sprintf('For Weighted Average Defuzzification Method, output is %d', icent);
disp(Y)

%Centroid Defuzzification
fun1 = @(x, y) y.*x;
fun2 = @(x, y) y;
num = integral2(fun1, 1, 100, 0, 1);
dem = integral2(fun2, 1, 100, 0, 1);
icent = num/dem;
icent = round(icent);
subplot(2,2,4)
plot(x, y)
hold on
stem(icent, y(icent))
hold off
xlabel('Members')
ylabel('Membership Function')
title('Centroid Defuzzification Methods')
Z = sprintf('For Centroid Defuzzification Method, output is %d', icent);
disp(Z)