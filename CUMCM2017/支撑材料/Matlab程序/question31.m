%此程序用于第4问
mission=xlsread('question3.xls',1,'B2:C2067');
vip=xlsread('2.xlsx',1,'B2:E1878');
for i=1:2066
    sum2=0;
    sum3=0;
    sum4=0;
    number=0;
    for j=1:1877
        if sqrt((mission(i,1)-vip(j,1))^2+(mission(i,2)-vip(j,2))^2)<0.3
        sum2=sum2+vip(j,3);
        sum3=sum3+vip(j,4);
        sum4=sum4+sqrt((mission(i,1)-vip(j,1))^2+(mission(i,2)-vip(j,2))^2);
        number=number+1;
        end
    end
    if number==0
        k(i,1)=0;
     k(i,2)=0;
     k(i,3)=0;
    else
        k(i,1)=sum2/number;
     k(i,2)=sum3/number;
     k(i,3)=sum4/number;
    end
    k(i,4)=number;
end