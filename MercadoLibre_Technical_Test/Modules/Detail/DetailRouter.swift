//
//  DetailRouter.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IDetailRouter: class {
	// do someting...
}

class DetailRouter: IDetailRouter {	
	weak var view: DetailViewController?
	
	init(view: DetailViewController?) {
		self.view = view
	}
}
