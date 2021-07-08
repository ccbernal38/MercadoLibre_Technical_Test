//
//  DetailPresenter.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IDetailPresenter: class {
	// do someting...
}

class DetailPresenter: IDetailPresenter {	
	weak var view: IDetailViewController?
	
	init(view: IDetailViewController?) {
		self.view = view
	}
}
