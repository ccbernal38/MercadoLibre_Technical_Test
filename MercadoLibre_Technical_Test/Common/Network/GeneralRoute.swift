//
//  GeneralRoute.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 6/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

enum GeneralRoute: IRouter {
    case alert(String, String, ((UIAlertAction) -> Void)?)
    case detail(MainModel.Product)
    case result([MainModel.Product])
}

extension GeneralRoute {
    var module: UIViewController? {
        switch self {
        case .alert(let title, let message, let completion):
            return showAlert(title: title, message: message, completion: completion)
        case .result(let products):
            return ResultConfiguration.setup(parameters: ["products":products])
        case .detail(let product):
            return DetailConfiguration.setup(parameters: ["product":product])
        }
    }
    
    private func showAlert(title:String, message:String, completion: ((UIAlertAction) -> Void)? = nil) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .destructive, handler: completion))
        return alert
    }
}


