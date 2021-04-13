function SDFT()
N=10;%做N点DFT
nn=10;%做N点DFT但只计算前nn个频域的值
nstart=11;% 显示第（nstart+N-1）时刻及之前N点组成的信号帧的部分频域值
x=[1,2,-3,4,2,-4,1,3,-5,-4,2,3,-4,-7,3,-8,1,-3,4,-6,7,8,-9,2,5,9,10,-21,2,1];
x1=x(1,nstart:nstart+N-1);
XbyDFT=fft(x1,N);
tempi=1;
temp=zeros(1,N);
realxx=zeros(1,N);
imagxx=zeros(1,N);
for i=1:nstart+N-1
    for k=1:nn
%         delta=x(1,i)-temp(1,tempi);
        delta=realxx(1,k)+x(1,i)-temp(1,mod(i+N-1,N)+1);%找到长为N的数组第i个新数据的下标
        realxx(1,k)=cos(2*pi*(k-1)/N)*delta-sin(2*pi*(k-1)/N)*imagxx(1,k);
        imagxx(1,k)=cos(2*pi*(k-1)/N)*imagxx(1,k)+sin(2*pi*(k-1)/N)*delta;
    end
    temp(1,mod(i+N-1,N)+1)=x(1,i);
%     temp(1,tempi)=x(1,i);
%     tempi=tempi+1;
%     if(tempi==N+1)
%         tempi=1;
%     end
end
figure('Color',[1 1 1])
subplot(2,2,1);
ser=0:nn-1;
stem(ser,real(XbyDFT(1,1:nn)),'Marker','.','MarkerSize',20);
title('DFT(real)')
subplot(2,2,2);
stem(ser,imag(XbyDFT(1,1:nn)),'Marker','.','MarkerSize',20)
title('DFT(imag)')
subplot(2,2,3);
stem(ser,realxx(1,1:nn))
title('S_DFT(real)','Interpreter','none')
subplot(2,2,4);
stem(ser,imagxx(1,1:nn))
title('S_DFT(imag)','Interpreter','none')
suptitle("从第"+num2str(nstart)+"个到第"+num2str(nstart+N-1)+"个信号点的频域信息")
end