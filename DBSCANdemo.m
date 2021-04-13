% DBSCAN 密度聚类算法,X为要聚类的数据组[一行一样本,一列一特征],epslion为范围阈值，MinPts为阈值范围内临近点个数
function [IDX, isnoise]=DBSCANdemo(X,epsilon,MinPts)  
    C=0;
    n=size(X,1);
    %含核心点和边界点 
    IDX=zeros(n,1);
    D=pdist2(X,X);
    visited=false(n,1);
    %噪声点和少数边界点
    isnoise=false(n,1);
    for i=1:n
        if ~visited(i)
            visited(i)=true;
            
            Neighbors=RegionQuery(i);
            % 如果 i点周围的边界点数量小于阈值，则将i点定为噪声点（少数边界点躺枪）
            if numel(Neighbors)<MinPts
                % 会出现噪声点也是边界点的情况，即isnoise(i)=true;IDX(i)=n;
                isnoise(i)=true;
            else
                C=C+1;
                ExpandCluster(i,Neighbors,C);
            end
            
        end
    end
    
    function ExpandCluster(i,Neighbors,C)
        % 将核心点i设为新增的C类，尝试拓展C类的簇
        IDX(i)=C;  
        k = 1;
        while true
            j = Neighbors(k);
            
            if ~visited(j)
                visited(j)=true;
                Neighbors2=RegionQuery(j);
                % 如果j点也是核心点，就让j的边界点也加入到这个簇中
                if numel(Neighbors2)>=MinPts
                    Neighbors=[Neighbors Neighbors2];   %#ok
                end
            end
            % 将簇内核心点和边界点都设为C类
            if IDX(j)==0
                IDX(j)=C;
            end
            k = k + 1;
            % 如果没有新的边界点加入簇中
            if k > numel(Neighbors)
                break;
            end
        end
    end
    
    function Neighbors=RegionQuery(i)
        Neighbors=find(D(i,:)<=epsilon);
    end 
end 