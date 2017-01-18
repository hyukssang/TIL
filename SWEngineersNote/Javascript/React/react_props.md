# React Props
### Characteristics
- Represents immutable data inside Components
- Data flows from parent->child Components
- Read-Only

### How to use
#### Basic Usage
- For data inside tags: `{this.props.propsName}`
- For data between tags: `{this.props.children}`

	**Child Component:**
	```javascript
	class Codelab extends React.Component{
	  render(){
	    return(
	      <div>
	        <h1>Hello {this.props.name}</h1>
	        <div>{this.props.children}</div>
	      </div>
	    );
	  }
	}
	
	class App extends React.Component{
	  render(){
	    return(
				// {this.props.name} renders "ray"
				// {this.props.children} renders "Hello Again"
				<Codelab name={this.props.name}>{this.props.children}</Codelab>
	    );
	  }
	}
	```
	
	**Parent Component:**
	```javascript
	ReactDOM.render(<App name="ray">Hello Again</App>,document.getElementById('root'));
	```

#### Setting Default Values
- After defining Component, add `className.defaultProps = {propName: value}` below Component definition:

	```javascript
	Codelab.defaultProps = {
		// If nothing is given for {this.props.name}, "Unknown" is used
		name: "Unknown"
	};
	```
	
#### Type Validation
- Similarly, add `className.propTypes = {propName: type}` below Component definition:

	```javascript
	Codelab.propTypes = {
		// Checks if {this.props.name} has a string value and
		// if {this.props.number} exists and is a number
		name: React.PropTypes.string,
		number: React.PropTypes.number.isRequired
	};
	```

	\* Might not issue error if React file used is a minified version (*.min.js)