//
//  NetworkManager.swift
//  ContactListApp
//
//  Created by Victor on 22.01.2022.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()

    private let urlParam = [
        "results": "\(15)"]
    
    private init() {}
    
    func fetch(_ completion: @escaping (Result<[User], AFError>) -> Void) {
        AF.request(URLContacts.randomUserAPI.rawValue, parameters: urlParam)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let users = User.getRandomUser(from: value)
                    print(users)
                    completion(.success(users))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }



}

