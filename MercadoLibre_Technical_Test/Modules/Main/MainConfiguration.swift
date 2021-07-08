//
//  MainConfiguration.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 7/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

class MainConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = MainViewController()
        let router = MainRouter(view: controller)
        let presenter = MainPresenter(view: controller)
        let manager = MainManager()
        let interactor = MainInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
