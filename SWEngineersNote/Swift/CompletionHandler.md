# Completion Handler in Swift

### What is a completion handler?
It is a callback function that allows you to perform some action soon after a method or a function completes its task.
For example, if you request some data from network through API call and want to perform some action after you get the data, you pass in a completion handler function as a parameter to that API call. When the API call receives the data (or some error message), it calls the completion handler.

### How to make one
1. Create a function that deals with some action (ideally async request) and receives a completion handler as a parameter (with `@escaping` in front).
2. Inside the function, after you are done with what you wanted to do with the function, call completion handler function to complete the function call.
```
func loginUser(_ email: String, password: String, completionHandler: @escaping (FIRUser) -> Void) {
		FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {
			(user, error) in

			if error != nil{
				print("error")

			}
			else{
				print("user")
			}
			completionHandler(user!)
		})
	}
```
3. Outside of the function, call the function you implemented in above steps with the completion handler defined.
```
// This calls loginUser() function with a completion handler that prints the user data
self.loginViewModel.loginUser(email, password: password, completionHandler: { (user) in
				print(user)
			})
```

### Reference
https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html
