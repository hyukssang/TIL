# Apple Pay

### Account Setup
1. Head to [Apple developer's program site](http://developer.apple.com)

	**Account** > **Member Center** > **Certificates, Identifiers & Profiles/Identifiers/App IDs**

2. First create a new Merchant ID by clicking on **Merchant IDs**. Merchant ID typically start with *merchant* followed by *bundle identifier* like:

	**merchant.com.companyname.appname**

3. Then create an App ID by click on **App IDs**. Note that sharing same bundle id with the app on Xcode might not work at this phase. Give it a unique id and change the id on Xcode app later to match later. Select **Apply Pay** and follow through.

4. If you need to use a device to test your app (e.g. if you need to use camera for your app), register the testing device under **Devices** tab. UDID needed for registering can be found when you connect your testing device to your computer, in iTunes, **Summary > Click on Serial Number (or label under Capacity)**.

5. Then, create a provisioning profile under **Provisioning Profiles** tab. Make sure the profile is active, and **download the profile**, **import it on Xcode** (Can be imported by selecting Project Name > Targets)

### ApplePay in Xcode
1. Import `PassKit`, which contains libraries for implementing ApplePay

2. Declare variables to store merchant id and supported payment networks
```Swift
let supportedPaymentMethods = [PKPaymentNetworkVisa, PKPaymentNetworkMasterCard, PKPaymentNetworkAmex]
	let applePayMerchantID = "merchant.com.companyname.appname"
```

3. Create a function to handle purchase. Inside, first declare instances of `PKPaymentRequest` which represents a single ApplePay payment, and `PKPaymentAuthorizationViewController`, responsible for displaying the ApplePay payment sheet.
```Swift
	let request = PKPaymentRequest()
	let applePayController = PKPaymentAuthorizationViewController(paymentRequest: request)
	self.present(applePayController, animated: true, completion: nil)
```

4. Then, change the properties inside `request` to support specific payment method/settings (like supported payment methods, country, currency, etc.)
```
	request.merchantIdentifier = self.applePayMerchantID
	request.supportedNetworks = self.supportedPaymentMethods
	request.merchantCapabilities = PKMerchantCapability.capability3DS
	request.countryCode = "US"
	request.currencyCode = "USD"
	request.requiredBillingAddressFields = PKAddressField.email
```

5. Prepare an array of `PKPaymentSummaryItem` (label-price pair of items to be purchased) and assign it to `paymentSummaryItems` property of `PKPaymentRequest` instance. Note that the last item in this array is to be used as total (i.e. to whom the user is paying to and total price of all the items).

6. Add `PKPaymentAuthorizationViewControllerDelegate` to the ViewController handling the payment and implement:
	- `paymentAuthorizationViewController(controller: didAuthorizePayment: completion:):` which handles the user authorization to complete the purchase.

	This is where you will send the payment request to your backend for processing. Without this, spinner will indefinitely, and the Apple Pay sheet will remain in place until the completion handler is invoked.
	- `paymentAuthorizationViewControllerDidFinish(controller:):` which is called when the payment request completes.

	```
		func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
			self.dismiss(animated: true, completion: nil)
		}
		func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {
			completion(PKPaymentAuthorizationStatus.success)
		}
	```
	**Warning:** PKPaymentAuthorization**Controller**Delegate != PKPaymentAuthorization**ViewController**Delegate<br/><br/>
\* Now Cancel button on Apple Pay should work

7. Set `delegate` of `applePayController` from step 3 to `self`


### Reference
- [Ray Wenderlich Apply Pay Tutorial](https://www.raywenderlich.com/87300/apple-pay-tutorial)
- [Apple API Reference on PassKit](https://developer.apple.com/reference/passkit)
- [Pre-populating billing/shipping address](https://developer.apple.com/library/prerelease/content/ApplePay_Guide/CreateRequest.html)
