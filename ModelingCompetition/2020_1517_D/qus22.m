clc;
close all;
x=4;%物种个数
r=0.01;%种群增长率
N=100;%环境容纳量K
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
%初始化矩阵
a=zeros(x,T);
a(:,1)=N;
a(1,1)=0.05*N;%问题二 2.1 敏感性分析调参数：单个种群物种数量，种群数量的改变对输出的影响
%当出现疾病的情况，对种群数量的影响，足够小，且不易出现偶然性物种灭绝
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
           a(i,t) =a(i,t)+(N/temp)*L*W(i,y);%通过改变物种间相互作用的强度
           a(y,t) =a(y,t)-(N/temp)*L*W(i,y);
    end
    if(0==mod(t,gn))
        for i=1:x
            if(a(i,t)<N)
                a(i,t)=a(i,t)+r*a(i,t)*(1-a(i,t)/N);
            else
                a(i,t)=N;
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
xlabel("cycle period"); %设置X轴标签
ylabel("population quantity"); %设置Y轴标签
% plot(1:T,a(5,:),"-m");%物种5
% hold on
% plot(1:T,a(6,:),"-c");%物种6
% hold on
legend('species1','species2','species3','species4');
ylim([0.1*N,1.5*N])

