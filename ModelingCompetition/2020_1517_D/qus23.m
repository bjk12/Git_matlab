clc;
clear all;
x=5;%4��������+1������
q=0.1;%����������ǿ��
r=0.01;%��Ⱥ������
K=1000;%�����ߵĻ���������
N=1000;%����������
T=5000;%ѭ������
gn=12;%��ֳ����
%Ȩ��
W3=[0,1,-1;
    -1,0,1;
    1,-1,0];
W4=[0  2  1 -3;
   -2 0  1  1;
   -1 -1 0  2;
    3 -1 -2 0];
W5=[0  2  1 -3 0;
   -2  0  1  1 0;
   -1 -1 0  2  0;
    3 -1 -2 0  0;
    q  0  0 0  0];
W6=[];
%��ʼ������
a=zeros(x,T);
a(:,1)=N;
a(5,1)=100;%�����߳�ʼ����
for t=2:T
    a(:,t)=a(:,t-1);
    for i=1:x
        if(a(i,t)<=0)
                a(:,t)=0;
                continue;
        end
        if (x==3)
            W=W3;
           B = find(W3(i,:)>0);
        else if(x==4)
                 W=W4;
               B = find(W4(i,:)>0);  
            else if (5==x)
                     W=W5;
                  B = find(W5(i,:)>0);   
                else
                     W=W6;
                     B = find(W6(i,:)>0);
                end
            end      
        end
           L = length(B);
           alp=randi([1,L],1,1);
           y=B(alp);
           temp=a(i,t);
           if(i<x)
               if(a(y,t)-(N/temp)*L*W(i,y)>0)
               a(i,t) =a(i,t)+(N/temp)*L*W(i,y);%ͨ���ı����ּ��໥���õ�ǿ��
               a(y,t) =a(y,t)-(N/temp)*L*W(i,y);
               else
               a(i,t) =a(i,t)+a(y,t);%ͨ���ı����ּ��໥���õ�ǿ��
               a(y,t) =0;
               end
           else
               if((a(y,t)-(K/temp)*L*W(i,y))>0)
               a(i,t) =a(i,t)+(K/temp)*L*W(i,y);%ͨ���ı����ּ��໥���õ�ǿ��
               a(y,t) =a(y,t)-(K/temp)*L*W(i,y);
               else
               a(i,t) =a(i,t)+a(y,t);%ͨ���ı����ּ��໥���õ�ǿ��
               a(y,t) =0;
               end
           end
           if(a(i,t)<=0)
                a(i,t)=0;
           elseif(a(i,t)>N)
                a(i,t)=N;
           end
    end
    if(0==mod(t,gn))
        for i=1:x
            if((a(i,t)<N) && (a(i,t)>0))
                a(i,t)=a(i,t)+r*a(i,t)*(1-a(i,t)/N);
            end
        end
    end
end
%��ͼ����
figure(1)

plot(1:T,a(1,:),"-r");%����1
hold on
plot(1:T,a(2,:),"-k");%����2
hold on
plot(1:T,a(3,:),"-b");%����3
hold on
plot(1:T,a(4,:),"-g");%����4
hold on
plot(1:T,a(5,:),"-m","linewidth",3);%��������
hold on
xlabel("cycle period"); %����X���ǩ
ylabel("population quantity"); %����Y���ǩ
% legend('species1','species2','species3','species4');
legend('species1','species2','species3','species4','invader');
ylim([0.1*N,1.4*N])

