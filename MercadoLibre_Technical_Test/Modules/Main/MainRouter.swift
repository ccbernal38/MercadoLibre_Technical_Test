//
//  MainRouter.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 7/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IMainRouter: class {
    func goToViewResults(products:[MainModel.Product])
    func showError(title:String, message:String)
}

class MainRouter: IMainRouter {	
	weak var view: MainViewController?
	
	init(view: MainViewController?) {
		self.view = view
	}
    /**
        Go to View details
     */
    func goToViewResults(products: [MainModel.Product]) {
        self.view?.navigate(type: .push, module: GeneralRoute.result(products))
    }
    
    func showError(title: String, message: String) {
        self.view?.navigate(type: .present, module: GeneralRoute.alert(title, message,nil))
    }
}
