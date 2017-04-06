# Hash Tables

## Characteristics
- Transforms keys into table addresses
- Good for inserting, searching for an item having a given key, removing a specified item
- Bad for selecting kth largest item in a symbol table, sorting

## Operation Time Complexity
|  | Best | Average | Worst |
|:--|:--|:--|:--|
| Search | O(1) | O(1) | O(n) |
| Insertion | O(1) | O(1) | O(n) |
| Deletion | O(1) | O(1) | O(n) |

## Hashing
Good Hash functions will:
- compute a hash for every key
- compute same hash for same key
- minimize collisions

### First Part: Find a hash of the given key
Form: **t(key) -> intmap**

**For floats:**
- key between [0, 1): h(key) = floor(key * M)
- key between [s, t): h(key) = floor((key-s)/(t-s)*M)
- Modular hash function: k(key) = key mod M

**For strings:**
- x_0 * a^(k-1) + x_1 * a^(k-2) + ... + x_(k-1) * a^0
	**!!!** x_0 represents the first character, a is some prime number

### Second Part: Compression
Form: **c(intmap) -> address**

**Division Method:**
|intmap| mod M, where M is prime

**Multiply and Divide Method:**
|a*intmap + b| mod M, where M is prime, a and b are non-negative integers
**!!!** a mod M must not equal 0