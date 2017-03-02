# Bit Manipulation
## Characteristics
- In terms of bits, positive numbers are represented as itself while a negative numbers are represented as the two's complement of its absolute value (with a 1 in its sign bit to indicate that a negative value). The two's complement of an N-bit number (where N is the number of bits used for the number, excluding the sign bit) is the complement of the number with respect to 2^N. 
For example, for a 4-bit integer -3, the complement of 3 with respect to 8 (2^(4-1)) is 5. If we add 1 at the front of the binary representation of 5, which is 101, we get 1101, the binary form of -3. 

## Positive -> Negative
Flip the bits in the positive representation and then add 1.

## Arithmetic Right Shift vs Logical Right Shift
### Arithmetic
The arithmetic right shift essentially divides by two. We shift values to the right but fill in the new bits with the value of the sign bit. Indicated by a `>>` operator. 

For example, 10110101(= -75) would become 11011010(= -38)

### Logical
The logical right shift does what we would visually see as shifting the bits. We shift the bits and put a 0 in the most significant shift. Indicated by a `>>>` operator.

For example, 10110101(= -75) would become 01011010(= -90)

## Basic Tricks
|:--|:--|:--|
| x ^ 0s = x | x & 0s  = 0 | x \| 0s = x |
| x ^ 1s = ~x | x & 1s = x | x \| 1s = 1s |
| x ^ x = 0 | x & x = x | x \| x = x |


Note that `^` indicates an `XOR`, `~` indicates a `NOT`, `&` indicates a `AND`, and `|` indicates a `OR`

## Common Bit Tasks
### Getting bit
By performing an `AND` with `num`, we clear all bits other than the bit at bit `i`. Finally, we compare that to `0`. If that new value is not zero, then bit `i` must have a `1`. Otherwise, bit `i` is a `0`.

```cpp
bool getBit(int num, int i){
	return ((num & (1 << i)) != 0);
}
```

### Setting bit
By performing an `OR` with `num`, only the value at bit `i` will change. All other bits of the mask are zero and will not affect `num`.

```cpp
int setBit(int num, int i){
	return num | (1 << i);
}
```

### Clearing bit
#### At `i`th bit
Create a number like 11101111 by creating the reverse of it, like 00010000 and negating it. Then, perform an `AND` with `num`. This will clear the `i`th bit and leave the remainder unchanged.

```cpp
int clearBit(int num, int i){
	int mask = ~(1 << i);
	return num & mask;
}
```

#### The most significant bit through `i`, inclusive
Create a mask with a `1` at the `i`th bit. Then, subtract `1` from it, resulting in a sequence of `0`s followed by `i` `1`s. We then `AND` our number with this mask to leave just the last `i` bits.

```cpp
int clearBits(int num, int i){
	int mask = (1 << i) - 1;
	return num & mask;
}
```

#### `i` through `0`, inclusive
Take a sequence of all `1`s (which is `-1`) and logical shift it over by `31 - i` bits. This gives us a sequence of `1`s followed by `i` `0`bits. 

```cpp
int clearBit(int num, int i){
	int mask = ~(-1 >>> (31 - i));
	return num & mask;
}
```

### Updating bit
First clear the bit at position `i` by using a mask that looks like 11101111. Then, shift the intended value `v` left by `i` bits. This will create a number with bit `i` equal to `v` and all other bits equal to `0`. Finally, we `OR` these two numbers, updating the `i`th bit if `v` is `1` and leaving it as `0` otherwise. 

```cpp
int updateBit(int num, int i, bool bitIs1){
	int value = bitIs1 ? 1 : 0;
	int mask = ~(1 << i);
	return (num & mask) | (value << i);
}
```

## Reference
- Cracking the Coding Interview by Gayle LaakMann McDowell