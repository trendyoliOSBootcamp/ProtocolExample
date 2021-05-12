//
//  AddressResponse.swift
//  ProtocolsDemoProject
//
//  Created by Emre Ergün on 11.05.2021.
//

import Foundation

struct AddressResponse: Decodable {
    let addresses: [Address]
}

struct Address: Decodable {
    let addressTitle: String
    let addressOwnerName: String
    let addressOwnerSurname: String
    let cityName: String
    let districtName: String
    let address: String
}
