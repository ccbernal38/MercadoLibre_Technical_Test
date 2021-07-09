//
//  DetailViewController.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IDetailViewController: class {
	var router: IDetailRouter? { get set }
    func loadData(product:MainModel.Product)
}

class DetailViewController: UIViewController {
	var interactor: IDetailInteractor?
	var router: IDetailRouter?

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewProduct: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalle"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.scrollview.delegate = self
        self.interactor?.loadProduct()
    }
}

extension DetailViewController: IDetailViewController {
    func loadData(product: MainModel.Product) {
        labelTitle.text = product.title
        imageViewProduct.kf.indicatorType = .activity
        imageViewProduct.kf.setImage(with: URL(string: product.thumbnail!))
    }
}

extension DetailViewController:UIScrollViewDelegate {
}

extension DetailViewController {
	// do someting...
}
