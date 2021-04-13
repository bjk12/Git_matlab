% DBSCAN �ܶȾ����㷨,XΪҪ�����������[һ��һ����,һ��һ����],epslionΪ��Χ��ֵ��MinPtsΪ��ֵ��Χ���ٽ������
function [IDX, isnoise]=DBSCANdemo(X,epsilon,MinPts)  
    C=0;
    n=size(X,1);
    %�����ĵ�ͱ߽�� 
    IDX=zeros(n,1);
    D=pdist2(X,X);
    visited=false(n,1);
    %������������߽��
    isnoise=false(n,1);
    for i=1:n
        if ~visited(i)
            visited(i)=true;
            
            Neighbors=RegionQuery(i);
            % ��� i����Χ�ı߽������С����ֵ����i�㶨Ϊ�����㣨�����߽����ǹ��
            if numel(Neighbors)<MinPts
                % �����������Ҳ�Ǳ߽����������isnoise(i)=true;IDX(i)=n;
                isnoise(i)=true;
            else
                C=C+1;
                ExpandCluster(i,Neighbors,C);
            end
            
        end
    end
    
    function ExpandCluster(i,Neighbors,C)
        % �����ĵ�i��Ϊ������C�࣬������չC��Ĵ�
        IDX(i)=C;  
        k = 1;
        while true
            j = Neighbors(k);
            
            if ~visited(j)
                visited(j)=true;
                Neighbors2=RegionQuery(j);
                % ���j��Ҳ�Ǻ��ĵ㣬����j�ı߽��Ҳ���뵽�������
                if numel(Neighbors2)>=MinPts
                    Neighbors=[Neighbors Neighbors2];   %#ok
                end
            end
            % �����ں��ĵ�ͱ߽�㶼��ΪC��
            if IDX(j)==0
                IDX(j)=C;
            end
            k = k + 1;
            % ���û���µı߽��������
            if k > numel(Neighbors)
                break;
            end
        end
    end
    
    function Neighbors=RegionQuery(i)
        Neighbors=find(D(i,:)<=epsilon);
    end 
end 