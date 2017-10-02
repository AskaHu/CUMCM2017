%此程序用于第4问
[p,fval]=fmincon('fun3',0.5,[],[],[],[],0.5,1);
k=xlsread('question3.xls',1,'I1:K1273');
for i=1:1273
    jiage(i,:)=(log(p/(1-p))+9.136-0.381*k(i,1)-0.004*k(i,2)-10.874*k(i,3))/0.062;
end