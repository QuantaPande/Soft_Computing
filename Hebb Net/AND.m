clc;
close all;
clear all;

%inputs
x1 = [-1 -1 1 1];
x2 = [-1 1 -1 1];

%target outputs
z1 = [-1 1 1 1];

%initialization
y = [0 0 0 0];
b = 0;
w = [0 0];
wnew = [0 0];

%training
for i = 1:4
    y(i) = w(1)*x1(i) + w(2)*x2(i) + b;
    wnew(1) = w(1) + x1(i)*z1(i);
    wnew(2) = w(2) + x2(i)*z1(i);
    b = b + z1(i);
    w = wnew;
end 

%output display
disp('The Hebb net for OR Gate is trained');
disp('The weights and biases are');
disp ([w b]);
x = -10:10;
y = zeros(1, 21);

for i = 1:21
    y(i) = -(w(2)*x(i)+b)./w(1);
end

plot (x, y)
hold on
stem (x1, x2, 'LineStyle', 'none', 'Marker', '.')
hold off

