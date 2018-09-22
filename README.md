# SwiftlyScrollSlider

[![Version](https://img.shields.io/cocoapods/v/SwiftlyScrollSlider.svg?style=flat)](http://cocoadocs.org/docsets/SwiftlyScrollSlider)
[![License](https://img.shields.io/cocoapods/l/SwiftlyScrollSlider.svg?style=flat)](http://cocoadocs.org/docsets/SwiftlyScrollSlider)
[![Platform](https://img.shields.io/cocoapods/p/SwiftlyScrollSlider.svg?style=flat)](http://cocoadocs.org/docsets/SwiftlyScrollSlider)
[![CocoaPods](https://img.shields.io/cocoapods/dt/SwiftlyScrollSlider.svg)](https://cocoapods.org/pods/SwiftlyScrollSlider)
[![CocoaPods](https://img.shields.io/cocoapods/dm/SwiftlyScrollSlider.svg)](https://cocoapods.org/pods/SwiftlyScrollSlider)


A custom scroll slider for <i>UIScrollView</i>.

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

Using is really simple. Please create for the example <i>UITextView</i> and <i>UIView</i> for the scroll slider in <i>Storyboard</i> or <i>XIB</i>, and set up a class to <i>SwiftlyScrollSlider</i> for this <i>UIView</i>.

![alt tag](https://raw.github.com/maximbilan/SwiftlyScrollSlider/master/img/2.png)

And the delegate of <i>UITextView</i> should be <i>SwiftlyScrollSlider</i>.

![alt tag](https://raw.github.com/maximbilan/SwiftlyScrollSlider/master/img/3.png)

That's all.

Examples of customization:

<pre>
scrollSlider.thumbImageView?.image = UIImage(named: "ScrollSliderCustom.png")       // Change an image of the scroll slider
scrollSlider.lineBackgroundView?.backgroundColor = UIColor.yellowColor()            // A color of the line
scrollSlider.lineBackgroundView?.layer.borderColor = UIColor.yellowColor().CGColor  // A border of the line color 
</pre>

You can easily found the example in this repository.

## License

SwiftlyScrollSlider is available under the MIT license. See the LICENSE file for more info.
