# JS: Values & Types

## Built-in Types
The following built in types are available:
- `string`
- `number`
- `boolean`
- `null` and `undefined`
- `object`
- `symbol` (new to ES6)

### Examining Types of Values
In JavaScript, variables don't have types - values have types. Variables can hold any value, at any time.

To examine a value, use `typeof` operator. It always returns one of the seven values in string:
```javascript
var a;
typeof a;       // "undefined"

// All evaluates to true
typeof undefined === "undefined";
typeof true === "boolean";
typeof 42 === "number";
typeof "42" === "string";
typeof { life: 42 } === "object";
typeof Symbol() === "symbol";
```
Note that **`typeof` examines the type of the value in a variable**, not the type of a variable.

#### Special cases
##### `null`
`typeof null` is an interesting case, because it errantly returns `object`, not `null`.
``` javascript
typeof null === "object"; // true
```

If you want to test for `null` value using its type, you need a compound condition:
```js
var a = null;
(!a && typeof a === "object"); // true
```

##### undefined vs undeclared
Variables that have no value *currently* actually have the `undefined` value. An "undefined" variable is one that has been declared in the accessible scope, but *at the moment* has no other value in it. By contrast, an "undeclared" variable is one that has not been formally declared in the accessible scope. 

Consider:
```js
var a;
a; // undefined
b; // undeclared, ReferenceError: b is not defined
```

The `typeof` will return `"undefined"` even for `"undeclared"` variables. To check for undeclared, use safety guard feature using `typeof`:
```js
// This would throw an error!
if(DEBUG){
	console.log("Debugging is starting");
}

// This is a safe existence check
if(typeof DEBUG !== "undefined"){
	console.log("Debugging is starting");
}
```

This sort of check is useful even if you're not dealing with user-defined variables like `DEBUG`. If you are doing a feature check for a built-in API, you may find it helpful to check without throwing an error: 
```js
if(typeof atob === "undefined"){
	atob = function(){ };  // Define if not defined already
}
```

### Objects
The `object` type refers to a compound value where you can set properties (named locations) that each hold their own values of any type.
```javascript
var obj = {
    a: "hello world",
    b: 42,
    c: true
};

obj.a;      // "hello world"
obj.b;      // 42
obj.c;      // true

obj["a"];   // "hello world"
obj["b"];   // 42
obj["c"];   // true

var key = "a";
obj[key];   // "hello world"
```

#### Array
An array is an **`object`** that holds values (of any type, from `string` to `number` to `object` to even another `array`) not particularly in named properties/keys, but rather in numerically indexed positions. 
```javascript
var arr = [
    "hello world",
    42,
    true
];

arr[0];         // "hello world"
arr[1];         // 42
arr[2];         // true
arr.length;     // 3

typeof arr;     // "object"
```

You don't need to presize your `array`s, you can just declare them and add values as you see fit:
```js
var a = [];
a[0] = 1;
a[1] = "2";
```

Because arrays are special objects (as `typeof` implies), they can also have properties, including the automatically updated `length` property.

If you create a "sparse" `array`, it would have `undefined` value in between:
```js
var a = [];
a[0] = 1;
a[2] = [3];

a[1];     // undefined
a.length; // 3
```

You theoretically could use an array as a normal object with your own named properties, or you could use an object but only give it numeric properties (0, 1, etc.) similar to an array. However, this would generally be considered improper usage of the respective types.

Also, be careful not to use a number `string` value as a key for an `array`. The key can be coerced to a standard base-10 `number`, then assume that you wanted to use it as a `number` index rather than as a `string` key.
```js
var a = [];
a["13"] = 42;
a.length; // 14
```

#### Functions
Functions are a subtype of `object`s -- `typeof` returns "function", which implies that a function is a main type -- and can thus have properties, but you typically will only use function object properties (like foo.bar) in limited cases.

> More specifically, a function is referred to as a "callable object" -  an object that has an internal [[Call]] property that allows it to be invoked. 

An example of a function property would be `length` property, which is set to the number of formal parameters it is declared with:
```js
function a(b,c){
}
a.length; // 2
```

## Built-In Type Methods
When we use properties and methods defined on a type, we are actually using properties and methods defined on a object wrapper such as `String`, `Number`, and `Boolean`. JS automatically "boxes" the value to respective object wrapper by default.

## Comparing Values
### Coercion
Coercion comes in two forms in JavaScript: explicit and implicit. Explicit coercion is simply that you can see obviously from the code that a conversion from one type to another will occur, whereas implicit coercion is when the type conversion can happen as more of a non-obvious side effect of some other operation.

Example of explicit coercion:
```javascript
var a = "42";

var b = Number( a );

a;              // "42"
b;              // 42 -- the number!
```

Example of implicit coercion:
```javascript
var a = "42";

var b = a * 1;  // "42" implicitly coerced to 42 here

a;              // "42"
b;              // 42 -- the number!
```

### Values that could be evaluated to `true` or `false`
#### Falsy values
- `""` (empty string)
- `0`, `-0`, `NaN`
- `null`, `undefined`
- `false`

#### Truthy values
- `"hello"`
- `42` (a non-zero number)
- `true`
- `[]`, `[1, "2", 3]` (arrays)
- `{}`, `{a: 42}` (objects)
- `function foo() {..}` (functions)

### Equality
There are four equality operators: `==`, `===`, `!=`, `!==`

The difference between `==` and `===` is usually characterized that `==` checks for value equality and `===` checks for both value and type equality. However, this is inaccurate. The proper way to characterize them is that `==` checks for value equality with coercion allowed, and `===` checks for value equality without allowing coercion; `===` is often called "strict equality" for this reason.

General rule of thumb: 
- If either value (aka side) in a comparison could be the `true` or `false` value, avoid `==` and use `===`.
- If either value in a comparison could be of these specific values (`0`, `""`, or `[]` -- empty array), avoid `==` and use `===`.
- In all other cases, you're safe to use `==`. Not only is it safe, but in many cases it simplifies your code in a way that improves readability.

When comparing non-primitive values, like `object`s (including `function` and `array`), because those values are held by reference, `==` and `===` comparisons will simply check whether the references match, not anything about the underlying values.

**!** `array`s are by default coerced to `string`s by simply joining all the values with commas (,) in between. You might think that two `array`s with the same contents would be == equal, but they're not:

```javascript
var a = [1,2,3];
var b = [1,2,3];
var c = "1,2,3";

a == c;     // true
b == c;     // true
a == b;     // false
```

### Inequality
There are four inequality operators: `<`, `>`, `<=`, `>=`

Typically they will be used with ordinally comparable values like `number`s. It's easy to understand that `3 < 4`. But JavaScript `string` values can also be compared for inequality, using typical alphabetic rules (`"bar" < "foo"`).

There are no "strict inequality" operators that would disallow coercion. This means, if values being compared are totally different, say, `"foo"` and `42`, values are coerced to "invalid" values such as `NaN` and result in "unexpected" value comparisons (For example, `NaN < 42` is not a valid comparison, and thus results in `false`)

## Reference
- [You Don't Know JS Github](https://github.com/getify/You-Dont-Know-JS)
