function A=create_rec(N,C,K)
%������
N=1000;
c=C;
k=K;
g=0;

%�涨�õ�����5*5���㹹��25
d=(c+1)*(k+1);
readyx=[];
% for i=0:c
%     for j=0:k
%         readyx=cat(1,readyx,[i,j,0]);
%     end
% end
%  figure(1);
%  plot3(readyx(:,1),readyx(:,2),readyx(:,3),"*","MarkerFaceColor",'r')
 
%�涨�˵����Ժ�ʼ�۸߶�  
g=N/d;%��������g��
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