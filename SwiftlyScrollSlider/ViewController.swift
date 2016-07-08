//
//  ViewController.swift
//  SwiftlyScrollSlider
//
//  Created by Maxim on 6/11/16.
//  Copyright © 2016 Maxim Bilan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var scrollSlider: SwiftlyScrollSlider!
	@IBOutlet weak var textView: UITextView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		scrollSlider.thumbImageView?.image = UIImage(named: "ScrollSliderCustom.png")
		//scrollSlider.lineBackgroundView?.backgroundColor = UIColor.yellowColor()
		//scrollSlider.lineBackgroundView?.layer.borderColor = UIColor.yellowColor().CGColor
	}

}

