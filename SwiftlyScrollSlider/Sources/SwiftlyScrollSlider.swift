//
//  SwiftlyScrollSlider.swift
//  SwiftlyScrollSlider
//
//  Created by Maxim on 6/11/16.
//  Copyright © 2016 Maxim Bilan. All rights reserved.
//

import UIKit

open class SwiftlyScrollSlider: UIView {
	
	// MARK: - Outlets
	
	@IBOutlet weak var scrollView: UIScrollView! {
		didSet {
			scrollViewContentDidChange()
		}
	}
	
	// MARK: - Public properties
	
	open var thumbImageView: UIImageView?
	open var lineBackgroundView: UIView?
	open var lineBackgroundWidth: CGFloat = 0.5
	
	// MARK: - Private properties
	
	fileprivate var thumbScrollView: UIScrollView?
	fileprivate var sourceContentOffsetUpdatesCount = 0
	fileprivate var thumbContentOffsetUpdatesCount = 0
	fileprivate var thumbHeight = 0
	
	// MARK: - Initialization
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		setupView()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
	}
	
	// MARK: - Setup View
	
	func setupView() {
		thumbImageView = UIImageView(image: UIImage(named: "ScrollSlider.png", in: Bundle(for:self.classForCoder), compatibleWith: nil))
		thumbImageView?.contentMode = .center
		
		lineBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: thumbImageView!.image!.size.width * lineBackgroundWidth, height: self.bounds.size.height))
		lineBackgroundView?.center = CGPoint(x: self.bounds.size.width * 0.5 - (lineBackgroundView?.frame.size.width)! * 0.5, y: self.bounds.size.height * 0.5)
		lineBackgroundView?.backgroundColor = UIColor.darkGray
		lineBackgroundView?.layer.cornerRadius = 3.0
		lineBackgroundView?.layer.borderWidth = 1.0
		
		addSubview(lineBackgroundView!)
		addSubview(thumbImageView!)
		
		thumbScrollView = UIScrollView(frame: self.bounds)
		thumbScrollView?.bounces = false
		thumbScrollView?.decelerationRate = 0
		thumbScrollView?.indicatorStyle = .black
		thumbScrollView?.showsHorizontalScrollIndicator = false
		thumbScrollView?.showsVerticalScrollIndicator = false
		thumbScrollView?.delegate = self
		thumbScrollView?.backgroundColor = UIColor.clear
		addSubview(thumbScrollView!)
		
		updateContentSize()
	}
	
	// MARK: - Layout Subviews
	
	open override func layoutSubviews() {
		super.layoutSubviews()
		
		thumbScrollView!.frame = self.bounds
		
		let sliderWidth = thumbImageView!.image!.size.width * lineBackgroundWidth
		var bounds = self.bounds
		bounds.size.width = sliderWidth
		lineBackgroundView!.frame = bounds
		var center = lineBackgroundView?.center
		center?.x = self.bounds.size.width * 0.5
		lineBackgroundView!.center = center!
		
		updateContentSize()
		updateContentOffset()
		
		thumbImageView!.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: thumbImageView!.image!.size.height)
		updateThumbImagePosition()
	
	}
	
	// MARK: - Scroll view change event
	
	func scrollViewContentDidChange() {
		sourceContentOffsetUpdatesCount = 0
		thumbContentOffsetUpdatesCount = 0
		
		updateContentSize()
		updateContentOffset()
		updateThumbImagePosition()
	}
	
	// MARK: - Logic
	
	func updateContentSize() {
		var contentHeight: CGFloat = 0
		if scrollView != nil {
			contentHeight = self.bounds.size.height + self.bounds.size.height - thumbImageView!.image!.size.height
		}
		else {
			contentHeight = self.bounds.size.height
		}
		thumbScrollView!.contentSize = CGSize(width: self.bounds.size.width, height: CGFloat(roundf(Float(contentHeight))))
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
			thumbScrollView!.contentOffset = CGPoint(x: 0, y: contentY)
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
			self.scrollView.contentOffset = CGPoint(x: 0, y: contentY)
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
	
}

extension SwiftlyScrollSlider: UIScrollViewDelegate {
	
	public func scrollViewDidScroll(_ scrollView: UIScrollView) {
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
