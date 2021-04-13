function figure3Dtest
% close all;clc;
% %坐标
% x1=1;
% y1=1;
% z1=1;
% %边长
% a = 0.5;
% b = 1;
% c = 1.5;
% figure()
% % 8个顶点分别为：
% % 与(0,0,0)相邻的4个顶点
% % 与(a,b,c)相邻的4个顶点
% V = [x1 y1 z1;a+x1 y1 z1;x1 y1+b z1;x1 y1 c+z1;
%      a+x1 b+y1 c+z1;x1 b+y1 c+z1;a+x1 y1 c+z1;a+x1 b+y1 z1];
% % 6个面
% % 以(0,0,0)为顶点的三个面
% % 以(a,b,c)为顶点的三个面
% F = [1 2 7 4;1 3 6 4;1 2 8 3;
%      5 8 3 6;5 7 2 8;5 6 4 7];
% patch('Faces',F,'Vertices',V,'FaceColor',[0 0 0] ,...
%       'LineWidth',1.5,'EdgeColor','red');
% grid minor;%axis equal;
% axis([0 3 0 3 0 3]);

% % 相关计算
% [a,~]=size(xRow);%x轴数据总共********行；
% xmax=max(xRow);%x轴数据最大值为**********
% xmin=min(xRow);%x轴数据最小值为********
% %下面两行是测试用的，便于设置间隔值
% %delta_x=xmax-xmin;%x轴范围宽度值为*****
% %delta_x/a;%z轴间隔大约为1.4796e-04，可以设置为0.01,如果想要更为精确，可以设置为0.001、0.0001
% [b,~]=size(yCol);%y轴数据为******
% ymax=max(yCol);%y轴数据最大值为******
% ymin=min(yCol);%y轴数据最小值为********
% %下面两行是测试用的，便于设置间隔值
% %delta_y=ymax-ymin;%轴范围宽度值为为******
% %delta_y/b;%y轴间隔大约为9.9876e-05，可以设置为0.01，如果想要根为精确，可以设置为0.001、0.0001
% % 重构三维数据，画图
% %间隔为 0.05的时候，X Y数据为 *****×****，  电脑一般的，将间隔调大
% %间隔为    1的时候，X Y数据为 ***×***，    电脑  好的，将间隔调小
% [X,Y]=meshgrid(xmin:1:xmax,ymin:1:ymax);%将x、y轴网格化，重构用于画图x、y轴数据
% Z=griddata(xRow,yCol,z,X,Y);%插值，重构用于画图的Z轴数据
% mesh(X,Y,Z)

%例子
R=5;
a=1;
b=1;
c=1;
[x,y,z] = sphere(20);

% 调整半径
x = R*x; 
y = R*y;
z = R*z;

% 调整球心
x = x+a;
y = y+b;
z = z+c;
% figure(1)
% 
% plot3(x,y,z,'g','LineWidth',2)

figure(2)

mesh(x,y,z)

% figure(3)
% 
%meshc(X,Y,Z)
% 
% figure(4)
% 
% meshz(x,y,z)
% 
% figure(5)
% 
% surf(x,y,z)
% 
% figure(6)
% 
% surfc(x,y,z)
% 
% figure(7)
% 
% surfl(x,y,z)
end