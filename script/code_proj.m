%1.1
A=imread("C:\Users\mrham\Desktop\signal&systems_amirHosseinHami_40121093\houses.bmp");
% Convert values to the range 0 to 1
A_gray=mat2gray(A);

figure(1);
imshow(A_gray);
title('Image');

%1.2
% Add Gaussian noise with variance 0.2
C = 0.2; % Noise intensity
noise = C * randn(size(A_gray));
A_noisy = A_gray + noise;
% Limit values to the range 0 to 1
A_noisy = max(min(A_noisy, 1), 0);

figure(2);
imshow(A_noisy);
title('Noisy Image (Variance = 0.2)');

%1.3
M = 7;
filter= ones(1, M) / M;
% Apply filter in the horizontal direction
% The last argument ensures that for corner pixels, where neighboring pixels might not exist, a value of zero is considered.
% We could have also used a loop instead of convolution.
A_filtered = conv2(A_noisy, filter, 'same');

figure(3);
imshow(A_filtered);
title('Filtered Image (1 dimension Mean Filter, M=7)');

%1.4
% Calculate frequency response
figure(4);
freqz(filter, 1);
% Shows both magnitude and phase
title('Frequency Response of 1D Mean Filter (M=7)');

%1.5
M3 = 3;
filter_M3 = ones(1, M3) / M3;
A_filtered_M3 = conv2(A_noisy, filter_M3, 'same');
% Filter for M=15
M15 = 15;
filter_M15 = ones(1, M15) / M15;
A_filtered_M15 = conv2(A_noisy, filter_M15, 'same');

figure(5);

imshow(A_filtered_M3);
title('Filtered Image (M=3)');

figure(6);
imshow(A_filtered_M15);
title('Filtered Image (M=15)');

figure(7);
freqz(filter_M3, 1);
title('Frequency Response (M=3)');
figure(8);
freqz(filter_M15, 1);
title('Frequency Response (M=15)');

%1.6
C = 0.5;
noise = C * randn(size(A_gray));
A_noisy_5 = A_gray + noise;
A_noisy_5 = max(min(A_noisy_5, 1), 0);
% imshow(A_noisy_5);
% title('Noisy Image (Variance = 0.5)');
% Apply filter for stronger noise
A_filtered_5 = conv2(A_noisy_5, filter, 'same');

figure(9);
imshow(A_filtered_5);
title('Filtered Image (High Noise Intensity, C=0.5, 1D)');
C=0.08;
noise = C * randn(size(A_gray));
A_noisy_08 = A_gray + noise;
A_noisy_08 = max(min(A_noisy_08, 1), 0);
% imshow(A_noisy_08);
% title('Noisy Image (Variance = 0.08)');
% Apply filter for weaker noise
A_filtered_08 = conv2(A_noisy_08, filter, 'same');

figure(10);
imshow(A_filtered_08);
title('Filtered Image (low Noise Intensity, C=0.08, 1D)');

%2.1
M7 = 7;
filter_2D_7x7 = ones(M7, M7) / (M7 * M7);
% Apply 2D filter
A_filtered_2D_7x7 = conv2(A_noisy, filter_2D_7x7, 'same');
M9 = 9;
filter_2D_9x9 = ones(M9, M9) / (M9 * M9);
% Apply 2D filter
A_filtered_2D_9x9 = conv2(A_noisy, filter_2D_9x9, 'same');

figure(11);

imshow(A_filtered_2D_7x7);
title('Filtered Image (2D, 7x7)');

figure(12);
imshow(A_filtered_2D_9x9);
title('Filtered Image (2D, 9x9)');

%2.2
C = 0.5;
noise = C * randn(size(A_gray));
A_noisy_5 = A_gray + noise;
A_noisy_5 = max(min(A_noisy_5, 1), 0);
% Apply filter for stronger noise
A_filtered_2d_5_7 = conv2(A_noisy_5, filter_2D_7x7, 'same');

figure(13);
imshow(A_filtered_2d_5_7);
title('Filtered Image (High Noise, C=0.5, 2D, M=7)');
A_filtered_2d_5_9 = conv2(A_noisy_5, filter_2D_9x9, 'same');

figure(14);
imshow(A_filtered_2d_5_9);
title('Filtered Image (High Noise, C=0.5, 2D, M=9)');
C=0.08;
noise = C * randn(size(A_gray));
A_noisy_08 = A_gray + noise;
A_noisy_08 = max(min(A_noisy_08, 1), 0);
% Apply filter for weaker noise
A_filtered_2d_08_7 = conv2(A_noisy_08, filter_2D_7x7, 'same');

figure(15);
imshow(A_filtered_2d_08_7);
title('Filtered Image (low Noise, C=0.08, 2D, M=7)');
% Apply filter for weaker noise
A_filtered_2d_08_9 = conv2(A_noisy_08, filter_2D_9x9, 'same');

figure(16);
imshow(A_filtered_2d_08_9);
title('Filtered Image (low Noise, C=0.08, 2D, M=9)');

%3.1
A_diff = A_gray - circshift(A_gray, [0, 1]);

figure(17);
imshow(A_diff);
title('Differential Filtered Image');

%3.2
filter_diff = [1, -1];
figure(18);
freqz(filter_diff, 1);
title('Frequency Response of Differential Filter');