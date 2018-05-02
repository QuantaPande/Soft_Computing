clc;
close all;
clear all;

%Input
c = uint8(zeros(640,480,3));
c(:,:,1) = 255*rand(640, 480);
c(:,:,2) = 255*rand(640, 480);
c(:,:,3) = 255*rand(640, 480);
subplot(2,1,1)
image(c)

%split into 7 colours
w = [0 0 255;
    0 255 0;
    255 0 0;
    127 127 0;
    0 127 127;
    127 0 127;
    127 127 127];
m = 7;
alpha = 0.6;
clucount = zeros(1, 7);
cluimage = zeros(7, round(307200/7), 3);
for i = 1:640;
    for j = 1:480
        for k = 1:7
            D(k) = 0;
        end
        for k = 1:7
            for l = 1:3
                D(k) = D(k) + (w(k, l) - c(i,j,l))^2;
            end
        end
        D_min = D(1);
        clu = 1;
        for k = 1:7
            if(D(k) < D_min)
                D_min = D(k);
                clu = k;
            end
        end
        for l = 1:3
            w(clu, l) = w(clu, l) + alpha*(c(i, j, l) - w(clu, l));
        end
        clucount(clu) = clucount(clu) + 1;
        cluimage(clu, clucount(clu), :) = c(i, j, :);
    end
end
% im = zeros(640, 480, 3);
% for k = 1:7
%     for i = 1:640
%         for j = 1:480
%             im(i, j, :) = k
%         end
%     end
% end
%   
subplot(2,1,2)
image(cluimage)
    
        
        
