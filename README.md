# SwiftlyScrollSlider

Custom scroll slider for <i>UIScrollView</i>.

![alt tag](https://raw.github.com/maximbilan/SwiftlyScrollSlider/master/img/1.png)

## Installation
<b>CocoaPods</b>:
<pre>
<b>Swift 3.0</b>:
pod 'SwiftlyScrollSlider', '0.3.0'

<b>Swift 4.0</b>:
pod 'SwiftlyScrollSlider', '~> 0.4.0'
</pre>
<b>Manual</b>:
<pre>
Just copy the <i>SwiftlyScrollSlider.swift</i> into your project.
</pre>

## Using

Using is really simple. Please create for example <i>UITextView</i> and <i>UIView</i> for scroll slider in <i>Storyboard</i> or <i>XIB</i>, and set up class to <i>SwiftlyScrollSlider</i> for this <i>UIView</i>.

![alt tag](https://raw.github.com/maximbilan/SwiftlyScrollSlider/master/img/2.png)

And delegate of <i>UITextView</i> should be <i>SwiftlyScrollSlider</i>.

![alt tag](https://raw.github.com/maximbilan/SwiftlyScrollSlider/master/img/3.png)

That's all.

Examples of customization:

<pre>
scrollSlider.thumbImageView?.image = UIImage(named: "ScrollSliderCustom.png")       // Change image of scroll slider
scrollSlider.lineBackgroundView?.backgroundColor = UIColor.yellowColor()            // Color of line
scrollSlider.lineBackgroundView?.layer.borderColor = UIColor.yellowColor().CGColor  // Border of line color 
</pre>

You can easily found example in this repository.

## License

SwiftlyScrollSlider is available under the MIT license. See the LICENSE file for more info.
