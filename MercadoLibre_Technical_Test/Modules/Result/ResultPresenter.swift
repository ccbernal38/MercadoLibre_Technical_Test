//
//  ResultPresenter.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IResultPresenter: class {
    func loadProducts(products: [MainModel.Product])
}

class ResultPresenter: IResultPresenter {	
	weak var view: IResultViewController?
	
	init(view: IResultViewController?) {
		self.view = view
	}
    
    func loadProducts(products: [MainModel.Product]) {
        self.view?.loadResults(products: products)
    }
}
