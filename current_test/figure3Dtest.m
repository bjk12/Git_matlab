function figure3Dtest
% close all;clc;
% %����
% x1=1;
% y1=1;
% z1=1;
% %�߳�
% a = 0.5;
% b = 1;
% c = 1.5;
% figure()
% % 8������ֱ�Ϊ��
% % ��(0,0,0)���ڵ�4������
% % ��(a,b,c)���ڵ�4������
% V = [x1 y1 z1;a+x1 y1 z1;x1 y1+b z1;x1 y1 c+z1;
%      a+x1 b+y1 c+z1;x1 b+y1 c+z1;a+x1 y1 c+z1;a+x1 b+y1 z1];
% % 6����
% % ��(0,0,0)Ϊ�����������
% % ��(a,b,c)Ϊ�����������
% F = [1 2 7 4;1 3 6 4;1 2 8 3;
%      5 8 3 6;5 7 2 8;5 6 4 7];
% patch('Faces',F,'Vertices',V,'FaceColor',[0 0 0] ,...
%       'LineWidth',1.5,'EdgeColor','red');
% grid minor;%axis equal;
% axis([0 3 0 3 0 3]);

% % ��ؼ���
% [a,~]=size(xRow);%x�������ܹ�********�У�
% xmax=max(xRow);%x���������ֵΪ**********
% xmin=min(xRow);%x��������СֵΪ********
% %���������ǲ����õģ��������ü��ֵ
% %delta_x=xmax-xmin;%x�᷶Χ���ֵΪ*****
% %delta_x/a;%z������ԼΪ1.4796e-04����������Ϊ0.01,�����Ҫ��Ϊ��ȷ����������Ϊ0.001��0.0001
% [b,~]=size(yCol);%y������Ϊ******
% ymax=max(yCol);%y���������ֵΪ******
% ymin=min(yCol);%y��������СֵΪ********
% %���������ǲ����õģ��������ü��ֵ
% %delta_y=ymax-ymin;%�᷶Χ���ֵΪΪ******
% %delta_y/b;%y������ԼΪ9.9876e-05����������Ϊ0.01�������Ҫ��Ϊ��ȷ����������Ϊ0.001��0.0001
% % �ع���ά���ݣ���ͼ
% %���Ϊ 0.05��ʱ��X Y����Ϊ *****��****��  ����һ��ģ����������
% %���Ϊ    1��ʱ��X Y����Ϊ ***��***��    ����  �õģ��������С
% [X,Y]=meshgrid(xmin:1:xmax,ymin:1:ymax);%��x��y�����񻯣��ع����ڻ�ͼx��y������
% Z=griddata(xRow,yCol,z,X,Y);%��ֵ���ع����ڻ�ͼ��Z������
% mesh(X,Y,Z)

%����
R=5;
a=1;
b=1;
c=1;
[x,y,z] = sphere(20);

% �����뾶
x = R*x; 
y = R*y;
z = R*z;

% ��������
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