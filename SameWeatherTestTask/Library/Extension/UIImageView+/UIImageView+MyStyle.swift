//
//  UIImageView+MyStyle.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 26.12.2023.
//

import UIKit

extension UIImageView {
    
    public func setMyStyle(corner: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        layer.cornerRadius = corner
        clipsToBounds = true
        return self
    }
}
