%Question 1(a)
Im = imread('data/fish.png');
shape = size(Im);
appendcol = zeros(shape(1),51,3);
I = [Im appendcol];
shape1 = size(I);
I = double(I);
for k=1:51
    J = zeros(shape1);
    J(:,k+1:k+shape(2),:) = Im;
    I = I+J;
end
I = I/52.0;
noise = load('data/gaussNoise.mat');
I = I+noise.gaussNoise;
imshow(I/255.0);
%Question 1(b)
A = zeros(shape(2)+51,shape(2));
v = ones(52,1);
for i=1:shape(2)
    A(i:i+51,i) = v;
end
imshow(A)
%Question 1(c)
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
imshow(reconIm)

Im = Im/max(max(max(Im)));
reconIm = reconIm/max(max(max(reconIm)));
rmse = (reconIm-double(Im)).*(reconIm-double(Im));
rmse = sum(sum(sum(rmse)))/(shape(3)*shape(1)*shape(2));
rmse = sqrt(rmse);

