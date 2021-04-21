clear all;
a=1;
b=5;
k=10;
kuan=0.5;
max=0;
maxN=0;
pointN=999;%点数，越大会算得越慢，计算量平方级增加，建议用2000以下的数字进行测试
MAX=ones(1,3);
x=[0 0 0];
readyx=[1 1 1];
xx=x(1,1);
yy=x(1,2);
zz=x(1,3);
readyx=cat(1,readyx,[xx+1,yy+1,zz+1]);
readyx=cat(1,readyx,[xx+1,yy+1,zz-1]);
readyx=cat(1,readyx,[xx+1,yy+1,zz]);

readyx=cat(1,readyx,[xx+1,yy-1,zz+1]);
readyx=cat(1,readyx,[xx+1,yy-1,zz-1]);
readyx=cat(1,readyx,[xx+1,yy-1,zz]);

readyx=cat(1,readyx,[xx+1,yy,zz+1]);
readyx=cat(1,readyx,[xx+1,yy,zz-1]);
readyx=cat(1,readyx,[xx+1,yy,zz]);

readyx=cat(1,readyx,[xx-1,yy+1,zz+1]);
readyx=cat(1,readyx,[xx-1,yy+1,zz-1]);
readyx=cat(1,readyx,[xx-1,yy+1,zz]);

readyx=cat(1,readyx,[xx-1,yy-1,zz+1]);
readyx=cat(1,readyx,[xx-1,yy-1,zz-1]);
readyx=cat(1,readyx,[xx-1,yy-1,zz]);

readyx=cat(1,readyx,[xx-1,yy,zz+1]);
readyx=cat(1,readyx,[xx-1,yy,zz-1]);
readyx=cat(1,readyx,[xx-1,yy,zz]);

readyx=cat(1,readyx,[xx,yy+1,zz+1]);
readyx=cat(1,readyx,[xx,yy+1,zz-1]);
readyx=cat(1,readyx,[xx,yy+1,zz]);

readyx=cat(1,readyx,[xx,yy-1,zz+1]);
readyx=cat(1,readyx,[xx,yy-1,zz-1]);
readyx=cat(1,readyx,[xx,yy-1,zz]);

readyx=cat(1,readyx,[xx,yy,zz+1]);
readyx=cat(1,readyx,[xx,yy,zz-1]);

readyx=unique(readyx,'rows');
for c=1:pointN 
    [mr,~]=size(readyx);
    [mx,~]=size(x);
    max=0;
    maxN=0;
    for i=1:mr
        jvalue=0;
        long_sum=0;
        for j=1:mx
          long=sqrt((readyx(i,1)-x(j,1))^2+(readyx(i,2)-x(j,2))^2+(readyx(i,3)-x(j,3))^2);
          loss_point=loss1(long,a,b,k,kuan);
          jvalue=jvalue+loss_point;
          long_sum=long_sum+long;
        end
     if(i==1)
         long_min=long_sum;
     end
     if(max<=jvalue)
         if(long_min>=long_sum)
             long_min=long_sum;
             max=jvalue;
             maxN=i;
         end
     end 
    end
    MAX=readyx(maxN,:);
    x=cat(1,x,MAX);
    readyx(maxN,:)=[];
    xx=MAX(1,1);
    yy=MAX(1,2);
    zz=MAX(1,3);
    readyx=cat(1,readyx,[xx+1,yy+1,zz+1]);
    readyx=cat(1,readyx,[xx+1,yy+1,zz-1]);
    readyx=cat(1,readyx,[xx+1,yy+1,zz]);
    
    readyx=cat(1,readyx,[xx+1,yy-1,zz+1]);
    readyx=cat(1,readyx,[xx+1,yy-1,zz-1]);
    readyx=cat(1,readyx,[xx+1,yy-1,zz]);
    
    readyx=cat(1,readyx,[xx+1,yy,zz+1]);
    readyx=cat(1,readyx,[xx+1,yy,zz-1]);
    readyx=cat(1,readyx,[xx+1,yy,zz]);
    
    readyx=cat(1,readyx,[xx-1,yy+1,zz+1]);
    readyx=cat(1,readyx,[xx-1,yy+1,zz-1]);
    readyx=cat(1,readyx,[xx-1,yy+1,zz]);
    
    readyx=cat(1,readyx,[xx-1,yy-1,zz+1]);
    readyx=cat(1,readyx,[xx-1,yy-1,zz-1]);
    readyx=cat(1,readyx,[xx-1,yy-1,zz]);
    
    readyx=cat(1,readyx,[xx-1,yy,zz+1]);
    readyx=cat(1,readyx,[xx-1,yy,zz-1]);
    readyx=cat(1,readyx,[xx-1,yy,zz]);
    
    readyx=cat(1,readyx,[xx,yy+1,zz+1]);
    readyx=cat(1,readyx,[xx,yy+1,zz-1]);
    readyx=cat(1,readyx,[xx,yy+1,zz]);
    
    readyx=cat(1,readyx,[xx,yy-1,zz+1]);
    readyx=cat(1,readyx,[xx,yy-1,zz-1]);
    readyx=cat(1,readyx,[xx,yy-1,zz]);
    
    readyx=cat(1,readyx,[xx,yy,zz+1]);
    readyx=cat(1,readyx,[xx,yy,zz-1]);
    readyx=unique(readyx,'rows');
    readyx=setdiff(readyx,x,'rows');
end
plot3(x(:,1),x(:,2),x(:,3),"o","MarkerFaceColor",'k')
axis equal
grid on
hold on
plot3(readyx(:,1),readyx(:,2),readyx(:,3),"o","MarkerFaceColor",'r');


