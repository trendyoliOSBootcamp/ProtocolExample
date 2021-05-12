//
//  ViewController.swift
//  ProtocolsDemoProject
//
//  Created by Emre Ergün on 11.05.2021.
//

import UIKit

class HomeViewController: BaseViewController, NavigationBarButtonShowable {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        createBarButton(title: "Adresler", position: .right, target: self, action: #selector(addressesBarButtonTapped))
    }
    
    @objc
    private func addressesBarButtonTapped() {
        let addressesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AddressListViewController")
        navigationController?.pushViewController(addressesViewController, animated: true)
    }
    
    @IBAction private func alertButtonTapped() {
        showAlert(message: "A random alert!")
    }
}
