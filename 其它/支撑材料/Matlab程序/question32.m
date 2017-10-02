%此程序用于第4问
D = xlsread('question3.xls',1,'B2:C2067');%样本集
canshu=xlsread('question3.xls',1,'D2:F2067');
D=D';
eps = 0.001;                            %邻域参数
MinPts = 1;                            %领域参数
O = zeros(1, size(D, 2));              %核心对象集
C = cell(size(D,2));

d = zeros(size(D, 2), size(D, 2));     %样本之间的距离大于eps元素值为1，反之0
for i = 1:size(D, 2)
    for j = size(D, 2):-1:i
        if pdist(D(:, [i j])') <= eps
            d(i, j) = 1;
        end
        d(j, i) = d(i, j);
    end
    %d(i,i) = 0;
    if sum(d(i, :)) >= MinPts
            O(i) = i;
    end
end

k =  0;                                %初始化聚类簇数
Tau = 1:size(D, 2);                    %初始化未访问样本集合
while sum(O) ~= 0
    Tau_old = Tau;                     %记录当前未访问样本集合

    %随机选取一个核心对象j,找出其密度可达点
    j = 1;
    while O(j) == 0
        j = j+1;
    end

    %ob = O(j);
    Q = zeros(1, size(Tau, 2));
    Q(j) = j;                          %将核心对象j加入队列Q
    Tau(j) = 0;                        %将核心对象j移出Tau

    while sum(Q) ~= 0

        %取出Q中首个样本m
        m = 1;
        while Q(m) == 0
            m = m+1;
        end
        Q(m) = 0;

        if sum(d(m,:)) >= MinPts
            for l = 1:size(d, 2)
                if d(m, l) == 1 && Tau(l) ~= 0
                    Q(l) = l;
                    Tau(l) = 0;
                end
            end
        end

    end
    k = k+1;
    for i = 1:size(Tau, 2)
        if Tau(i) ~= 0
            Tau_old(i) = 0;
        end
        if Tau_old(i) ~= 0
            O(i) =0;
        end
    end
    C{k} = Tau_old;
end

for i = 1:k
    C{i} = find(C{i}~=0);
    D1 = D(:,C{i});
    scatter(D1(1,:),D1(2,:));
    hold on
end
D=D';
for i=1:k
    sum1=0;
    sum2=0;
    sum3=0;
    jing=0;
    wei=0;
    fujia=0;
    a=C{i,1};
    r=size(a,2);
    for j=1:r
        sum1=canshu(a(1,j),1)+sum1;
        sum2=canshu(a(1,j),2)+sum2;
        sum3=canshu(a(1,j),3)+sum3;
        jing=jing+D(a(1,j),1);
        wei=wei+D(a(1,j),2);
    end
    if r>1
    for j=1:r-1
        fujia=fujia+sqrt((D(a(1,j),1)-D(a(1,j+1),1))^2+(D(a(1,j),2)-D(a(1,j+1),2))^2);
    end
    end
    final(i,1)=sum1/r;
    final(i,2)=sum2/r;
    final(i,3)=sum3/r+fujia;
    final(i,4)=jing/r;
    final(i,5)=wei/r;
end
    