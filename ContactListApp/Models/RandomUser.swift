//
//  RandomUser.swift
//  ContactListApp
//
//  Created by Victor on 22.01.2022.
//

import Foundation

// MARK: - Result
struct User: Codable {
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let login: Login?
    let dob, registred: Dob?
    let phone, cell: String?
    let id: ID?
    let picture: Picture?
    let nat: String?
    
    init(value: [String: Any]) {
        gender = value["gender"] as? String
        
        let nameDict = value["name"] as? [String: String] ?? [:]
        name = Name(value: nameDict)
        
        let locationDict = value["location"] as? [String: Any] ?? [:]
        location = Location(value: locationDict)
        
        email = value["email"] as? String
        
        let loginDict = value["login"] as? [String: String] ?? [:]
        login = Login(value: loginDict)
        
        let dobDict = value["dob"] as? [String: Any] ?? [:]
        dob = Dob(value: dobDict)
        
        let registredDict = value["registred"] as? [String: Any] ?? [:]
        registred = Dob(value: registredDict)
        
        phone = value["phone"] as? String
        cell = value["cell"] as? String
        
        let idDict = value["id"] as? [String: String] ?? [:]
        id = ID(value: idDict)
        
        let pictureDict = value["picture"] as? [String: String] ?? [:]
        picture = Picture(value: pictureDict)
        
        nat = value["nat"] as? String
    }
    
    static func getRandomUser(from value: Any) -> [User] {
        guard let value = value as? [String: Any] else { return [] }
        guard let results = value["results"] as? [[String: Any]] else { return [] }
        return results.compactMap{ User(value: $0) }
    }
}

// MARK: - Name
struct Name: Codable {
        let title,first,last : String?
        
    init(value: [String: String]) {
        title = value["title"]
        first = value["first"]
        last = value["last"]
    }
}

// MARK: - Location
struct Location: Codable {
    let street: String?
    let city, state, country: String?
    let postcode: Int?
    let coordinates: Coordinates?
    let timezone: Timezone?
    
    init(value: [String: Any]) {
        street = value["street"] as? String
        city = value["street"] as? String
        state = value["state"] as? String
        country = value["country"] as? String
        postcode = value["postcode"] as? Int
       
        let coordinateDict = value["coordinates"] as? [String: String] ?? [:]
        coordinates = Coordinates(value: coordinateDict)
        
        let timezoneDict = value["timezone"] as? [String: String] ?? [:]
        timezone = Timezone(value: timezoneDict)
    }
}

// MARK: - Street
struct Street: Codable {
    let number: Int?
    let name: String?
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitute: String?
    
    init(value: [String: String]) {
        latitude = value["latitude"]
        longitute = value["longitute"]
    }
}

// MARK: - Timezone
struct Timezone: Codable {
    let offset: String?
    let description: String?
    
    init(value: [String: String]) {
        offset = value["offset"]
        description = value["description"]
    }
}

// MARK: - Login
struct Login: Codable {
    let uuid, username: String?
    let password, salt: String?
    let md5, sha1, sha256: String?
    
    init(value: [String: String]) {
        uuid = value["uuid"]
        username = value["username"]
        password = value["password"]
        salt = value["salt"]
        md5 = value["md5"]
        sha1 = value["sha1"]
        sha256 = value["sha256"]
    }
}

// MARK: - Dob
struct Dob: Codable {
    let date: String?
    let age: Int?
    
    init(value: [String: Any]) {
        date = value["date"] as? String
        age = value["age"] as? Int
    }
}

// MARK: - ID
struct ID: Codable {
    let name, value: String?
    
    init(value: [String: String]) {
        name = value["name"]
        self.value = value["value"]
    }
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String?
    
    init(value: [String: String]) {
        large = value["large"]
        medium = value["medium"]
        thumbnail = value["thumbnail"]
    }
}

enum URLContacts: String {
    case randomUserAPI = "https://randomuser.me/api/"
}
