var GetURL = function() {};
GetURL.prototype = {
	// Run this function as soon as JavaScript file on the current page loads
	run: function(arguments) {
		arguments.completionFunction({"URL": document.URL});
	}
};
// iOS now will look for an object named “ExtensionPreprocessingJS” to perform at runtime
var ExtensionPreprocessingJS = new GetURL;
