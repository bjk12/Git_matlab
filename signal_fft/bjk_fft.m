N=4096;
FS=1000;
%fft
sour_data=load('real_data.mat');
sour_data=sour_data.real_data;

% x=0:1/FS:1;
% sour_data=sin(2*pi*x*100);%100Hz���ź�

figure(1)
plot(0:1/FS:(length(sour_data)-1)/FS,sour_data);
xlabel('ʱ��')
ylabel('����')
title('ԭʼ�ź�ʱ��ͼ');
signal2fft=fft(sour_data,N);
figure(2)
stem(0:FS/N:(N-1)*FS/N,abs(signal2fft),'Marker','none');
axis([0,500,-inf,inf])
xlabel('Ƶ��')
ylabel('����')
title('�źŷ�Ƶ���ԣ�����ֱ��������');

%��ͨ�˲�
fp=0.01;
fs=12;
Wp=fp/(FS/2);Ws=fs/(FS/2);Rp=1;Rs=20;
[n,Wn]= buttord(Wp,Ws,Rp,Rs);
[B,A]=butter(n,Wn,'high');
[H,w]=freqz(B,A);
figure(3)
plot(w/pi*(FS/2),20*log10(abs(H)));
axis([0,50,-inf,inf])
xlabel('Ƶ��')
title('��ͨ�˲�����ֵ��Ӧ����');

%����ȥ��ֱ������ź�
fin_data=filter(B,A,sour_data);
length2=length(fin_data);
figure(4)
signal2fft=fft(fin_data,N);
stem(0:FS/N:(N-1)*FS/N,abs(signal2fft),'Marker','none');
axis([0,500,-inf,inf])
xlabel('Ƶ��')
ylabel('����')
title('�źŷ�Ƶ���ԣ�ȥ��ֱ���ɷ֣�');