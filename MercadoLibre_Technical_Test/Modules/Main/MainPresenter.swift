//
//  MainPresenter.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 7/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IMainPresenter: class {
    func loadData(data:[MainModel.Category])
    func loadProducts(products: [MainModel.Product])
}

class MainPresenter: IMainPresenter {
    
	weak var view: IMainViewController?
	
	init(view: IMainViewController?) {
		self.view = view
	}
    
    func loadData(data: [MainModel.Category]) {
        self.view?.loadData(data: data)
    }
    
    func loadProducts(products: [MainModel.Product]) {
        self.view?.goToViewDetails(products: products)
    }

}
