
#1. RANDOM NUMBERS ON LINUX WITHOUT NP
def randint(a, b):
    "Return random integer in range [a, b], including both end points."
    return a + randbelow(b - a + 1)

def randbelow(n):
    "Return a random int in the range [0,n).  Raises ValueError if n<=0."
    if n <= 0:
       raise ValueError
    k = n.bit_length()
    numbytes = (k + 7) // 8
    while True:
        r = int.from_bytes(random_bytes(numbytes), 'big')
        r >>= numbytes * 8 - k
        if r < n:
            return r

def random_bytes(n):
    "Return n random bytes"
    with open('/dev/urandom', 'rb') as file:
        return file.read(n)

list =[]
for i in  range(0,30):
    list.append(randint(0, 100))

print(list)

#################################################
#2. Objects and 
class User:
    """ An class to demonstrate simple objects"""
    def __init__(self,id,full_name,dob):
        self.id=id
        self.name=full_name
        self.dob=dob
    
    def namid(self):
        """ A method to return NAME  & ID """
        return [self.id,self.name]

#initialize objects      
user1 = User("001","Praketa Saxena","01/12/1992")
#get name and id 
print(user1.namid())

#################################################
#3. AND 4. SECOND SMALLEST MISSING NUMBER
def findMissingNo(arr, n):  
    for i in range(n) : 
        if (arr[i] <= 0 or arr[i] > n): 
            continue
  
        val = arr[i] 
  
        while (arr[val - 1] != val): 
            nextval = arr[val - 1] 
            arr[val - 1] = val 
            val = nextval 
            if (val <= 0 or val > n): 
                break
  
    for i in range(n): 
        if (arr[i] != i + 1) : 
            return i + 1
   
    return n + 1
  
# Driver code 
if __name__ == "__main__":
    arr=[0,1,2] 
    arr_size = len(arr) 
    missing = findMissingNo(arr, arr_size) 
    print( "The smallest positive",  
           "missing number is ", missing) 

#################################################

#5. DEDUP KEYS 
weekdays = ["sun","mon","tue", "sun","mon","tue","wed","thu","fri","wed","thu","fri","sat"]
print(set(weekdays))