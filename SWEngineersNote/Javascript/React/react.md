# React Background Knowledge
## Why use React?

**Pros:**

- Performance 
- Can be rendered at either client-side or server-side
- Better readability, maintainability
- Can be mixed with other libraries, since this is not a framework

**Cons:**

- Only deals with View layer (For example, you would have to use other modules for Ajax or Router)

## Things to know for React
### DOM (Document Object Model)
A way to express a structured document such as HTML and XML using objects. DOM is in a tree form, and web browsers use this model to apply CSS and Javascript code onto objects.

**Problem:** DOM is not optimized for dynamic User Interface. If there are thousands of repetitively appearing elements and if they need to go through some sort of change, too much time is wasted on browsers repainting the web pages.

**Solution:** React, using VirtualDOM, abstracts away the complexity involved in performing DOM updates, reducing the number of DOM updates and efficiently handling the updates.

**Warning:** React is good for **large applications that have dynamically changing data** in them. It is not for every case.

### Virtual DOM
A copy of DOM before the changes. React compares this to the actual DOM, finds out the difference, and only applies the necessary changes.

### JSX
Transforms XML-like syntax to native JavaScript

### Babel.js
Lets you use ES6 syntax even in places it is not supported

### Webpack
Module bundler, which allows you to combine different modules in one file (using `import`) 

### Reference
- [Tutorial by Velopert](https://velopert.com/775)
