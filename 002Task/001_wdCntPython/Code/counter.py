import csv

file=r"D:\eIT\003_pythonNLP\Data\Shakespeare.txt"
outputFile=r"D:\eIT\003_pythonNLP\output\output.csv"


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


with open(file, "r") as file:
    lines = file.read().splitlines()
    totalUniqueCount = totCount(lines)
    unique = getUnique(lines)
    print(f"Unique words: {totalUniqueCount}")
    #print(unique)
    wordfreq = []
    final={}
    for line in lines:
        wordlist = line.split()
        for w in wordlist:
            wordfreq.append(wordlist.count(w))
    
        output = zip(wordlist, wordfreq)
        final.update(dict(output))
    
    outfile = open( outputFile, 'w' )
    for key, value in sorted(final.items()):
        outfile.write(str(key) + '\t' + str(value) + '\n' )
    
    # with open(outputFile, 'wb') as f:
    #     w = csv.DictWriter(f, final.keys())
    #     w.writerow(final)
