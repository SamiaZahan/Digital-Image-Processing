%task 2%
clc;
clear;
close all;

I1=[0,0,0,0,0,0,0;
    0,0,0,0,0,0,0;
    0,1,0,0,0,1,0;
    0,1,0,1,0,1,0;
    0,1,0,0,0,1,0;
    0,0,1,0,1,0,0;
    0,0,0,0,0,0,0 ];

[row, col]= size(I1);

subplot(1,2,1);
imshow(I1);
title('Given image');
     
[x,y] = size(I1);
I2=zeros(x+2,y+2);

I1_padded = zeros(x+2,y+2); 
I1_padded(2:x+1,2:y+1) = I1;


%Dilation using 3x3 sqr structure 
w = [1 1 1;
     1 1 1;
     1 1 1];
  
for i =2:x+1
    for j =2:y+1 
        w1 =[I1_padded(i-1,j-1)*w(1,1) I1_padded(i-1,j)*w(1,2) I1_padded(i-1,j+1)*w(1,3) I1_padded(i,j-1)*w(2,1) I1_padded(i,j)*w(2,2) I1_padded(i,j+1)*w(2,3) I1_padded(i+1,j-1)*w(3,1) I1_padded(i+1,j)*w(3,2) I1_padded(i+1,j+1)*w(3,3)];
        I2(i,j)=max(w1);
    end
end

I1_padded = ones(x+2,y+2);
I1_padded(2:x+1, 2:y+1) = I2(2:x+1,2:y+1);
I3 = zeros(x+2,y+2);


for i = 2:x+1
    for j = 2:y+1 
        w1 = [I1_padded(i-1,j-1)*w(1,1) I1_padded(i-1,j)*w(1,2) I1_padded(i-1,j+1)*w(1,3) I1_padded(i,j-1)*w(2,1) I1_padded(i,j)*w(2,2) I1_padded(i,j+1)*w(2,3) I1_padded(i+1,j-1)*w(3,1) I1_padded(i+1,j)*w(3,2) I1_padded(i+1,j+1)*w(3,3)];
        I3(i,j) = min(w1);
    end
end

Result=zeros(row,col);
Result(1:x,1:y) = I2(2:x+1, 2:y+1) - I3(2:x+1, 2:y+1);

subplot(1,2,2);
imshow(Result);
title('Required image');