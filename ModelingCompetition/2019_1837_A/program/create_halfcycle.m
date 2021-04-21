function A=create_halfcycle(pointN)
%³€·½Με
% pointN=998;
x=[0 0 2];
readyx=[0 0 1];
xx=x(1,1);
yy=x(1,2);
zz=x(1,3);
readyx=cat(1,readyx,[xx+1,yy+1,zz+1]);
readyx=cat(1,readyx,[xx+1,yy+1,zz]);

readyx=cat(1,readyx,[xx+1,yy-1,zz+1]);
readyx=cat(1,readyx,[xx+1,yy-1,zz]);

readyx=cat(1,readyx,[xx+1,yy,zz+1]);
readyx=cat(1,readyx,[xx+1,yy,zz]);

readyx=cat(1,readyx,[xx-1,yy+1,zz+1]);
readyx=cat(1,readyx,[xx-1,yy+1,zz]);

readyx=cat(1,readyx,[xx-1,yy-1,zz+1]);
readyx=cat(1,readyx,[xx-1,yy-1,zz]);

readyx=cat(1,readyx,[xx-1,yy,zz+1]);
readyx=cat(1,readyx,[xx-1,yy,zz]);

readyx=cat(1,readyx,[xx,yy+1,zz+1]);
readyx=cat(1,readyx,[xx,yy+1,zz]);

readyx=cat(1,readyx,[xx,yy-1,zz+1]);
readyx=cat(1,readyx,[xx,yy-1,zz]);

readyx=cat(1,readyx,[xx,yy,zz+1]);  
readyx=unique(readyx,'rows');
for c=1:pointN 
    [mr,~]=size(readyx);
    [mx,~]=size(x);
    maxN=0;
    for i=1:mr
        long_sum=0;
        for j=1:mx
            if(c<=pointN/2)
          long=sqrt((readyx(i,1))^2+(readyx(i,2))^2+(readyx(i,3)-2)^2);
            else
          long=sqrt((readyx(i,1))^2+(readyx(i,2))^2+(readyx(i,3)+2)^2);
            end
          long_sum=long_sum+long;
        end
     if(i==1)
         long_min=long_sum;
     end
     if(long_min>=long_sum)
         long_min=long_sum;
         maxN=i;
     end
    end
    MAX=readyx(maxN,:);
    x=cat(1,x,MAX);
    readyx(maxN,:)=[];
    xx=MAX(1,1);
    yy=MAX(1,2);
    zz=MAX(1,3);
    if(c==pointN/2)
        x=[x;[0 0 -2]];
        readyx=[];
        xx=0;
        yy=0;
        zz=-2;
    end
   if(c<=pointN/2)
    readyx=cat(1,readyx,[xx+1,yy+1,zz+1]);
    readyx=cat(1,readyx,[xx+1,yy+1,zz]);

    readyx=cat(1,readyx,[xx+1,yy-1,zz+1]);
    readyx=cat(1,readyx,[xx+1,yy-1,zz]);

    readyx=cat(1,readyx,[xx+1,yy,zz+1]);
    readyx=cat(1,readyx,[xx+1,yy,zz]);

    readyx=cat(1,readyx,[xx-1,yy+1,zz+1]);
    readyx=cat(1,readyx,[xx-1,yy+1,zz]);

    readyx=cat(1,readyx,[xx-1,yy-1,zz+1]);
    readyx=cat(1,readyx,[xx-1,yy-1,zz]);

    readyx=cat(1,readyx,[xx-1,yy,zz+1]);
    readyx=cat(1,readyx,[xx-1,yy,zz]);

    readyx=cat(1,readyx,[xx,yy+1,zz+1]);
    readyx=cat(1,readyx,[xx,yy+1,zz]);

    readyx=cat(1,readyx,[xx,yy-1,zz+1]);
    readyx=cat(1,readyx,[xx,yy-1,zz]);

    readyx=cat(1,readyx,[xx,yy,zz+1]);
   else
    readyx=cat(1,readyx,[xx+1,yy+1,zz-1]);
    readyx=cat(1,readyx,[xx+1,yy+1,zz]);

    readyx=cat(1,readyx,[xx+1,yy-1,zz-1]);
    readyx=cat(1,readyx,[xx+1,yy-1,zz]);

    readyx=cat(1,readyx,[xx+1,yy,zz-1]);
    readyx=cat(1,readyx,[xx+1,yy,zz]);

    readyx=cat(1,readyx,[xx-1,yy+1,zz-1]);
    readyx=cat(1,readyx,[xx-1,yy+1,zz]);

    readyx=cat(1,readyx,[xx-1,yy-1,zz-1]);
    readyx=cat(1,readyx,[xx-1,yy-1,zz]);

    readyx=cat(1,readyx,[xx-1,yy,zz-1]);
    readyx=cat(1,readyx,[xx-1,yy,zz]);

    readyx=cat(1,readyx,[xx,yy+1,zz-1]);
    readyx=cat(1,readyx,[xx,yy+1,zz]);

    readyx=cat(1,readyx,[xx,yy-1,zz-1]);
    readyx=cat(1,readyx,[xx,yy-1,zz]);

    readyx=cat(1,readyx,[xx,yy,zz-1]);   
   end
    readyx=unique(readyx,'rows');
    readyx=setdiff(readyx,x,'rows');
end
% loss_calcu(x,a,b,k,kuan)
figure(1)
plot3(x(:,1),x(:,2),x(:,3),"o","MarkerFaceColor",'k')
axis equal
grid on
hold on
% plot3(readyx(:,1),readyx(:,2),readyx(:,3),"o","MarkerFaceColor",'r')
A=x;