# JS: Conditionals

## `if..else`
```javascript
if (a == 2) {
    // do something
}
else if (a == 10) {
    // do another thing
}
else if (a == 42) {
    // do yet another thing
}
else {
    // fallback to here
}
```

## `switch`
```javascript
switch (a) {
    case 2:
        // do something
        break;
    case 10:
        // do another thing
        break;
    case 42:
        // do yet another thing
        break;
    default:
        // fallback to here
}
```

Unless you `break` out of a `case`, `switch` will continue to evaluate the next `case`.

## "ternary operator"
```javascript
var a = 42;

var b = (a > 41) ? "hello" : "world";

// similar to:

// if (a > 41) {
//    b = "hello";
// }
// else {
//    b = "world";
// }
```

If the comparison before `?` is `true`, the ternary operator assigns the value on the left of the colon to the variable. Otherwise, the value on the right of the colon gets assigned. 

## Reference
- [You Don't Know JS: Chapter 2](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20%26%20going/ch2.md)