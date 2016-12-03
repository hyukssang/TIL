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

2. Create a function to handle purchase. Inside, first declare instances of `PKPaymentRequest` which represents a single ApplePay payment, and `PKPaymentAuthorizationViewController`, responsible for displaying the ApplePay payment sheet.

```Swift
	let request = PKPaymentRequest()
	let applePayController = PKPaymentAuthorizationViewController(paymentRequest: request)
	self.present(applePayController, animated: true, completion: nil)
```

3. Declare variables to store merchant id and supported payment networks

```Swift
let supportedPaymentMethods = [PKPaymentNetworkVisa, PKPaymentNetworkMasterCard, PKPaymentNetworkAmex]
	let applePayMerchantID = "merchant.com.companyname.appname"
```
