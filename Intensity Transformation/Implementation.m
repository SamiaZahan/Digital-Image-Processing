original=imread('input.png');
gray =rgb2gray(original);
igray=unique(gray);
[r,c]=size(gray);
%imhist(gray);
for g=1:length(igray)
    Xg(g)= igray(g);
    Yg(g)=0;
    for i=1:r
       for j=1:c
         if (gray(i,j)== igray(g))
            Yg(g)= Yg(g)+1;
         end
       end
    end
end
%%%Negate%%%
Ineg= (255-gray);
ineg=unique(Ineg);
%figure,imhist(neg);
for n=1:length(ineg)
    Xn(n)= ineg(n);
    Yn(n)=0;
    for i=1:r
       for j=1:c
         if (Ineg(i,j)== ineg(n))
            Yn(n)= Yn(n)+1;
         end
       end
    end
end
%%%Thresholding%%%
A=127;
for i=1:r
    for j=1:c
        if (gray(i,j)>A)
          Ithresh(i,j)=gray(i,j)*1.5;
        else
          Ithresh(i,j)=gray(i,j)*0.75;
            
        end
    end
end
%imhist(Ithresh);
for t=1:256
    Xt(t)= t;
    Yt(t)=0;
    for i=1:r
       for j=1:c
         if (Ithresh(i,j)== t)
            Yt(t)= Yt(t)+1;
         end
       end
    end
end
%%%LOG%%%
C=1.5;
I= im2double(gray);
Ilog= C*log(1+I);
ilog=unique(Ilog);
%figure,imhist(Ilog);
for L=1:length(ilog)
    Xl(L)=ilog(L);
    Yl(L)=0;
    for i=1:r
       for j=1:c
         if (Ilog(i,j)== ilog(L))
            Yl(L)= Yl(L)+1;
         end
       end
    end
end
%%%Power%%%
Y=0.6;
Igamma= C*I.^Y;
igamma=unique(Igamma);
%imhist(Igamma)
for p=1:length(igamma)
    Xp(p)=igamma(p);
    Yp(p)=0;
    for i=1:r
       for j=1:c
         if (Igamma(i,j)== igamma(p))
            Yp(p)= Yp(p)+1;
         end
       end
    end
end


subplot(2,3,1);imshow(gray);  title('Gray');
subplot(2,3,2);imshow(Ineg);  title('Negate');
subplot(2,3,3);imshow(Ithresh);  title('Threshold');
subplot(2,3,4);imshow(Ilog);  title('Log');
subplot(2,3,6);imshow(Igamma);  title('Power');

figure,subplot(2,3,1);bar(Xg,Yg);  title('Gray');axis([0 255 1 10000]);
subplot(2,3,2);bar(Xn,Yn);  title('Negate');axis([0 255 1 10000]);
subplot(2,3,3);bar(Xt,Yt);  title('Threshold');axis([0 255 1 10000]);
subplot(2,3,4);bar(Xl,Yl);  title('Log');axis([0 1.5 0 10000]);
subplot(2,3,6);bar(Xp,Yp);  title('Power');axis([0 1.5 0 10000]);