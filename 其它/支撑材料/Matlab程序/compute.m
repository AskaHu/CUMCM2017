%此程序是用来计算每个任务的指标值
mission=xlsread('mission.xls',1,'B2:C836');
vip=xlsread('2.xlsx',1,'B2:E1878');
result=xlsread('mission.xls',1,'E2:E836');
price=xlsread('mission.xls',1,'D2:D836');
for i=1:835
    sum2=0;
    sum3=0;
    sum4=0;
    sum5=0;
    number=0;
    for j=1:1877
        if sqrt((mission(i,1)-vip(j,1))^2+(mission(i,2)-vip(j,2))^2)<0.3
        sum2=sum2+vip(j,3);
        sum3=sum3+vip(j,4);
        sum4=sum4+sqrt((mission(i,1)-vip(j,1))^2+(mission(i,2)-vip(j,2))^2);
        number=number+1;
        end
    end
    for j=1:835
        if sqrt((mission(i,1)-mission(j,1))^2+(mission(i,2)-mission(j,2))^2)<0.3
            sum5=sum5+1;
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
    k(i,5)=sum5;
end
n=0;
z=0;

for m=1:835
    if result(m,:)==0
        n=n+1;
        failed(n,:)=[k(m,:),price(m,:)];    
    else
        z=z+1;
        success(z,:)=[k(m,:),price(m,:)];  
    end
end
as=mean(failed);
ad=mean(success);