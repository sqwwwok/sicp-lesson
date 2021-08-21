from datetime import datetime
def prime(x):
    divisor=3
    while 1:
        if (x%divisor==0):
            return False
        elif (divisor**2>x):
            return True
        divisor+=2

def test_prime_iter(n,count,start_time):
    if (count==0):
        print("are primes")
        return
    elif prime(n):
        print(datetime.now().timestamp() - start_time)
        print(n)
        print("***")
        print("")
        test_prime_iter(n+2,count-1,datetime.now().timestamp())
    else:
        test_prime_iter(n+2,count,datetime.now().timestamp())

def test(n):
    test_prime_iter(n+1,20,datetime.now().timestamp())
        
