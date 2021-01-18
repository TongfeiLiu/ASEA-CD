clc;clear;close all;
%Code Author:Tongfei Liu
%Date:Decmber 6, 2020
%Please Cite the paper that the title is "Novel Automatic Approach for Land Cover ChangeDetection by Using VHR Remote Sensing Images"(submitted to IEEE TGRS) if this code is helpful to you

%Load bitemporal images with 3-nchannel
img1=imread('pre.tif');
img2=imread('post.tif');

figure,imshow(img1),title('Image at time1');
figure,imshow(img2),title('Image at time2');

%Obtaining change magnitude image(CMI) with ASEA.
[CMI]=ASEA_CD(img1,img2);

figure,imshow(CMI),title('CMI');

%OTSU/DFPS threshold
otsu=graythresh(CMI);
BCDM=im2bw(CMI,otsu);

figure,imshow(BCDM),title('BCDM');
imwrite(CMI,'ASEA_CMI.tif','tif');
imwrite(BCDM,'ASEA_BCDM.tif','tif');