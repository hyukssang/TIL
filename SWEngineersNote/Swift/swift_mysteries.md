# Swift: Mysteries

### `NSString`: `boundingRect` and `NSAttributedString`: `boundingRect`
Somehow, the return values of the two versions of `boundingRect` differ. It seems that `boundingRect` of `NSAttributedString` does not take newline characters into account when coming up with the estimated size of the string in a text box.