%task 1%
clc;
clear all;
close all;

I1= [0 0 0 0 0 0 0;
     0 0 0 0 0 0 0;
     0 0 1 0 1 0 0;
     0 0 1 0 1 0 0;
     0 0 1 1 1 0 0;
     0 0 0 0 0 0 0;
     0 0 0 0 0 0 0];

subplot(1,2,1);
imshow(I1);
title('Given image');

[x,y]=size(I1);
I2=zeros(x,y);

%Dilation using 3x3 disk structure
w=[0 1 0;
   1 1 1;
   0 1 0];
for s=2:x-1
    for t=2:y-1
        w1=[I1(s-1,t)*w(1,2) I1(s,t-1)*w(2,1) I1(s,t)*w(2,2) I1(s,t+1)*w(2,3) I1(s+1,t)*w(3,2)];
        I2(s,t)=max(w1);
    end
end
Result= I2-I1;
subplot(1,2,2);
imshow(Result);
title('Required image');