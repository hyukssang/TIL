# JS: Functions
A function in JS can be thought of as a value that's assigned to variables, or passed to or returned from other functions.

## Types of Functions
### Immediately Invoked Function Expressions (IIFEs)
IIFE is just a function that's invoked right after the function expression.
```javascript
(function IIFE(){
    console.log( "Hello!" );
})();
// "Hello!"
```
\--- The outer `( .. )` that surrounds the `(function IIFE(){ .. })` function expression is just a nuance of JS grammar needed to prevent it from being treated as a normal function declaration.

\--- The final `()` on the end of the expression -- the `})();` line -- is what actually executes the function expression referenced immediately before it.

IFFE is often used to declare variables that won't affect the surrounding code outside the IIFE:
```javascript
var a = 42;

(function IIFE(){
    var a = 10;
    console.log( a );   // 10
})();

console.log( a );       // 42
```

IIFEs can also have return values:
```javascript
var x = (function IIFE(){
    return 42;
})();

x;  // 42
```

### Closure
Closure can be thought of as a way to "remember" and continue to access a function's scope (its variables) even once the function has finished running. 

Consider:
```javascript
function makeAdder(x) {
    // parameter `x` is an inner variable

    // inner function `add()` uses `x`, so
    // it has a "closure" over it
    function add(y) {
        return y + x;
    };

    return add;
}
```

The reference to the inner `add(..)` function that gets returned with each call to the outer `makeAdder(..)` is able to remember whatever x value was passed in to `makeAdder(..)`. Now, let's use `makeAdder(..)`:

```javascript
// `plusOne` gets a reference to the inner `add(..)`
// function with closure over the `x` parameter of
// the outer `makeAdder(..)`
var plusOne = makeAdder( 1 );

// `plusTen` gets a reference to the inner `add(..)`
// function with closure over the `x` parameter of
// the outer `makeAdder(..)`
var plusTen = makeAdder( 10 );

plusOne( 3 );       // 4  <-- 1 + 3
plusOne( 41 );      // 42 <-- 1 + 41

plusTen( 13 );      // 23 <-- 10 + 13
```

#### Modules
The most common usage of closure in JavaScript is the module pattern. Modules let you define private implementation details (variables, functions) that are hidden from the outside world, as well as a public API that is accessible from the outside.

Consider:
```javascript
function User(){
    var username, password;

    function doLogin(user,pw) {
        username = user;
        password = pw;

        // do the rest of the login work
    }

    var publicAPI = {
        login: doLogin
    };

    return publicAPI;
}

// create a `User` module instance
var fred = User();

fred.login( "fred", "12Battery34!" );
```

**Warning:** We are not calling `new User()` here, on purpose, despite the fact that probably seems more common to most readers. `User()` is just a function, not a class to be instantiated, so it's just called normally. Using `new` would be inappropriate and actually waste resources.

Executing `User()` creates an instance of the `User` module -- a whole new scope is created, and thus a whole new copy of each of these inner variables/functions. We assign this instance to `fred`. If we run `User()` again, we'd get a new instance entirely separate from `fred`.

The inner `doLogin()` function has a closure over `username` and `password`, meaning it will retain its access to them even after the `User()` function finishes running.

`publicAPI` is an object with one property/method on it, `login`, which is a reference to the inner `doLogin()` function. When we return `publicAPI` from `User()`, it becomes the instance we call `fred`.

At this point, the outer `User()` function has finished executing. Normally, you'd think the inner variables like `username` and `password` have gone away. But here they have not, because there's a closure in the `login()` function keeping them alive.

That's why we can call `fred.login(..)` -- the same as calling the inner `doLogin(..)` -- and it can still access `username` and `password` inner variables.

## Reference
- [YDKJS: Chapter 2](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20%26%20going/ch2.md)