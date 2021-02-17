
I=mat2gray ([ 2	1	2	7	6;
     1	0	1	4	1;
     2	1	3	1	2;
     1	1	1	0	1;
     2	2	3	1	0]);
M=I;
[r,c]=size(M);

for i=1:r
    for j=1:c
        if (M(i,j)== 1)
           XL= max(1, i-1);
           XR= min(i+1,r);
           YT= max(1, j-1);
           YD= min(c, j+1);
           neighbor=(M(XL:XR, YT:YD));
           Max= max(neighbor(:));
           Med= median(neighbor(:));
           avg= ((Max+Med)/2);
           M(i,j)= avg;
           
         end
     end
end

subplot(1,2,1);imshow(I);  title('Original Image');
subplot(1,2,2);imshow(M);  title('Modified Image');