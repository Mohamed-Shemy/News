//
//  UIView + Animation.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

extension UIView
{
    enum AnimationType
    {
        case spring(duration: TimeInterval = 1, delay: TimeInterval = 0, damping: CGFloat = 0.5, velocity : CGFloat = 5)
    }
}

extension UIView
{
    func animate(_ type: AnimationType, options: UIView.AnimationOptions = [],
                 animations: @escaping () -> Void = { }, completion: ((Bool) -> Void)? = nil)
    {
        switch type
        {
            case let .spring(duration, delay, damping, velocity):
                springAnimation(duration: duration, delay: delay,
                                damping: damping, velocity: velocity, options: options,
                                animations: animations, completion: completion)
        }
    }
    
    // MARK:- Private Methods
    
    private func springAnimation(duration: TimeInterval, delay: TimeInterval,
                                 damping: CGFloat, velocity: CGFloat, options: UIView.AnimationOptions = [],
                                 animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil)
    {
        let x = superview?.bounds.width ?? UIScreen.main.bounds.width
        transform = CGAffineTransform.identity.translatedBy(x: -x, y: 0)
        
        UIView.animate(withDuration: duration, delay: delay,
                       usingSpringWithDamping: damping,
                       initialSpringVelocity: velocity, options: .curveEaseInOut, animations:
                        {
                            self.transform = CGAffineTransform.identity
                            animations()
                        },
                       completion: completion)
    }
}
