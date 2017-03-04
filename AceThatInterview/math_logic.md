# Math and Logic
## Prime Numbers
Every positive integer can be decomposed into a product of primes. 

For example:
84 = 2^2 * 3^1 * 5^0 * 7^1 * 11^0 * 13^0 * 17^0 * ...

### Divisibility
The prime number law stated above means that, in order for a number x to divide a number y, y/x, all primes in x's prime factorization must be in y's prime factorization. 

Let x = 2^(j0) * 3^(j1) * 5^(j2) * ...
Let y = 2^(k0) * 3^(k1) * 5^(k2) * ...
If y/x, then for all `i` (the number beside `j` and `k`), `ji` <= `ki`

---

The greatest common divisor of x and y is then, 
gcd(x,y) = 2^min(j0, k0) * 3^min(j1, k1) * 5^min(j2, k2) * ...

The least common multiple of x and y will be, 
lcm(x,y) = 2^max(j0, k0) * 3^max(j1, k1) * 5^max(j2, k2) * ...

### Checking for Primality
#### Method 1: Simple Iteration
Iterate up through the sqrt(n). We only need to iterate up to sqrt(n), because for every number `a` which divides `n` evenly, there is a complement `b`, where `a * b = n`.

```cpp
bool prime(int n){
	if(n < 2){
		return false;
	}
	int sqrtN = (int)sqrt(n);
	for(int i = 2; i <= sqrtN; i++){
		if(n % i == 0) return false;
	}
	return true;
}
```

#### Method 2: Generating a list of primes using the Sieve of Eratosthenes
This method works by recognizing that all non-prime numbers are divisible by a prime number.

We start with a list of all the numbers up through some value `max`. First, we cross off all numbers divisible by 2. Then, we look for the next prime and cross off all numbers divisible by it. Repeat.

Pseudocode:
```
bool[] sieveOfEratosthenes(int max){
	bool[] flags = new bool[max+1];
	int count = 0;
	
	init(flags);
	int prime = 2;
	
	while(prime <= sqrt(max)){  
		crossOff(flags, prime);
		prime = getNextPrime(flags, prime);
	}
	return flags;
}

void crossOff(bool[] flags, int prime){
	for(int i = prime * prime; i < flags.length; i += prime){
		flags[i] = false;
	}
}

int getNextPrime(bool[] flags, int prime){
	int next = prime + 1;
	while(next < flags.length && !flags[next]){
		next++;
	}
	return next;
}
```

## Probability
### A and B
- P(A and B) = P(B given A) * P(A)
- If A and B are **independent**: P(A and B) = P(A) * P(B)
- If A and B are **mutually exclusive**: P(A and B) = 0
P(A given B) = P(B given A) * P(A) / P(B)

### A or B
- P(A or B) = P(A) + P(B) - P(A and B)
- If A and B are **mutually exclusive**, P(A or B) = P(A) + P(B)

*Note that two events cannot be both independent and mutually exclusive, other than the case where one or both events have a probability of zero.*
