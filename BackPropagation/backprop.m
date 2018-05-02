clc;
close all;
clear all;
x1 = [0 0 1 1];
x2 = [0 1 0 1];
t = [0 1 1 0];
v = -1 +2*rand(2, 3)
w = -1 +2*rand(1, 3)
wnew = [0 0 0];
vnew = [0 0 0; 0 0 0];
erri = zeros(1,4);
errj = zeros(1, 1000);
y = 0;
a = 0.02;
j = 0;
epochs = 0;
zfin = [0 0 0 0];
%End inputs

while(1)
    j = j+1;
    epochs = epochs + 1;
    for i = 1:4
        y1 = x1(i)*v(1,1)+x2(i)*v(1,2)+v(1,3);
        y2 = x1(i)*v(2,1)+x2(i)*v(2,2)+v(2,3);
        [yout1, deriy1] = bisig(y1, 1);
        [yout2, deriy2] = bisig(y2, 1);
        z = yout1*w(1)+yout2*w(2)+w(3);
        [zout, deriz] = bisig(z, 1);
        %End Output calculation
        
        erri(i) = 1/2*((t(i) - zout))^2;
        if(t(i) ~= zout)
            delk = (t(i) - zout)*deriz;
            wnew(1) = w(1) + a*yout1*delk;
            wnew(2) = w(2) + a*yout2*delk;
            wnew(3) = w(3) + a*delk;
            delin1 = delk*w(1);
            delin2 = delk*w(2);
            del(1) = delin1 * deriy1;
            del(2) = delin2 * deriy2;
            for l = 1:2
                vnew(l, 1) = v(l, 1) + a*del(l)*x1(i);
                vnew(l, 2) = v(l, 2) + a*del(l)*x2(i);
                vnew(l, 3) = v(l, 3) + a*del(l);
            end
        end
        %End Weight updation
        
        errj(j) = sum(erri);
        w = wnew;
        v = vnew;
        zfin(i) = z;
    end
    if(errj(j) < 0.05)
        break;
    end
end
disp('Target output is');
disp(t);
disp('Training Complete');
disp('Final Weights are');
disp(v);
disp(w);
disp('Final outputs are')
disp(zfin)
disp('Applying Thresholds')
finout = zeros(1, 4);
for i= 1:4
    if zfin(i) > 0
        finout(i) = 1;
    else
        finout(i) = 0;
    end
end
disp(finout)
if(finout == t)
    disp('Network Trained');
    disp('Epochs required');
    disp(epochs);
end
j = 1:length(errj);
plot(j, errj)
xlabel('Epoch number')
ylabel('Squared error')
title('Error v/s Epochs')