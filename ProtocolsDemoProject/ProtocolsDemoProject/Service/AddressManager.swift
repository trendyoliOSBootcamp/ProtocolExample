//
//  AddressManager.swift
//  ProtocolsDemoProject
//
//  Created by Emre Ergün on 11.05.2021.
//

import Foundation

final class AddressManager {
    private let jsonDecoder: LocalJsonDecoder
    init(jsonDecoder: LocalJsonDecoder = LocalJsonDecoder.shared) {
        self.jsonDecoder = jsonDecoder
    }
    
    func fetchAddresses(completion: @escaping (Result<AddressResponse, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            do {
                let addressResponse = try self.jsonDecoder.read(for: AddressResponse.self, withName: "AddressResponse", bundle: .main)
                completion(.success(addressResponse))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
