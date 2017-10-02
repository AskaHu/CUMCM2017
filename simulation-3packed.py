# -*- coding:utf-8 -*-
import csv
import math
import time
time1 = time.time()

filename1 = 'chooseorder.csv'     #经度，纬度，限额，会员编号
filename2 = 'tasklist3packed.csv'        #经度，纬度，任务价格，任务编号,平均距离
tasknumber = 0
phyvalue = 0
with open(filename2,'r') as taskreader:
    tasks = csv.reader(taskreader)
    headerrow = next(taskreader)
    code = 4
    taskinterest = 0
    count = 0
    out=[]
    out.append(code)
    for task in tasks:
        count = count + 1
        try:
            taskinterest = taskinterest+(float(task[2])/float(task[4]))
        except ZeroDivisionError:
            code = code + 1
            out.append(code)
    phyvalue=taskinterest/count


taskcheck=[]
with open(filename1,'r') as chooseorder:
    choosepeople = csv.reader(chooseorder)
    headerrow1 = next(chooseorder)
    count1 = 0
    for chooseperson in choosepeople:
        wantlist = []
        finallist = []
        count1 = count1 + 1
        with open(filename2,'r') as taskreader:
            tasks = csv.reader(taskreader)
            headerrow2 = next(taskreader)
            for task in tasks:
                distance = math.sqrt((float(chooseperson[0])-float(task[0]))**2+(float(chooseperson[1])-float(task[1]))**2)
                interest = float(task[2])/distance
                if interest>int(out[0])*phyvalue and (task[3] not in taskcheck):
                    wantlist.append([task[3],float(task[2])])
        #print(len(wantlist))
        wantlist.sort(key=lambda x: x[1])

        if len(wantlist) > float(chooseperson[2])*count:
            chooselist = wantlist[-int(float(chooseperson[2])+1):]
            chooselist = wantlist[-2:]
        else:
            chooselist = wantlist[:]

        #print(len(chooselist))
        for choosed in chooselist:
            print('Task '+choosed[0]+' has been choosed by '+chooseperson[3])
            taskcheck.append(choosed[0])



        #filename3 = 'out%d.csv'% count1
        #print(str(taskcheck))
        #with open(filename3,'w') as output:
            #print(str(chooselist))
            #output.writelines(str(chooselist))
print()
print(taskcheck)
print('Success:'+str(len(taskcheck)))
print('Failed:'+str(count-len(taskcheck)))
print('Success Rate:'+str(len(taskcheck)/count*100)+'%')
time2 = time.time()
print('Used Time:'+str(time2-time1)+'s')
input('Press any key to continue')