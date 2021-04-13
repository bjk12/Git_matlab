clc;clear;close;
fid=fopen('E:\�ִ��źŴ���\�ִ��źŴ���ʵ��-Ҫ��\3.txt','r'); %��ֻ����ʽ��
test_dat1=textscan(fid,'%s');%���ַ�����ʽ��ȡ����
txt_dat = test_dat1{1,1};%��ȡ��һ�е�һ���ַ���
dat=hex2dec(txt_dat);%ʮ������ת��Ϊʮ����
%���ݴ���
for i = 1:1:((length(dat))/4) 
    sensor_dat(i) = dat(((i-1)*4+1),1) + dat(((i-1)*4+2),1)*256 + dat(((i-1)*4+3),1)*65536;
end
figure(1);plot(sensor_dat);title('ԭʼ�ź�');
% fft����
fft_dat=fft(sensor_dat);
Fs=500;
tsk_j = 0:Fs/length(sensor_dat):(Fs/2-Fs/length(sensor_dat));
FreMag=abs(fft_dat(1:floor(length(sensor_dat)/2)))/max(abs(fft_dat(1:floor(length(sensor_dat)/2))));%�����ֵΪ��׼ֵ
% FreMag=log10(abs(fft_dat(1:floor(length(sensor_dat)/2))));
figure(2);plot(tsk_j,FreMag);title('fft������Ƶͼ'); 
%�˲���
Fs=500;T=1/Fs; fpl=0.6;fsl=0.1;
wp=2*fpl/Fs;ws=2*fsl/Fs;%wp��ws�ֱ�ΪΪͨ���߽�Ƶ�ʺ�����߽�Ƶ��
rp=0.1;rs=60;   %DFָ��;(��ͨ�˲�����ͨ����߽�Ƶ��)     
[N,wp0]=ellipord(wp,ws,rp,rs);%����ellipod������ԲDF����N��ͨ����ֹƵ��wp
[B,A]=ellip(N,rp,rs,wp0,'high');%����ellip������Բ��ͨDFϵͳ����ϵ������B��A
sensor_dat1_temp=filter(B,A,sensor_dat);%�˲��������ʵ��
sensor_dat1=sensor_dat1_temp(10000:(length(sensor_dat1_temp)-30000));
figure(3);plot(sensor_dat1);title('�˲��ź�');
%fft����
fft_re=fft(sensor_dat1);
tsk_j = 0:Fs/length(sensor_dat1):(Fs/2-Fs/length(sensor_dat1));
FreMag=abs(fft_re(1:floor(length(sensor_dat1)/2)))/max(abs(fft_re(1:floor(length(sensor_dat1)/2))));
% FreMag=log10(abs(fft_re(1:floor(length(sensor_dat1)/2))));
figure(4);plot(tsk_j,FreMag);
xlabel('Frequency/Hz');ylabel('Frequency Magnitude');
title('The spectrum of flowmeter signal');