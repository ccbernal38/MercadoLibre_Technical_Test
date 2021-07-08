//
//  ResultConfiguration.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

class ResultConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = ResultViewController()
        let router = ResultRouter(view: controller)
        let presenter = ResultPresenter(view: controller)
        let manager = ResultManager()
        let interactor = ResultInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
