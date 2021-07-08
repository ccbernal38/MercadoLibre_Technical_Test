//
//  DetailViewController.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IDetailViewController: class {
	var router: IDetailRouter? { get set }
}

class DetailViewController: UIViewController {
	var interactor: IDetailInteractor?
	var router: IDetailRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalle"
    }
}

extension DetailViewController: IDetailViewController {
	// do someting...
}

extension DetailViewController {
	// do someting...
}

extension DetailViewController {
	// do someting...
}
