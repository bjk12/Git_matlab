
%评估函数，ivalue就是总损耗，越大越好，A是需要评估的三维或者二维矩阵，n行三列的那种
function loss_calcu(A,a,b,k,kuan)
[m,~]=size(A);
ivalue=0;
% a=1;
% b=1000;
% k=2;
% kuan=0.5;
for i=1:m
    jvalue=0;
    for j=i+1:m
        long=sqrt((A(i,1)-A(j,1))^2+(A(i,2)-A(j,2))^2+(A(i,3)-A(j,3))^2);
        loss_point=loss2(long,a,b,k,kuan);
        jvalue=jvalue+loss_point;
    end  
    ivalue=ivalue+jvalue;
end
ivalue
end