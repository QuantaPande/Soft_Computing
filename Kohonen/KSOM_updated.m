clc;
close all;
clear all;
 
%weighs at y1 are .1 .5 .6 .5
%weights at y2 are .3 .7 .2 .6
%weights at y3 are .4 .8 .2 .3
w=[0.2 0.8;
   0.6 0.4;
   0.5 0.7;
   0.9 0.3];
%w(i,j) i is input , j is output
%0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 is I  5*3 array reading row wise
%IP 1,2 ARE i; IP 3 IS L; IP 4 IS H;IP 5 IS j(MISCLASSIFIED TO H)
ip=[1 1 0 0;
    0 0 0 1;
    1 0 0 0;
    0 0 1 1];
m=2; % no of output clusters
%r=0 i.e- just update weights of one cluster
alpha=0.6;
epoch=1;
 
while epoch<100
    X=sprintf('Epoch %d',epoch);
    disp(X);
    for k=1:1:4   %for each input
        for j=1:1:m
            D(j)=0;
        end
        for j=1:1:m
            for i=1:1:4
                D(j)=D(j)+(w(i,j)-ip(k,i))^2;
            end
        end
        D_min=D(1);
        clu=1;
        for j=1:1:m
            if D(j)<D_min
                clu=j;
            end
        end
        for i=1:1:4
                w(i,clu)= w(i,clu) + alpha*( ip(k,i)- w(i,clu)); 
        end
        X=sprintf('%d ip belongs to %d cluster',k,clu);
        disp(X);
    end
    w
    alpha=.5*alpha;
    disp(alpha)
    epoch=epoch+1;
end


 

