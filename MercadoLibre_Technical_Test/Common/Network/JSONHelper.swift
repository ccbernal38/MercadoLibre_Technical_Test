//
//  JSONHelper.swift
//  vssh-ios-cleanswift
//
//  Created by Ronal Ruiz on 20/03/20.
//  Copyright (c) 2020 Ronal Ruiz. All rights reserved.

import Foundation

extension Dictionary {
    /**
     *  Comvert from `Dictionary` to `Codable`.
     *
     *  - Returns:Dictionary object as Codable
     */
    func deserialize<T>(type: T.Type) -> T? where T: Codable {
        do {
            guard let data = try? JSONSerialization.data(withJSONObject: self,
                                                         options: .prettyPrinted) else { return nil }
            return try JSONDecoder().decode(type, from: data)
        } catch let error {
            print(">> Error Get/Parese as Data Custom =\(error.localizedDescription) !!")
        }
        return nil
    }
    
    /**
     * Convert  `Dictionary` to `String` with `JSON` format
     *
     * - Returns: String as JSON
     */
    func jsonString() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            
            return String(data: jsonData, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}

extension Encodable {
    /**
     * Convert `Encodable` object to `Dictionary`
     *
     * - Returns: Encodable object as Dictionary
     */
    func dictionary() -> [AnyHashable: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any]
        } catch {
            return [:]
        }
    }
}

extension String {
    /**
     * Convert `String` object to `Dictionary`
     *
     * - Returns: String object as Dictionary
     */
    func dictionary() -> [AnyHashable: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
