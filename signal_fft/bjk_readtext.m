%数据预处理
source_data=textread('data_1000HZ.txt','%s');
data10=hex2dec(char(source_data));
data10=reshape(data10,4,[]);
real_data=data10(1,:)+data10(2,:)*256+data10(3,:)*65536;
save('real_data.mat','real_data');