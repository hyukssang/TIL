# Python: Useful Libraries & Methods

## Libraries
### `re`, Regular Expression
#### `re.sub(pattern, repl, string, count=0, flags=0)`

Return the string obtained by replacing the leftmost non-overlapping occurrences of pattern in `string` by the replacement `repl`. If the pattern isn’t found, `string` is returned unchanged. `repl` can be a string or a function; if it is a string, any backslash escapes in it are processed. If `repl` is a function, it is called for every non-overlapping occurrence of `pattern`.

The optional argument `count` is the maximum number of pattern occurrences to be replaced; `count` must be a non-negative integer. If omitted or zero, all occurrences will be replaced.

## Methods
### `sorted()`
- Sorts the items in a given list/string, and returns a copy of the sorted list
- `sorted` does not modify the list passed in as an argument. 


```python
>>> sorted('python')
['h', 'n', 'o', 'p', 't', 'y']
>>> sorted([1,3,4,2])
[1, 2, 3, 4]
```
