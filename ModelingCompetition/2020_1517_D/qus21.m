clc;
close all;
x=4;%��������
N=10;%����������
T=5000;%ѭ������
%Ȩ��
W3=[0,1,-1;
    -1,0,1;
    1,-1,0];
W4=[0  2  1 -3;
   -2 0  1  1;
   -1 -1 0  2;
    3 -1 -2 0];
W5=[0  1  1  -1  -1;
    -1 0  1  1   -1;
    -1 -1 0  1   1;
    1 -1 -1  0   1;
    1  1 -1  -1  0];
W6=[0   4   1   1  -1  -5;
    -4  0   3   1  1   -1;
    -1  -3  0   2  1   1;
    -1  -1  -2  0  3   1;
    1   -1  -1  -3  0  4
    5   1   -1  -1 -4  0];
%��ʼ������
a=zeros(x,T);
a(:,1)=N;
for t=2:T
    a(:,t)=a(:,t-1);
    for i=1:x
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
           a(i,t) =a(i,t)+(N/temp)*L*W(i,y);%ͨ���ı����ּ��໥���õ�ǿ��
           a(y,t) =a(y,t)-(N/temp)*L*W(i,y);
    end
end
%��ͼ����
figure(1)
plot(1:T,a(1,:),"-r");%����1
xlabel("cycle period"); %����X���ǩ
ylabel("population quantity"); %����Y���ǩ
hold on
plot(1:T,a(2,:),"-k");%����2
hold on
plot(1:T,a(3,:),"-b");%����3
hold on
plot(1:T,a(4,:),"-g");%����4
hold on
% plot(1:T,a(5,:),"-m");%����5
% hold on
% plot(1:T,a(6,:),"-c");%����6
% hold on
legend('species1','species2','species3');
legend('species1','species2','species3','species4');
legend('species1','species2','species3','species4','species5');
legend('species1','species2','species3','species4','species5','species6');
ylim([0.6*N,1.4*N])

