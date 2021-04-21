clc;
clear all;
x=5;%4物种数量+1入侵者
q=0.1;%入侵者作用强度
r=0.01;%种群增长率
K=1000;%入侵者的环境容纳量
N=1000;%环境容纳量
T=5000;%循环周期
gn=12;%繁殖周期
%权重
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
%初始化矩阵
a=zeros(x,T);
a(:,1)=N;
a(5,1)=100;%入侵者初始数量
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
               a(i,t) =a(i,t)+(N/temp)*L*W(i,y);%通过改变物种间相互作用的强度
               a(y,t) =a(y,t)-(N/temp)*L*W(i,y);
               else
               a(i,t) =a(i,t)+a(y,t);%通过改变物种间相互作用的强度
               a(y,t) =0;
               end
           else
               if((a(y,t)-(K/temp)*L*W(i,y))>0)
               a(i,t) =a(i,t)+(K/temp)*L*W(i,y);%通过改变物种间相互作用的强度
               a(y,t) =a(y,t)-(K/temp)*L*W(i,y);
               else
               a(i,t) =a(i,t)+a(y,t);%通过改变物种间相互作用的强度
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
%画图分析
figure(1)

plot(1:T,a(1,:),"-r");%物种1
hold on
plot(1:T,a(2,:),"-k");%物种2
hold on
plot(1:T,a(3,:),"-b");%物种3
hold on
plot(1:T,a(4,:),"-g");%物种4
hold on
plot(1:T,a(5,:),"-m","linewidth",3);%入侵生物
hold on
xlabel("cycle period"); %设置X轴标签
ylabel("population quantity"); %设置Y轴标签
% legend('species1','species2','species3','species4');
legend('species1','species2','species3','species4','invader');
ylim([0.1*N,1.4*N])

