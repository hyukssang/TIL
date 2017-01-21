# JS: Variables
## Naming
Valid identifiers are: `a`-`z`, `A`-`Z`, `$`, or `_` + numerals `0`-`9`

Some words are reserved, for example: `for`, `in`, `if`, etc.

## Function Scopes
### Hoisting
Hoisting is when a `var` declaration is conceptually "moved" to the top of its enclosing scope. In other words, a variable can be used before it has been declared.

```javascript
var a = 2;

foo();                  // works because `foo()`
                        // declaration is "hoisted"

function foo() {
    a = 3;

    console.log( a );   // 3

    var a;              // declaration is "hoisted"
                        // to the top of `foo()`
}

console.log( a );   // 2
```

**!!** Do not rely on variable hoisting to use a variable earlier in its scope than its `var` declaration appears

### Nested Scopes
In basic cases, when you declare a variable, it is available anywhere in that scope, as well as any lower/inner scopes. 

#### Bad Practices
If you try to access a variable's value in a scope where it's not available, you'll get a `ReferenceError` thrown. If you try to set a variable that hasn't been declared, you'll either end up creating a variable in the top-level global scope (bad!) or getting an error, depending on "strict mode"

#### `let` and Block Scoping
In addition to creating declarations for variables at the function level, ES6 lets you declare variables to belong to individual blocks (pairs of { .. }), using the `let` keyword. Block scoping is very useful for managing your variable scopes in a more fine-grained fashion, which can make your code much easier to maintain over time.

## Reference
- [You Don't Know JS: Chapter 2](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20%26%20going/ch2.md)