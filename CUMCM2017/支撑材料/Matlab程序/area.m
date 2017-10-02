%此程序是用来计算区域指标
c1=[22.654,114.050];
c2=[22.959,113.814];
c3=[23.123,113.272];
jw=xlsread('1.xls',1,'B2:D836');
canshu=xlsread('zhibiao.xlsx',1,'A1:E835');
x1=0;
for i=1:835
    if sqrt((jw(i,1)-c1(1,1))^2+(jw(i,2)-c1(1,2))^2)<0.25
        x1=x1+1;
        are1(x1,:)=canshu(i,:);
    end
end
x1=0;
for i=1:835
    if sqrt((jw(i,1)-c2(1,1))^2+(jw(i,2)-c2(1,2))^2)<0.25
        x1=x1+1;
        are2(x1,:)=canshu(i,:);
    end
end
x1=0;
for i=1:835
    if sqrt((jw(i,1)-c3(1,1))^2+(jw(i,2)-c3(1,2))^2)<0.25
        x1=x1+1;
        are3(x1,:)=canshu(i,:);
    end
end
s1=mean(are1);
s2=mean(are2);
s3=mean(are3);
x2=0;
for i=1:size(are1,1)
    if are1(i,4)==1
        x2=x2+1;
    end
end
percent1=x2/size(are1,1);
x2=0;
for i=1:size(are2,1)
    if are2(i,4)==1
        x2=x2+1;
    end
end
percent2=x2/size(are2,1);
x2=0;
for i=1:size(are3,1)
    if are3(i,4)==1
        x2=x2+1;
    end
end
percent3=x2/size(are3,1);

