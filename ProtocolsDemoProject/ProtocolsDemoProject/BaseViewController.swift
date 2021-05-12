//
//  BaseViewController.swift
//  ProtocolsDemoProject
//
//  Created by Emre Ergün on 11.05.2021.
//

import UIKit

class BaseViewController: UIViewController {
    let analyticsHandler = DummyAnalyticsHandler()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analyticsHandler.sendPageNameEvent(pageName: String(describing: self))
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Demo", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
}
