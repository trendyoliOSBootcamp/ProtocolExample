//
//  AddressListViewController.swift
//  ProtocolsDemoProject
//
//  Created by Emre Ergün on 11.05.2021.
//

import UIKit

class AddressListViewController: BaseViewController, LoadingShowable, NavigationBarButtonShowable {
    let addressManager = AddressManager()
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var addresses: [Address]?
    
    private func prepareTableView() {
        tableView.register(cellType: AddressListTableViewCell.self)
        
        tableView.contentInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Adresler"
        
        prepareTableView()
        fetchAddressList()
        
        createBarButton(title: "Geri", position: .left, target: navigationController, action: #selector(UINavigationController.popViewController(animated:)))
    }
    
    func fetchAddressList() {
        showLoading()
        addressManager.fetchAddresses { [weak self] (result) in
            self?.hideLoading()
            switch result {
            case .success(let response):
                self?.addresses = response.addresses
                self?.tableView.reloadData()
            case .failure(let error):
                self?.showAlert(message: error.localizedDescription)
            }
        }
    }
}

extension AddressListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let addresses = addresses else { return }
        let address = addresses[indexPath.row]
        showAlert(message: address.addressTitle)
    }
}
// MARK: - UITableViewDataSource
extension AddressListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(cellType: AddressListTableViewCell.self, indexPath: indexPath)
        
        if let addresses = addresses {
            cell.fill(address: addresses[indexPath.row])
        }
        return cell
    }
}
