# JSX 

### Pros of using JSX
- JSX optimizes as it compiles, so it's fast
- Type-safe
- XML-like syntax

### Characteristics 
- Switches XML-like syntax to JavaScript-syntax
	
	```javascript
	class Codelab extends React.Component{
		  render(){
			    return(
			      <div>CodeLab</div>
			    );
		  }
	}
	
	class App extends React.Component{
		//render() defines the data to be rendered in a Component
		  render(){
			    return(
			      <Codelab/>
			    );
		  }
	}
	
	ReactDOM.render(<App/>,document.getElementById('root'));
	```

- When trying to render multiple elements inside a component, they must be contained in a single container element. For example: 

	**This doesn't work:**
	```javascript
	return  (
		<h1> Hello Velopert</h1>
		<h2> Welcome </h2>
	);
	```
	**This does:**
	```javascript
	return  (
		// Container element <div>
		<div>
			<h1> Hello Velopert </h1>
			<h2> Welcome </h2>
		</div>
	);
	```
	
- To use JavaScript expression, simply wrap it with `{}`
	
	```javascript
	render(){
			let text = "Dev-Server"
			return  (
			<div>
				<h1> Hello Velopert </h1>
				// variable inside {} uses JavaScript variable declared above
				<h2> Welcome to {text}</h2>
			</div>
			);
	}
	```
		
- Creating & using a method*

	```javascript
	sayHey(){
		alert("hey");
	}
	
	render(){
		let text = "Dev-Server"
		return  (
			<div>
				<h1> Hello World </h1>
				<h2> Welcome to {text}</h2>
				// * Note how sayHey method doesn't have trailing ()
				<button onClick={this.sayHey}>Click Me</button>
			</div>
		);
	}
	```

- Can't use if-else statements. Use ternary expression instead.
	
	`<p>{1 == 1 ? 'True' : 'False'}</p>`
	
- Inline-style: use camelCase

	```javascript
	render(){
	    let text = "Dev-Server";
	
	    let pStyle = {
	        color: 'aqua',
	        backgroundColor: 'black'
	    };

	    return  (
		    <div>
		        <h1> Hello Velopert </h1>
		        <h2> Welcome to {text}</h2>
		        <button onClick= {this.sayHey}>Click Me</button>
		        <p style = {pStyle}>{1 == 1 ? 'True' : 'False'}</p>
		    </div>
		);
	}
	```
	
- Comments: `{ /* comments */ }`
	\* Comments must be contained in a container element! 