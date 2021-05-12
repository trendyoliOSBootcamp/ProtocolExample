//
//  AddressListTableViewCell.swift
//  ProtocolsDemoProject
//
//  Created by Emre Ergün on 11.05.2021.
//

import UIKit

class AddressListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var surnameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var districtNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fill(address: Address) {
        nameLabel.text = address.addressOwnerName
        surnameLabel.text = address.addressOwnerSurname
        addressLabel.text = address.address
        cityNameLabel.text = address.cityName
        districtNameLabel.text = address.districtName
    }
}
