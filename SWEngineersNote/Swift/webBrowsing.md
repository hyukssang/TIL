## Web browsing methods for iOS

### Safari (default app)
> Open Safari from the current iOS application

##### How to use / Example
```
UIApplication.sharedApplication().openURL(URL(string: self.url)!)
```

### WebView
> Open websites contained in a `WebView`

##### How to use / Example
```
let webView = UIWebView(frame: self.view.frame)
webView.loadRequest(NSURLRequest(URL: NSURL(string: self.url)!))
self.view.addSubview(webView)
```

### SafariViewController
> Embed Safari inside the current iOS application

##### How to use
1. Import `SafariServices` library
```
import SafariServices
```
2. Specify the url you want to open as default on `SFSafariViewController`
```
let url = URL(string: "https://www.google.com")
let safariVC = SFSafariViewController(url: url!)
```
3. Present it
```
self.present(safariVC, animated: true, completion: nil)
```

#### Additional Notes
- If you want more control over `SFSafariViewController`, implement functions in `SFSafariViewControllerDelegate`.
