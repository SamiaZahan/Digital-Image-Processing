I= imread('input1.png');
img=unique(I);
[r1,c1]=size(I);
n1=r1*c1;

X_img=img;
for k=1:length(img)
    Y_img(k)=0;
    for i=1:r1
       for j=1:c1
         if (I(i,j)== img(k))
            Y_img(k)= Y_img(k)+1;    
         end
       end
    end
end

Pr_img=Y_img/n1;
sk_img(1)=Pr_img(1);
for i=1:length(img) 
    sk_img(i+1)= sk_img(i)+Pr_img(i);
end
Xe_img= round(255*sk_img);


for i=1:length(X_img)
    Ye_img(i)=0;
    for j=1:length(Xe_img)
         if (Xe_img(j)== X_img(i))
             Ye_img(i)= Y_img(j)+ Ye_img(i);     
         end
    end
end


R= rgb2gray(imread('input2.jpg'));
ref=unique(R);

[r2,c2]=size(R);
n2=r2*c2;
X_ref=ref;
for k=1:length(ref)
    Y_ref(k)=0;
    for i=1:r2
       for j=1:c2
         if (R(i,j)== ref(k))
            Y_ref(k)= Y_ref(k)+1;    
         end
       end
    end
end

Pr_ref=Y_ref/n2;
sk_ref(1)=Pr_ref(1);
for i=1:length(ref) 
    sk_ref(i+1)= sk_ref(i)+Pr_ref(i);
end
Xe_ref= round(255*sk_ref);


for i=1:length(X_ref)
    Ye_ref(i)=0;
    for j=1:length(Xe_ref)
         if (Xe_ref(j)== X_ref(i))
             Ye_ref(i)= Y_ref(j)+ Ye_ref(i);     
         end
    end
end


subplot(2,3,1);imshow(R);  title('Reference image');
subplot(2,3,2);imshow(histeq(R));  title('Equalized Reference image');
subplot(2,3,4);bar(X_ref,Y_ref); title('histogram');
subplot(2,3,5);bar(X_ref,Ye_ref);  title('eqalized hisotgram');
figure,
subplot(2,3,1);imshow(I);  title('Original image');
subplot(2,3,2);imshow(histeq(I));  title('Equalized Original image');
subplot(2,3,4);bar(X_img,Y_img); title('histogram');
subplot(2,3,5);bar(X_img,Ye_img);  title('eqalized hisotgram');
