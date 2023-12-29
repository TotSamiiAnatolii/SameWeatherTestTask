//
//  UIViewController+MyStyle.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import UIKit

extension UIViewController {
    
    func setupNavigationBar(leftItem: UIBarButtonItem?, rightItem: UIBarButtonItem?, titleView: UIView?) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .white

        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        navigationItem.backButtonTitle = ""
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = rightItem
        navigationItem.titleView = titleView
        navigationController?.navigationBar.tintColor = .black
    }
}
