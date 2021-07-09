//
//  DetailRouter.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IDetailRouter: class {
    func goToLink(url:String)
}

class DetailRouter: IDetailRouter {	
	weak var view: DetailViewController?
	
	init(view: DetailViewController?) {
		self.view = view
	}
    
    func goToLink(url: String) {
        let url : URL = URL(string: url)!
        UIApplication.shared.open(url)
    }
}
