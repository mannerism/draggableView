//
//  Utilities.swift
//  Peak App
//
//  Created by Pritesh Desai on 5/29/18.
//  Copyright © 2018 Little Maxima LLC. All rights reserved.
//

import UIKit

//MARK: - UIView Extensions
// Used to create a copy of the view
extension UIView
{
	func copyView<T: UIView>() -> T {
		return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
	}
}



//MARK: - Custom UILabel
// Used to create a custom UILabel with the proper fonts and other properties set
class MyShape: UIView {
	convenience init(frame: CGRect, shape: Shape) {
		self.init(frame: frame)
		setup(shape)
	}
	
	func setup(_ shape: Shape) {
		setupDefaultConfig()
		setupAppearance()
		setupShape(shape)
	}
	
	private func setupAppearance() {
		backgroundColor = .clear
		layer.borderWidth = CGFloat(4)
		layer.borderColor = UIColor.lightGray.cgColor
	}
	
	private func setupDefaultConfig() {
		isUserInteractionEnabled = true
	}
	
	private func setupShape(_ shape: Shape) {
		switch shape {
		case .circle:
			configureCircle()
		case .triangle:
			configureRectangle()
		default:
			self.layer.cornerRadius = 0
		}
	}
	
	private func configureCircle() {
		self.layer.cornerRadius = self.frame.height / 2
	}
	
	private func configureRectangle() {
		let longerWidth = self.frame.width + 200
		let height = self.frame.height
		self.frame = CGRect(x: 0, y: 0, width: longerWidth, height: height)
	}
}
