//
//  DetailInteractor.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IDetailInteractor: class {
	var parameters: [String: Any]? { get set }
}

class DetailInteractor: IDetailInteractor {
    var presenter: IDetailPresenter?
    var manager: IDetailManager?
    var parameters: [String: Any]?

    init(presenter: IDetailPresenter, manager: IDetailManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
