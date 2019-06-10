%Image 2
RawImage = load('RawImage2.mat'); 
RawImage = RawImage.RawImage2;
J = demosaic(RawImage,'grbg');
figure()
imshow(J)
window = J(705:765,924:984,:);
sigman = zeros(3,1);
dim1 = window(:,:,1);
dim1 = double(dim1);
dim1 = dim1/255.0;
sigman(1) = std(dim1(:));
dim1 = window(:,:,2);
dim1 = double(dim1);
dim1 = dim1/255.0;
sigman(2) = std(dim1(:));
dim1 = window(:,:,3);
dim1 = double(dim1);
dim1 = dim1/255.0;
sigman(3) = std(dim1(:));
sigmar = 1.95*sigman;
sigmar = mean(sigmar);
denoisedImage = bfltColor(double(J)/255.0,11,2.5,sigmar);
figure()
imshow(denoisedImage)

%Image 1
RawImage = load('RawImage1.mat'); 
RawImage = RawImage.RawImage1;
J = demosaic(RawImage,'rggb');
figure()
imshow(J)
window = J(559:761,1031:1056,:);
sigman = zeros(3,1);
dim1 = window(:,:,1);
dim1 = double(dim1);
dim1 = dim1/255.0;
sigman(1) = std(dim1(:));
dim1 = window(:,:,2);
dim1 = double(dim1);
dim1 = dim1/255.0;
sigman(2) = std(dim1(:));
dim1 = window(:,:,3);
dim1 = double(dim1);
dim1 = dim1/255.0;
sigman(3) = std(dim1(:));
sigmar = 1.95*sigman;
sigmar = mean(sigmar);
denoisedImage = bfltColor(double(J)/255.0,11,2.5,sigmar);
figure()
imshow(denoisedImage)

%Image 3
RawImage = load('RawImage3.mat'); 
RawImage = RawImage.RawImage3;
J = demosaic(RawImage,'rggb');
figure()
imshow(J)
window = J(79:165,157:249,:);
sigman = zeros(3,1);
dim1 = window(:,:,1);
dim1 = double(dim1);
dim1 = dim1/255.0;
sigman(1) = std(dim1(:));
dim1 = window(:,:,2);
dim1 = double(dim1);
dim1 = dim1/255.0;
sigman(2) = std(dim1(:));
dim1 = window(:,:,3);
dim1 = double(dim1);
dim1 = dim1/255.0;
sigman(3) = std(dim1(:));
sigmar = 1.95*sigman;
sigmar = mean(sigmar);
denoisedImage = bfltColor(double(J)/255.0,11,2.5,sigmar);
figure()
imshow(denoisedImage)
