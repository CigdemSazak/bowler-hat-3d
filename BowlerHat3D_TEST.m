%   INPUT:
%       im    - 3D gray image,
%       si    - expected maximum width of the vessel,
%       no    - number of the directions,
%       r     - resolution
%
%   OUTPUT:
%       Bh    - enhanced resultant image,
%
%   USAGE:
%      si = 29; no = 64; 
%      Bh = BowlerHat3D(im,si,no);   
%
%   AUTHOR:
%       Cigdem Sazak, Carl J Nelson, Boguslaw Obara, http://boguslawobara.net/

%%Clear
clc; clear; close all;

%% Load Image
im = create3DImagesingle;
r = 1; 
%% Normalize
im = double(im); im = (im - min(im(:))) / (max(im(:)) - min(im(:))); % normalize the input image.

%% Bowler Hat
si = 20;                              % size of the disk element
no = 64;                              % number of orientation
bh = BowlerHat3D(im,si,no,r,r,r);     % call the bowler-hat script

%Plotting
figure; 
subplot(231), imagesc(squeeze(max(im,[],1))); colormap jet; axis off; axis equal; axis tight;title('im X');
subplot(232), imagesc(squeeze(max(im,[],1))); colormap jet; axis off; axis equal; axis tight;title('im Y');
subplot(233), imagesc(squeeze(max(im,[],1))); colormap jet; axis off; axis equal; axis tight;title('im Z');
subplot(234), imagesc(squeeze(max(bh,[],1))); colormap jet; axis off; axis equal; axis tight;title('BH X');
subplot(235), imagesc(squeeze(max(bh,[],2))); colormap jet; axis off; axis equal; axis tight;title('BH Y');
subplot(236), imagesc(squeeze(max(bh,[],3))); colormap jet; axis off; axis equal; axis tight;title('BH Z');
   
