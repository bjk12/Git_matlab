function A=create_rec(N,C,K)
%长方体
N=1000;
c=C;
k=K;
g=0;

%规定好底面是5*5个点构成25
d=(c+1)*(k+1);
readyx=[];
% for i=0:c
%     for j=0:k
%         readyx=cat(1,readyx,[i,j,0]);
%     end
% end
%  figure(1);
%  plot3(readyx(:,1),readyx(:,2),readyx(:,3),"*","MarkerFaceColor",'r')
 
%规定了底面以后开始累高度  
g=N/d;%最多可以累g层
 for i=0:c
   for j=0:k
        for gg=0:g-1
            readyx=cat(1,readyx,[i,j,gg]);
        end
    end
end
A=readyx;
%readyx=unique(readyx,'rows');
 figure(2);
 plot3(readyx(:,1),readyx(:,2),readyx(:,3),"o","MarkerFaceColor",'k');
 axis equal
 grid on
 hold on