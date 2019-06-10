%Question 2(a)
Im = imread('data/fish.png');
shape = size(Im);
appendcol = zeros(shape(1),51,3);
I = [Im appendcol];
shape1 = size(I);
I = double(I);
code = [1 0 1 0 0 0 0 1 1 1 0 0 0 0 0 1 0 1 0 0 0 0 1 1 0 0 1 1 1 1 0 1 1 1 0 1 0 1 1 1 0 0 1 0 0 1 1 0 0 1 1 1]; 
for k=1:51
    J = zeros(shape1);
    J(:,k+1:k+shape(2),:) = code(k)*Im;
    I = I+J;
end
I = I/52.0;
noise = load('data/gaussNoise.mat');
I = I+noise.gaussNoise;
imshow(I/255.0);
%Question 2(b)
A = zeros(shape(2)+51,shape(2));
for i=1:shape(2)
    A(i:i+51,i) = code;
end
imshow(A)
%Question 2(c)
%Conventional code
Ac = zeros(shape(2)+51,shape(2));
v = ones(52,1);
for i=1:shape(2)
    Ac(i:i+51,i) = v;
end

x = A(:,1);
time = 1:shape(2)+51;
y = fft(x);   % Compute DFT of x
m = abs(y);   % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y));   % Phase
figure()
f = (0:length(y)-1)*100/length(y);        % Frequency vector
m = 10*log10(m);
plot(f,m)
title('Magnitude')

x = Ac(:,1);
time = 1:shape(2)+51;
y = fft(x);   % Compute DFT of x
m = abs(y);   % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y));   % Phase
figure()
f = (0:length(y)-1)*100/length(y);        % Frequency vector
m = 10*log10(m);
plot(f,m)
title('Magnitude')

%Question 2(d)

I = I-noise.gaussNoise;
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
reconIm = zeros(shape);
for j = 1:shape(1)
    for k=1:3
        b = I(j,:,k);
        b = b';
        x = Ac\b;
        reconIm(j,:,k)=x';
    end
    j
end
reconIm = reconIm/max(max(max(reconIm)));
imshow(reconIm)
