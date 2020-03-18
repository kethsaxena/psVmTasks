import csv
import re

file=r"D:\eIT\003_randomTest\001_pythonNLP\Data\Shakespeare.txt"
outputFile=r"D:\eIT\003_randomTest\001_pythonNLP\output\output.csv"


def totCount(lines):
    uniques = set()
    for line in lines:
        uniques |= set(line.split())

    return len(uniques) 

def getUnique(lines):
    uniques = set()
    for line in lines:
        uniques |= set(line.split())

    return uniques 

bag={}
with open(file, "r") as file:
    lines = file.read().splitlines()
    for line in lines:
        line = re.sub('[\W\d]', " ",line)
        
        linelist=list(map(lambda x:x.lower(),line.split()))
        for item in linelist:
            if item not in bag.keys():
                bag[item]=1
            else:
                bag[item]+=1
    
    outfile = open( outputFile, 'w' )
    
    bag=dict(sorted(bag.items(), key=lambda x: x[1],reverse=True))

    with open(outputFile, 'w') as f:
        for key in bag.keys():
            f.write("(%s,%s)\n"%(key,bag[key]))
