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
        case none
        case spring(damping: CGFloat = 0.5, velocity : CGFloat = 5)
        case scale(_ base: CGSize = .zero, final: CGSize = CGSize(width: 1, height: 1))
    }
}

extension UIView
{
    func animate(_ type: AnimationType, duration: TimeInterval = 1,
                 delay: TimeInterval = 0, options: UIView.AnimationOptions = [],
                 animations: @escaping () -> Void = { }, completion: ((Bool) -> Void)? = nil)
    {
        switch type
        {
            case let .spring(damping, velocity):
                springAnimation(duration: duration, delay: delay,
                                damping: damping, velocity: velocity, options: options,
                                animations: animations, completion: completion)
                
            case let .scale(base, final):
                scale(base, final: final, duration: duration, delay: delay,
                      options: options, animations: animations, completion: completion)
                
            case .none: return
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
    
    private func scale(_ base: CGSize, final: CGSize, duration: TimeInterval,
                       delay: TimeInterval, options: UIView.AnimationOptions = [],
                       animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil)
    {
        transform = CGAffineTransform(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: duration, delay: delay,
                       options: options, animations:
                        {
                            self.transform = .identity
                            animations()
                        },
                       completion: completion)
    }
}
