function SDFT()
N=10;%��N��DFT
nn=10;%��N��DFT��ֻ����ǰnn��Ƶ���ֵ
nstart=11;% ��ʾ�ڣ�nstart+N-1��ʱ�̼�֮ǰN����ɵ��ź�֡�Ĳ���Ƶ��ֵ
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
        delta=realxx(1,k)+x(1,i)-temp(1,mod(i+N-1,N)+1);%�ҵ���ΪN�������i�������ݵ��±�
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
suptitle("�ӵ�"+num2str(nstart)+"������"+num2str(nstart+N-1)+"���źŵ��Ƶ����Ϣ")
end