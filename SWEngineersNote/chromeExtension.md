# Chrome Extension

### Manifest.json
Manifest is nothing more than a metadata file in JSON format that contains properties like your extension's name, description, version number and so on. At a high level, we will use it to declare to Chrome what the extension is going to do, and what permissions it requires in order to do those things. For more, refer to [Google Manifest File Format Documentation](https://developer.chrome.com/extensions/manifest)

Extensions can interact with web pages or servers using content scripts or cross-origin XMLHttpRequests. Extensions can also interact programmatically with browser features such as bookmarks and tabs.

**Sample Manifest File**
```JSON
	// Sample manifest file
	{
		"manifest_version": 2,

		"name": "Getting started example",
		"description": "This extension shows a Google Image search result for the current page",
		"version": "1.0",

		"browser_action": {
			"default_icon": "icon.png",
			"default_popup": "popup.html",
			"default_title": "Click here!"
		},
		"permissions": [
			"activeTab",
			"https://ajax.googleapis.com/"
		]
	}
```
- `default_icon` specifies the image to be used for the icon
- `default_popup` specifies the HTML file to be rendered as a popup window
- `default_title` specifies the message to appear when hovering over the icon (helpful message)

### Local Testing
1. Go to `chrome://extensions`
2. Check the checkbox **Developer mode**
3. Click on **Load unpacked extension...** and choose the directory you saved manifest.json and files that go along with it

**Files to be included**
- Manifest file
- One or more HTML files
- One or more JavaScript files
- Any other files, including images, etc.

### Reference
- [Google Chrome Developer Page](https://developer.chrome.com/extensions/getstarted)
- [Google Chrome Extension API](https://developer.chrome.com/extensions/api_index)
