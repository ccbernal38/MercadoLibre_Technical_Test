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

    var permalink = ""
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalle del producto"
        self.navigationItem.backButtonTitle = "Atras"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.scrollview.delegate = self
        self.interactor?.loadProduct()
    }
    @IBAction func btnGoToPressed(_ sender: Any) {
        self.router?.goToLink(url: self.permalink)
    }
}

extension DetailViewController: IDetailViewController {
    func loadData(product: MainModel.Product) {
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        labelTitle.text = product.title
        imageViewProduct.kf.indicatorType = .activity
        imageViewProduct.kf.setImage(with: URL(string: product.thumbnail!))
        
        let price : Float = (product.price)!
        if let priceValue = formatter.string(from: NSNumber(value: price)){
            lblPrice.text = "\(priceValue)"
        }else{
            lblPrice.text = ""
        }
        permalink = product.permalink!
    }
}

extension DetailViewController:UIScrollViewDelegate {
}

extension DetailViewController {
	// do someting...
}
