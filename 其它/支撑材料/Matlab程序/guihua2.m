%此程序是对打包后的数据进行规划
[p,fval]=fmincon('fun2',0.5,[],[],[],[],0.5,1);
k=xlsread('dabao.xlsx',1,'A2:C439');
for i=1:438
    jiage(i,:)=(log(p/(1-p))+9.136-0.381*k(i,1)-0.004*k(i,2)-10.874*k(i,3))/0.062;
end