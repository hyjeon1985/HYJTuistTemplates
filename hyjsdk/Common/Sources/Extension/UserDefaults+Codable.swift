//
//  UserDefaults+Codable.swift
//  Common
//
//  Created by Hoyeol Jeon on 10/24/23.
//

import Foundation

public extension UserDefaults {
    func set<T: Codable>(object: T, forKey: String) {
        guard let jsonData = try? JSONEncoder().encode(object) else {
            self.removeObject(forKey: forKey)
            return
        }
        set(jsonData, forKey: forKey)
    }

    func get<T: Codable>(objectType: T.Type, forKey: String) -> T? {
        guard let result = value(forKey: forKey) as? Data else { return nil }
        return try? JSONDecoder().decode(objectType, from: result)
    }
}
