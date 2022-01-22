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
        "results": "\(15)",
    ]
    
    private init() {}
    
    func fetchUsers(_ completion: @escaping (Result<[User], AFError>) -> Void) {
        AF.request(URLContacts.randomUserAPI.rawValue, parameters: urlParam)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let users = User.getRandomUser(from: value)
                    completion(.success(users))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }

    func fetchData(from url: String, _ completion: @escaping (Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    

}

