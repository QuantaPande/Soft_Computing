clc;
close all;
clear all;
disp('We will simulate XOR GATE using the perceptron rule')

%INITIALIZATION OF INPUT, TARGET OUTPUT, WEIGHTS AND BIASES
x1 = [-1 -1 1 1];
x2 = [-1 1 -1 1];
t1 = [-1 1 -1 -1];
t2 = [-1 -1 1 -1];
t = [-1 1 1 -1];
y = [0 0 0 0];
v = [0 0; 0 0];
w = [0 0];
b1 = [0 0];
b2 = 0;
alpha = 1;
epochs = 0;
count = 0;
tag = 0;

while(1 && epochs < 100)
    count = 0;
    for i = 1:4
        %OUTPUT CALCULATION
        yint1(i) = b1(1) + x1(i)*v(1,1) + x2(i)*v(1,2);
        yint2(i) = b1(2) + x1(i)*v(2,1) + x2(i)*v(2,2);
        if (yint1(i) >= 0)
            y1(i) = 1;
        else
            y1(i) = -1;
        end
        if (yint2(i) >= 0)
            y2(i) = 1;
        else
            y2(i) = -1;
        end
        zint(i) = b2 + w(1)*y1(i) + w(2)*y2(i);
        if (zint(i) >= 0)
            z(i) = 1;
        else
            z(i) = -1;
        end
        %disp(z)
        
        %WEIGHT UPDATION
        if (z(i) ~= t(i))
            wnew(1) = w(1) + alpha*t(i)*y1(i);
            wnew(2) = w(2) + alpha*t(i)*y2(i);
            b2new = b2 + alpha*t(i);
            disp(b2new)
            if (y1(i) ~= t1(i))
                vnew(1, 1) = v(1, 1) + alpha*t1(i)*x1(i);
                vnew(1, 2) = v(1, 2) + alpha*t1(i)*x2(i);
                b1new(1) = b1(1) + alpha*t1(i);
            end
            if (y2(i) ~= t2(i))
                vnew(2, 1) = v(2, 1) + alpha*t2(i)*x1(i);
                vnew(2, 2) = v(2, 2) + alpha*t2(i)*x2(i);
                b1new(2) = b1(2) + alpha*t2(i);
            end
            %disp(b1new)
            w = wnew;
            v = vnew;
            b2 = b2new;
            b1 = b1new;
            count = count + 1;
        end
        if(count == 0)
            tag = 1;
            break;
        end
    end
    epochs = epochs + 1;
    if (tag == 1)
        break;
    end
en d
disp('The final weights are:')
disp(v);
disp(w);
disp('The final biases are:')
disp(b1)
disp(b2)
disp('The epochs required were:')
disp(epochs);

z = [0 0 0 0];
y1 = [0 0 0 0];
y2 = [0 0 0 0];
for i = 1:4
        %OUTPUT CALCULATION
        yint1(i) = b1(1) + x1(i)*v(1,1) + x2(i)*v(1,2);
        yint2(i) = b1(2) + x1(i)*v(2,1) + x2(i)*v(2,2);
        if (yint1(i) >= 0)
            y1(i) = 1;
        else
            y1(i) = -1;
        end
        if (yint2(i) >= 0)
            y2(i) = 1;
        else
            y2(i) = -1;
        end
        zint(i) = b2 + w(1)*y1(i) + w(2)*y2(i);
        disp(zint(i))
        if (zint(i) >= 0)
            z(i) = 1;
        else
            z(i) = -1;
        end
end
disp(y1)
disp(y2)
disp(z)
