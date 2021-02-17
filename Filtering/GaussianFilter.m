%Gaussian Filter of image
clc;
clear all;
close all;

I=(imread('input.png'));
I = im2double(rgb2gray(I));
subplot(1,2,1);
imshow(I);
title('Original image');
%Zero padding
[x,y]=size(I);
T=zeros(x+4,y+4);
T(3:x+2,3:y+2)= I;
prompt='Sigma:';
sigma=input(prompt);
%5x5 karnel
kernel= zeros(5,5);
for i=1:5
    for j=1:5
        sum_sqr= (i-3)^2 + (j-3)^2; 
        kernel(i,j)= (exp(-1*(sum_sqr)/(2*sigma^2)))/ (2*3.1416*sigma^2);
    end
end
%Gaussian Filter
for i=3:(x+2)
    for j=3:(y+2)
        temp= double(T(i-2:i+2, j-2:j+2));
        new= temp .*kernel;
        T(i,j)= sum(new(:));
        
    end
end    
subplot(1,2,2);
imshow(T(3:x+2,3:y+2));
title('Gaussian filtered image');
