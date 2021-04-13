clc;clear;close;
fid=fopen('E:\现代信号处理\现代信号处理实验-要求\3.txt','r'); %以只读方式打开
test_dat1=textscan(fid,'%s');%以字符串方式读取数据
txt_dat = test_dat1{1,1};%读取第一行第一列字符串
dat=hex2dec(txt_dat);%十六进制转换为十进制
%数据处理
for i = 1:1:((length(dat))/4) 
    sensor_dat(i) = dat(((i-1)*4+1),1) + dat(((i-1)*4+2),1)*256 + dat(((i-1)*4+3),1)*65536;
end
figure(1);plot(sensor_dat);title('原始信号');
% fft分析
fft_dat=fft(sensor_dat);
Fs=500;
tsk_j = 0:Fs/length(sensor_dat):(Fs/2-Fs/length(sensor_dat));
FreMag=abs(fft_dat(1:floor(length(sensor_dat)/2)))/max(abs(fft_dat(1:floor(length(sensor_dat)/2))));%以最大值为基准值
% FreMag=log10(abs(fft_dat(1:floor(length(sensor_dat)/2))));
figure(2);plot(tsk_j,FreMag);title('fft分析幅频图'); 
%滤波器
Fs=500;T=1/Fs; fpl=0.6;fsl=0.1;
wp=2*fpl/Fs;ws=2*fsl/Fs;%wp、ws分别为为通带边界频率和阻带边界频率
rp=0.1;rs=60;   %DF指标;(低通滤波器的通阻带边界频率)     
[N,wp0]=ellipord(wp,ws,rp,rs);%调用ellipod计算椭圆DF阶数N和通带截止频率wp
[B,A]=ellip(N,rp,rs,wp0,'high');%调用ellip计算椭圆带通DF系统函数系数向量B和A
sensor_dat1_temp=filter(B,A,sensor_dat);%滤波器的软件实现
sensor_dat1=sensor_dat1_temp(10000:(length(sensor_dat1_temp)-30000));
figure(3);plot(sensor_dat1);title('滤波信号');
%fft分析
fft_re=fft(sensor_dat1);
tsk_j = 0:Fs/length(sensor_dat1):(Fs/2-Fs/length(sensor_dat1));
FreMag=abs(fft_re(1:floor(length(sensor_dat1)/2)))/max(abs(fft_re(1:floor(length(sensor_dat1)/2))));
% FreMag=log10(abs(fft_re(1:floor(length(sensor_dat1)/2))));
figure(4);plot(tsk_j,FreMag);
xlabel('Frequency/Hz');ylabel('Frequency Magnitude');
title('The spectrum of flowmeter signal');