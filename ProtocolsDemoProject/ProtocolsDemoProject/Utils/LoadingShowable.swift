//
//  LoadingShowable.swift
//  ProtocolsDemoProject
//
//  Created by Emre Ergün on 11.05.2021.
//

import UIKit

protocol LoadingShowable {
    func showLoading()
    func hideLoading()
}

extension LoadingShowable {
    func showLoading() {
        ProgressView.shared.show()
    }
    
    func hideLoading() {
        ProgressView.shared.hide()
    }
}
