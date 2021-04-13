
[t,x]=ode45('sir',[0,100],[0.99 0.01 0]);
%ode45参数：1.函数句柄or函数名 2.t的取值 3.3个y的初始值
%ode45是用来求解常微分函数的方法
%原问题只知道变化率函数，这里求解原函数，用到该方法
[t,x]
H=plot(t,x(:,1),'-',t,x(:,2),'--',t,x(:,3),'-.');
legend(H([1 2 3]),'未感染S','已感染I','已治愈R')