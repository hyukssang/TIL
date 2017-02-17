# CSS: Tricks

## Centering Elements
### Horizontally
- For `inline` or `inline-block` elements
Set `text-align` to `center`

- For `block` elements
Set `margin-left` and `margin-right` to `auto`. Commonly it's done in a way like this:
```css
margin: 0 auto;
```
Note that you can't `float` an element to the center.

### Vertically
- For `inline` or `inline-block` elements
	- Single row
		- Give equal padding above and below the elements
		- Set `line-height` equal to `height`

	- Multiple rows: 
		- Give equal padding above and below the elements
		- Use flexbox on the parent `div`:
		```css
		.flex-center-vertically {
		  display: flex;
		  justify-content: center;
		  flex-direction: column;
		  height: 400px;
		}
		```
		Remember that it's only really relevant if the parent container has a fixed height (px, %, etc), which is why the container here has a height.
		
		- "Ghost element" technique: Place a full-height pseudo element inside the container and vertically align the text inside that container
		```css
		.ghost-center {
		  position: relative;
		}
		.ghost-center::before {
		  content: " ";
		  display: inline-block;
		  height: 100%;
		  width: 1%;
		  vertical-align: middle;
		}
		.ghost-center p {
		  display: inline-block;
		  vertical-align: middle;
		}
		```
		
- For `block` elements
	- Height of the Element is known
	```css
	.parent {
	  position: relative;
	}
	.child {
	  position: absolute;
	  top: 50%;
	  height: 100px;
	  margin-top: -50px; /* account for padding and border if not using box-sizing: border-box; */
	}
	```
	
	- Unknown Height
	```css
	.parent {
	  position: relative;
	}
	.child {
	  position: absolute;
	  top: 50%;
	  transform: translateY(-50%);
	}
	```
	
	- Flexbox
	```css
	.parent {
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	}
	```

### Horizontally & Vertically
- Fixed Width and Height
```css
.parent {
  position: relative;
}

.child {
  width: 300px;
  height: 100px;
  padding: 20px;

  position: absolute;
  top: 50%;
  left: 50%;

  margin: -70px 0 0 -170px;
}
```

- Unknown Width and Height
```css
.parent {
  position: relative;
}
.child {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
```

- Flexbox
```css
.parent {
  display: flex;
  justify-content: center;
  align-items: center;
}
```

## Reference
- [CSS-Tricks: Centering in CSS](https://css-tricks.com/centering-css-complete-guide/)