//
//  ResultRouter.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IResultRouter: class {
    func goToDetailView(product:MainModel.Product)
}

class ResultRouter: IResultRouter {	
	weak var view: ResultViewController?
	
	init(view: ResultViewController?) {
		self.view = view
	}
    
    func goToDetailView(product: MainModel.Product) {
        self.view?.navigate(type: .push, module: GeneralRoute.detail(product))
    }
}
