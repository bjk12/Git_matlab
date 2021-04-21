function pic_loss()
x=0:0.01:5;
for i=1:length(x)
y1(i)=loss1(x(i),1,4,1.3,0.5);
y2(i)=loss2(x(i),1,4,1.3,0.5);
y3(i)=loss3(x(i),1,4,1.3,0.5);
y4(i)=loss4(x(i),1,4,1.3,0.5);
y5(i)=loss5(x(i),1,4,1.3,0.5);
end
plot(x,y1,"r-",x,y2,"b-.",'LineWidth',3);
grid on
legend("三角形函数近似","余弦函数近似")
figure(1)
plot(x,y3,'r-','LineWidth',3);
xlabel('length');
ylabel('power/length');
title("loss3");
figure(2)
plot(x,y4,'b-.','LineWidth',3);
xlabel('length');
ylabel('power/length');
title("loss4");
figure(3)
plot(x,y5,'k-.','LineWidth',3);
xlabel('length');
ylabel('power/length');
title("loss5");
end