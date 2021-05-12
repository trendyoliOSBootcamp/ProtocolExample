//
//  NavigationBarButtonShowable.swift
//  ProtocolsDemoProject
//
//  Created by Emre Ergün on 11.05.2021.
//

import UIKit

enum NavigationBarButtonPosition {
    case left
    case right
}

protocol NavigationBarButtonShowable {
    func createBarButton(title: String, position: NavigationBarButtonPosition, target: Any?, action: Selector)
}

extension NavigationBarButtonShowable where Self: UIViewController {
    func createBarButton(title: String, position: NavigationBarButtonPosition, target: Any?, action: Selector) {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.orange, for: .normal)
        
        button.addTarget(target, action: action, for: .touchUpInside)
        let barButtonItem: UIBarButtonItem = .init(customView: button)
        
        switch position {
        case .left:
            navigationItem.leftBarButtonItem = barButtonItem
        case .right:
            navigationItem.rightBarButtonItem = barButtonItem
        }
    }
}
