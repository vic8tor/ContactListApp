//
//  RandomUser.swift
//  ContactListApp
//
//  Created by Victor on 22.01.2022.
//

import Alamofire

struct User {
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let login: Login?
    let dob: Dob?
    let registred: Registred?
    let phone: String?
    let cell: String?
    let id: String?
    let picture: Picture?
    let nat: String?
}
    
    struct Name {
        let title: String?
        let first: String?
        let last: String?
    }

struct Location {
    let street: Street?
    let city: String?
    let state: String?
    let country: String?
    let postcode: Int?
    let coordinates: Coordinates?
    let timezone: Timezone?
}

struct Street {
    let number: Int?
    let name: String?
}

struct Coordinates {
    let latitude: String?
    let longitute: String?
}

struct Timezone {
    let offset: String?
    let description: String?
}

struct Login {
    let uuid: String?
    let username: String?
    let password: String?
    let salt: String?
    let md5: String?
    let sha1: String?
    let sha256: String?
}

struct Dob {
    let date: String?
    let age: String?
}

struct Registred {
    let date: String?
    let age: String?
}

struct Id {
    let name: String?
    let value: String?
}

struct Picture {
    let large: String?
    let medium: String?
    let thumbnail: String?
}

struct Info {
    let seed: String?
    let result: Int
    let page: Int
    let version: String?
}

enum URLContacts: String {
    case randomUserAPI = "https://randomuser.me/api/"
}
