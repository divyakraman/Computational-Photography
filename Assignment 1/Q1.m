close all
clear
%Q1(a) and Q1(b)

%Loading and Visualising Data
bayer = load('bayer2.mat'); %bayer2.mat for image2, bayer3.mat for image3
bayer = bayer.bayer2;%bayer2 for image2, bayer3 for image3
RawImage = load('RawImage2.mat'); %RawImage2.mat for image2, RawImage3.mat for image3
RawImage = RawImage.RawImage2;%RawImage2 for image2, RawImage3 for image3
figure()
imshow(RawImage)
title('Raw Image')
size1 = size(RawImage);
ReconImage = zeros(size1(1),size1(2),3);
%Reconstructing channel 1
[x y] = find(bayer==1);
v = RawImage(find(bayer==1));
v=double(v);
[xq yq] = find(bayer~=1);
vq = griddata(x,y,v,xq,yq,'linear');%linear for Q1(a) and cubic for Q1(b)
for i=1:length(x)
    ReconImage(x(i),y(i),1)=v(i);
end
for i=1:length(xq)
    ReconImage(xq(i),yq(i),1)=vq(i);
end
%Reconstructing channel 2
[x y] = find(bayer==2);
v = RawImage(find(bayer==2));
v=double(v);
[xq yq] = find(bayer~=2);
vq = griddata(x,y,v,xq,yq,'linear');%linear for Q1(a) and cubic for Q1(b)
for i=1:length(x)
    ReconImage(x(i),y(i),2)=v(i);
end
for i=1:length(xq)
    ReconImage(xq(i),yq(i),2)=vq(i);
end
%Reconstructing channel 3
[x y] = find(bayer==3);
v = RawImage(find(bayer==3));
v=double(v);
[xq yq] = find(bayer~=3);
vq = griddata(x,y,v,xq,yq,'linear');%linear for Q1(a) and cubic for Q1(b)
for i=1:length(x)
    ReconImage(x(i),y(i),3)=v(i);
end
for i=1:length(xq)
    ReconImage(xq(i),yq(i),3)=vq(i);
end
%ReconImage = reshape(ReconImage,[size1(1),size1(2),3]);
ReconImage = ReconImage/255.0;
figure()
imshow(ReconImage)
title('Demosaiced image')

%Q1(d) - In report

%Q1(e)

%Loading and Visualising Data
bayer = load('kodim_cfa.mat');
bayer = bayer.cfa;
RawImage = load('kodim19.mat'); 
RawImage = RawImage.raw;
figure()
imshow(uint8(RawImage))
title('Raw Image')
size1 = size(RawImage);
ReconImage = zeros(size1(1),size1(2),3);
%RawImage = RawImage/255.0;
%Reconstructing channel 1
[x y] = find(bayer==1);
v = RawImage(find(bayer==1));
v=double(v);
[xq yq] = find(bayer~=1);
vq = griddata(x,y,v,xq,yq,'linear');%linear for Q1(a) and cubic for Q1(b)
for i=1:length(x)
    ReconImage(x(i),y(i),1)=v(i);
end
for i=1:length(xq)
    ReconImage(xq(i),yq(i),1)=vq(i);
end
%Reconstructing channel 2
[x y] = find(bayer==2);
v = RawImage(find(bayer==2));
v=double(v);
[xq yq] = find(bayer~=2);
vq = griddata(x,y,v,xq,yq,'linear');%linear for Q1(a) and cubic for Q1(b)
for i=1:length(x)
    ReconImage(x(i),y(i),2)=v(i);
end
for i=1:length(xq)
    ReconImage(xq(i),yq(i),2)=vq(i);
end
%Reconstructing channel 3
[x y] = find(bayer==3);
v = RawImage(find(bayer==3));
v=double(v);
[xq yq] = find(bayer~=3);
vq = griddata(x,y,v,xq,yq,'linear');%linear for Q1(a) and cubic for Q1(b)
for i=1:length(x)
    ReconImage(x(i),y(i),3)=v(i);
end
for i=1:length(xq)
    ReconImage(xq(i),yq(i),3)=vq(i);
end
%ReconImage = uint8(ReconImage);%/255.0;
figure()
imshow(uint8(ReconImage))
title('Demosaiced image')

%Q1(c)

RawImage = load('RawImage3.mat'); %RawImage2.mat for image2, RawImage3.mat for image3
RawImage = RawImage.RawImage3;%RawImage2 for image2, RawImage3 for image3
%RawImage = load('kodim19.mat'); 
%RawImage = RawImage.raw;
%RawImage = uint8(RawImage);
J = demosaic(RawImage,'rggb');
imshow(J);
