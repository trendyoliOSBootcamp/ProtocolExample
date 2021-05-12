//
//  UITableViewCell+Extension.swift
//  ProtocolsDemoProject
//
//  Created by Emre Ergün on 12.05.2021.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
