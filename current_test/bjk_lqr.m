%lqr状态调节器
%lqr对参考输入的跟踪控制
A=[0,1,0;0,0,1;-1,-4,-6]
B=[0,0,1]'
C=[1,0,0]
D=0; 
Q=diag([10,1,10]);
R=0.001;
K=lqr(A,B,Q,R) 
k1=K(1); 
Ac=A-B*K;
Bc=B*k1;
Cc=C;
Dc=D; 
step(Ac,Bc,Cc,Dc)

