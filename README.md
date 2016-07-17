# SwiftlyScrollSlider

Custom scroll slider for <i>UIScrollView</i>.

![alt tag](https://raw.github.com/maximbilan/SwiftlyScrollSlider/master/img/1.png)

## Installation
<b>CocoaPods</b>:
<pre>
pod 'SwiftlyScrollSlider'
</pre>
<b>Manual</b>:
<pre>
Just copy the <i>SwiftlyScrollSlider.swift</i> into your project.
</pre>

## Using

Using is really simple. Please create for example UITextView and UIView for scroll slider in storyboard or XIB, and set up class to SwiftlyScrollSlider for this UIView.

![alt tag](https://raw.github.com/maximbilan/SwiftlyScrollSlider/master/img/2.png)

And delegate of UITextView should be SwiftlyScrollSlider.

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
