//
//  ResultInteractor.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IResultInteractor: class {
	var parameters: [String: Any]? { get set }
    func loadProducts()
}

class ResultInteractor: IResultInteractor {
    var presenter: IResultPresenter?
    var manager: IResultManager?
    var parameters: [String: Any]?

    init(presenter: IResultPresenter, manager: IResultManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func loadProducts() {
        if let products = parameters!["products"] as? [MainModel.Product] {
            self.presenter?.loadProducts(products: products)
        }
    }
}
