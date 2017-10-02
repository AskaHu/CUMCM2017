%此程序是用来规划
[p,fval]=fmincon('fun1',0.5,[],[],[],[],0.5,1);
k=xlsread('zhibiao.xlsx',1,'A1:C835');
result=xlsread('zhibiao.xlsx',1,'D1:D835');
price=xlsread('mission.xls',1,'D2:D836');
jw=xlsread('mission.xls',1,'B2:C836');
x1=0;
for x=1:835
    if result(x)==0
        x1=x1+1;
        oldprice(x1,:)=price(x);
        newprice(x1,:)=(log(p/(1-p))+9.136-0.381*k(x,1)-0.004*k(x,2)-10.874*k(x,3))/0.062;
        jw1(x1,:)=jw(x,:);
    end
end
old=mean(oldprice);
new=mean(newprice);
y1=0;
for y=1:835
    if result(y)==1
        y1=y1+1;
        oldprice1(y1,:)=price(y);
        newprice1(y1,:)=(log(p/(1-p))+9.136-0.381*k(y,1)-0.004*k(y,2)-10.874*k(y,3))/0.062;
        jw2(y1,:)=jw(y,:);
    end
end
old1=mean(oldprice1);
new1=mean(newprice1);















