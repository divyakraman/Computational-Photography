%Part a; Average colour is grey therefore 128,128,128
%Image 1
RawImage = load('RawImage1.mat'); 
RawImage = RawImage.RawImage1;
J = demosaic(RawImage,'rggb');
size1 = size(J);
size1 = size1(1)*size1(2);
a = zeros(1,1,3);
a(1) = sum(sum(J(:,:,1)))/size1;
a(2) = sum(sum(J(:,:,2)))/size1;
a(3) = sum(sum(J(:,:,3)))/size1;
J = double(J)./a;
J = J*128;
figure()
imshow(J/255.0)
%Image 2
RawImage = load('RawImage2.mat'); 
RawImage = RawImage.RawImage2;
J = demosaic(RawImage,'grbg');
size1 = size(J);
size1 = size1(1)*size1(2);
a = zeros(1,1,3);
a(1) = sum(sum(J(:,:,1)))/size1;
a(2) = sum(sum(J(:,:,2)))/size1;
a(3) = sum(sum(J(:,:,3)))/size1;
J = double(J)./a;
J = J*128;
figure()
imshow(J/255.0)
%Image 3
RawImage = load('RawImage3.mat'); 
RawImage = RawImage.RawImage3;
J = demosaic(RawImage,'rggb');
size1 = size(J);
size1 = size1(1)*size1(2);
a = zeros(1,1,3);
a(1) = sum(sum(J(:,:,1)))/size1;
a(2) = sum(sum(J(:,:,2)))/size1;
a(3) = sum(sum(J(:,:,3)))/size1;
J = double(J)./a;
J = J*128;
figure()
imshow(J/255.0)

%Part b
%Image 1
RawImage = load('RawImage1.mat'); 
RawImage = RawImage.RawImage1;
J = demosaic(RawImage,'rggb');
size1 = size(J);
size1 = size1(1)*size1(2);
a = zeros(1,1,3);
a(1) = sum(sum(J(:,:,1)))/size1;
a(2) = sum(sum(J(:,:,2)))/size1;
a(3) = sum(sum(J(:,:,3)))/size1;
J = double(J)./a;
b = J(830,814,:);
J = J.*b;
figure()
imshow(J)
%Image 2
RawImage = load('RawImage2.mat'); 
RawImage = RawImage.RawImage2;
J = demosaic(RawImage,'grbg');
size1 = size(J);
size1 = size1(1)*size1(2);
a = zeros(1,1,3);
a(1) = sum(sum(J(:,:,1)))/size1;
a(2) = sum(sum(J(:,:,2)))/size1;
a(3) = sum(sum(J(:,:,3)))/size1;
J = double(J)./a;
b = J(165,280,:);
J = J.*b;
figure()
imshow(J)
%Image 3
RawImage = load('RawImage3.mat'); 
RawImage = RawImage.RawImage3;
J = demosaic(RawImage,'rggb');
size1 = size(J);
size1 = size1(1)*size1(2);
a = zeros(1,1,3);
a(1) = sum(sum(J(:,:,1)))/size1;
a(2) = sum(sum(J(:,:,2)))/size1;
a(3) = sum(sum(J(:,:,3)))/size1;
J = double(J)./a;
b = J(175,675,:);
J = J.*b;
figure()
imshow(J)

%Part c
%Image 1
RawImage = load('RawImage1.mat'); 
RawImage = RawImage.RawImage1;
J = demosaic(RawImage,'rggb');
size1 = size(J);
size1 = size1(1)*size1(2);
a = zeros(1,1,3);
a(1) = sum(sum(J(:,:,1)))/size1;
a(2) = sum(sum(J(:,:,2)))/size1;
a(3) = sum(sum(J(:,:,3)))/size1;
J = double(J)./a;
b = J(200,435,:);
J = J.*b;
figure()
imshow(J)
%Image 2
RawImage = load('RawImage2.mat'); 
RawImage = RawImage.RawImage2;
J = demosaic(RawImage,'grbg');
size1 = size(J);
size1 = size1(1)*size1(2);
a = zeros(1,1,3);
a(1) = sum(sum(J(:,:,1)))/size1;
a(2) = sum(sum(J(:,:,2)))/size1;
a(3) = sum(sum(J(:,:,3)))/size1;
J = double(J)./a;
b = J(445,715,:);
J = J.*b;
figure()
imshow(J)
%Image 3
RawImage = load('RawImage3.mat'); 
RawImage = RawImage.RawImage3;
J = demosaic(RawImage,'rggb');
size1 = size(J);
size1 = size1(1)*size1(2);
a = zeros(1,1,3);
a(1) = sum(sum(J(:,:,1)))/size1;
a(2) = sum(sum(J(:,:,2)))/size1;
a(3) = sum(sum(J(:,:,3)))/size1;
J = double(J)./a;
b = J(155,565,:);
J = J.*b;
figure()
imshow(J)

%Part d question (i)
%Image 1
RawImage = load('RawImage1.mat'); 
RawImage = RawImage.RawImage1;
J = demosaic(RawImage,'rggb');
J = histeq(J);
figure()
imshow(J)
%Image 2
RawImage = load('RawImage2.mat'); 
RawImage = RawImage.RawImage2;
J = demosaic(RawImage,'grbg');
J = histeq(J);
figure()
imshow(J)
%Image 3
RawImage = load('RawImage3.mat'); 
RawImage = RawImage.RawImage3;
J = demosaic(RawImage,'rggb');
J = histeq(J);
figure()
imshow(J)

%Part d question (ii)
%Image 1
RawImage = load('RawImage1.mat'); 
RawImage = RawImage.RawImage1;
J = demosaic(RawImage,'rggb');
J = imadjust(J,[],[],0.5);%gamma values 0.5,0.7,0.9 
figure()
imshow(J)
%Image 2
RawImage = load('RawImage2.mat'); 
RawImage = RawImage.RawImage2;
J = demosaic(RawImage,'grbg');
J = imadjust(J,[],[],0.7);%gamma values 0.5,0.7,0.9 
figure()
imshow(J)
%Image 3
RawImage = load('RawImage3.mat'); 
RawImage = RawImage.RawImage3;
J = demosaic(RawImage,'rggb');
J = imadjust(J,[],[],0.9);%gamma values 0.5,0.7,0.9
figure()
imshow(J)
