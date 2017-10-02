%此程序是用来得出定价规律
clear
clc
c1=[22.654,114.050];
c2=[22.959,113.814];
c3=[23.123,113.272];
data1=xlsread('mission.xls',1,'B2:C836');
data2=xlsread('mission.xls',1,'D2:D836');
for i=1:835
    distance1(i,:)=sqrt((data1(i,1)-c1(1,1))^2+(data1(i,2)-c1(1,2))^2);
    distance2(i,:)=sqrt((data1(i,1)-c2(1,1))^2+(data1(i,2)-c2(1,2))^2);
    distance3(i,:)=sqrt((data1(i,1)-c3(1,1))^2+(data1(i,2)-c3(1,2))^2);
end
distance=(distance1+distance2+distance3)/3;
rstool(distance,data2,'linear');