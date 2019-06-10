%Question 3(a)
bg = imread('data/background.png');
car = imread('data/redcar.png');
%sum(sum(car)) = [1898006, 155849, 155849]
I = zeros(size(car));
J = zeros(size(car));
%imrotate(bg,45,'bilinear','crop'); %To align road and car horizontally
for k=0:51
    J = imtranslate(car,[k,0]);
    J(J==0)=bg(J==0);
    I=double(I)+double(J);
end
I = I/52.0;
imshow(I/255);
%Question 3(b)
camT = load('data/cameraT.mat');
camT = camT.CameraT;
camT = [0 camT];
I = zeros(size(car));
J = zeros(size(car));
K = zeros(size(bg));
for k=0:51
    J = imtranslate(car,[camT(k+1)-k,0]);%Relative translation
    K = imtranslate(bg, [camT(k+1),0]);
    J(J==0)=K(J==0);
    I=double(I)+double(J);
end
I = I/52.0;
imshow(I/255);
%Question 3(c)
%In report
%Question 3(d)
%2 pixel/sec
I = zeros(size(car));
J = zeros(size(car));
for k=0:51
    J = imtranslate(car,[2*k,0]);
    J(J==0)=bg(J==0);
    I=double(I)+double(J);
end
I = I/52.0;
imshow(I/255);
%3 pixel/sec
I = zeros(size(car));
J = zeros(size(car));
for k=0:51
    J = imtranslate(car,[3*k,0]);
    J(J==0)=bg(J==0);
    I=double(I)+double(J);
end
I = I/52.0;
imshow(I/255);
%Question 3(e)
I = zeros(size(car));
J = zeros(size(car));
K = zeros(size(bg));
for k=0:51
    J = imtranslate(car,[camT(k+1)-k,0]);%Relative translation
    K = imtranslate(bg, [camT(k+1),0]);
    J(J==0)=K(J==0);
    I=double(I)+double(J);
end
I = I/52.0;
x = 0:51;
x(1) = 0.1;
x = 1./sqrt(x);
x = x*sqrt(13);
x = x/norm(x);
plot(1:52,x);

%Question 3(f)
shape = size(car);
A = zeros(shape(2)+51,shape(2));
for i=1:shape(2)
    A(i:i+51,i) = x';
end
imshow(A)

J = zeros(shape(1),shape(2)+51,3);
J(1:shape(1),1:shape(2),1:3)=I;
I = J;
imshow(I/255)
reconIm = zeros(shape);
for j = 1:shape(1)
    for k=1:3
        b = I(j,:,k);
        b = b';
        x = A\b;
        reconIm(j,:,k)=x';
    end
    j
end
reconIm = reconIm/max(max(max(reconIm)));
imshow(reconIm)


