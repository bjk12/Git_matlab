%关于纳什平衡的小例子
function Nasen()
flag1=0;
N=100;
initialmoney=20;
p4p2=2;
player=zeros(2,N);
player(:,1)=initialmoney;
for count=1:1000
    player=zeros(2,N);
    player(:,1)=initialmoney;
    for i=2:N
        player(:,i)=player(:,i-1);
        if(player(1,i)<0)
            flag1=flag1+1
            break
        end
        p1=randi(8);
        p2=randi(8);
        if((p1<5)&&(p2<p4p2))
           player(1,i)= player(1,i)-1;
           player(2,i)= player(2,i)+1;
        elseif((p1>5)&&(p2>p4p2))
           player(1,i)= player(1,i)-3;
           player(2,i)= player(2,i)+3; 
        else
           player(1,i)= player(1,i)+2;
           player(2,i)= player(2,i)-2;
        end
    end
end
figure(1)
plot(1:N,player(1,:),"r-",1:N,player(2,:),"b.-")
legend("player1","player2")
ylim([-10,200])
end