//
//  UIImageView + Kingfisher.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Kingfisher

extension UIImageView
{
    func setImage(from path: String, placeholder: UIImage? = nil)
    {
        let url = URL(string: path)
        kf.indicatorType = .activity
        kf.setImage(with: url, placeholder: placeholder)
    }
}
