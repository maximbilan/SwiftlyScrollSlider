//
//  SwiftlyScrollSlider.swift
//  SwiftlyScrollSlider
//
//  Created by Maxim on 6/11/16.
//  Copyright © 2016 Maxim Bilan. All rights reserved.
//

import UIKit

public class SwiftlyScrollSlider: UIView, UIScrollViewDelegate {
	
	@IBOutlet weak var scrollView: UIScrollView! {
		didSet {
			scrollViewContentDidChange()
		}
	}
	
	private var thumbImageView: UIImageView?
	private var thumbScrollView: UIScrollView?
	private var sourceContentOffsetUpdatesCount = 0
	private var thumbContentOffsetUpdatesCount = 0
	private var thumbHeight = 0
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		setupView()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
	}
	
//	public override func awakeFromNib() {
//		super.awakeFromNib()
//		
//		setupView()
//	}
	
	func setupView() {
		
		thumbImageView = UIImageView(image: UIImage(named: "ScrollSlider"))
		thumbImageView?.contentMode = .Center
		addSubview(thumbImageView!)
		
		thumbScrollView = UIScrollView(frame: self.bounds)
		thumbScrollView?.bounces = false
		thumbScrollView?.decelerationRate = 0
		thumbScrollView?.indicatorStyle = .Black
		thumbScrollView?.showsHorizontalScrollIndicator = false
		thumbScrollView?.showsVerticalScrollIndicator = false
		thumbScrollView?.delegate = self
		thumbScrollView?.backgroundColor = UIColor.clearColor()
		addSubview(thumbScrollView!)
		
		updateContentSize()
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		
		thumbScrollView!.frame = self.bounds
		
		updateContentSize()
		updateContentOffset()
		
		thumbImageView!.frame = CGRectMake(0, 0, self.bounds.size.width, thumbImageView!.image!.size.height)
		updateThumbImagePosition()
	}
	
	func scrollViewContentDidChange() {
		sourceContentOffsetUpdatesCount = 0
		thumbContentOffsetUpdatesCount = 0
		
		updateContentSize()
		updateContentOffset()
		updateThumbImagePosition()
	}
	
	func updateContentSize() {
		var contentHeight: CGFloat = 0
		if scrollView != nil {
			contentHeight = self.bounds.size.height + self.bounds.size.height - thumbImageView!.image!.size.height
		}
		else {
			contentHeight = self.bounds.size.height
		}
		thumbScrollView!.contentSize = CGSizeMake(self.bounds.size.width, CGFloat(roundf(Float(contentHeight))))
	}

	func updateContentOffset() {
		var targetHeight: CGFloat = thumbScrollView!.contentSize.height - thumbScrollView!.bounds.size.height
		if targetHeight < 0 {
			targetHeight = 0
		}
		var sourceHeight: CGFloat = self.scrollView.contentSize.height - self.scrollView.bounds.size.height
		if sourceHeight < 0 {
			sourceHeight = 0
		}
		var contentY: CGFloat = 0
		if targetHeight > 0 && sourceHeight > 0 {
			var ry: CGFloat = self.scrollView.contentOffset.y / sourceHeight
			if ry < 0 {
				ry = 0
			}
			else if ry > 1 {
				ry = 1
			}
			contentY = (1 - ry) * targetHeight
		}
		if contentY != thumbScrollView!.contentOffset.y {
			thumbContentOffsetUpdatesCount += 1
			thumbScrollView!.contentOffset = CGPointMake(0, contentY)
		}
	}
	
	func updateSourceContentOffset() {
		var targetHeight: CGFloat = thumbScrollView!.contentSize.height - thumbScrollView!.bounds.size.height
		if targetHeight < 0 {
			targetHeight = 0
		}
		var sourceHeight: CGFloat = self.scrollView.contentSize.height - self.scrollView.bounds.size.height
		if sourceHeight < 0 {
			sourceHeight = 0
		}
		var contentY: CGFloat = 0
		if targetHeight > 0 && sourceHeight > 0 {
			let ry: CGFloat = thumbScrollView!.contentOffset.y / targetHeight
			contentY = (1 - ry) * sourceHeight
		}
		if contentY != self.scrollView.contentOffset.y {
			sourceContentOffsetUpdatesCount += 1
			self.scrollView.contentOffset = CGPointMake(0, contentY)
		}
	}
	
	func updateThumbImagePosition() {
		var targetHeight: CGFloat = thumbScrollView!.bounds.size.height - thumbImageView!.image!.size.height
		if targetHeight < 0 {
			targetHeight = 0
		}
		var sourceHeight: CGFloat = self.scrollView.contentSize.height - self.scrollView.bounds.size.height
		if sourceHeight < 0 {
			sourceHeight = 0
		}
		var thumbY: CGFloat = 0
		if targetHeight > 0 && sourceHeight > 0 {
			var ry: CGFloat = self.scrollView.contentOffset.y / sourceHeight
			if ry < 0 {
				ry = 0
			}
			else if ry > 1 {
				ry = 1
			}
			thumbY = ry * targetHeight
		}
		var r = thumbImageView!.frame
		r.origin.y = CGFloat(roundf(Float(thumbY)))
		thumbImageView!.frame = r
	}
	
	public func scrollViewDidScroll(scrollView: UIScrollView) {
		if self.scrollView == scrollView {
			if (sourceContentOffsetUpdatesCount > 0) {
				sourceContentOffsetUpdatesCount -= 1
				return
			}
			updateContentOffset()
			updateThumbImagePosition()
		}
		else if self.thumbScrollView == scrollView {
			if thumbContentOffsetUpdatesCount > 0 {
				thumbContentOffsetUpdatesCount -= 1
				return
			}
			updateSourceContentOffset()
			updateThumbImagePosition()
		}
	}
	
}
