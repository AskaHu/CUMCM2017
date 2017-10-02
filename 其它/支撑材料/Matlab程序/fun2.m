function f=fun2(x)
canshu=xlsread('dabao.xlsx',1,'A2:C439');
w1=0.395;
w2=0.605;
for i=1:438
    jiage(i,:)=(log(x/(1-x))+9.136-0.381*canshu(i,1)-0.004*canshu(i,2)-10.874*canshu(i,3))/0.062;
end
pjiage=mean(jiage);
f1=x/0.625-1;
f2=pjiage/69.110778-1;
f=f2*w2-f1*w1;
disp(f1)
disp(f2)
end