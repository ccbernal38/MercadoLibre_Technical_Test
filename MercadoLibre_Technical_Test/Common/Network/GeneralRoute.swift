//
//  GeneralRoute.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 6/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

enum GeneralRoute: IRouter {
    /*
     If you want passing with parameters
     you just add like this:
     
     case sample
     case sample(parameter: [String: Any])
     
     you can use: String, Int, [String: Any], etc..
    */
}

extension GeneralRoute {
    var module: UIViewController? {
        /*
         Setup module with parameters like:
         
         switch self {
         case .sample:
            return SampleConfiguration.setup()
        case .sample(let parameters):
            return SampleConfiguration.setup(parameters: parameters)
         }
         
         */
        return nil
    }
}
