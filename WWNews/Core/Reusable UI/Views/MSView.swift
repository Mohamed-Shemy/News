//
//  MSView.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

@IBDesignable
class MSView: UIView
{
    // MARK: - Properties
    
    @IBInspectable
    public var borderWidth: CGFloat = 0.0
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor = .black
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 0.0
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    public var shadowColor: UIColor = UIColor.darkGray
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    public var shadowOffsetWidth: CGFloat = 0.0
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    public var shadowOffsetHeight: CGFloat = 0.0
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    public var shadowOpacity: Float = 0.0
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    public var shadowRadius: CGFloat = 0.0
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    // MARK: - Override
    
    open override func layoutSubviews()
    {
        super.layoutSubviews()
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
