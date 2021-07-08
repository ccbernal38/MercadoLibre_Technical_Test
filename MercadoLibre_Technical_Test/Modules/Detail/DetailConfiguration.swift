//
//  DetailConfiguration.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

class DetailConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = DetailViewController()
        let router = DetailRouter(view: controller)
        let presenter = DetailPresenter(view: controller)
        let manager = DetailManager()
        let interactor = DetailInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
