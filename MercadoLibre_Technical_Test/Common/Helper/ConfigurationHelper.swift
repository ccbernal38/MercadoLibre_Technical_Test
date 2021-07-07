//
//  ConfigurationHelper.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 6/07/21.
//

import Foundation
import Foundation

struct ConfigurationKey {
    static let baseURL = "BASE_URL"
}

class ConfigurationHelper {
    static func getConfiguration(_ key: String) -> String {
        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource:  "Configurations", ofType: "plist"){
            nsDictionary = NSDictionary(contentsOfFile: path)
            if let value = nsDictionary?.object(forKey: key) as? String{
                return value
            }
        }
        return ""
    }
}
