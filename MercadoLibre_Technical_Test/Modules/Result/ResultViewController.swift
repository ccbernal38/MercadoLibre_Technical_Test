//
//  ResultViewController.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IResultViewController: class {
	var router: IResultRouter? { get set }
    func loadResults(products:[MainModel.Product])
    func goToDetailView(product:MainModel.Product)
}

class ResultViewController: UIViewController {
	var interactor: IResultInteractor?
	var router: IResultRouter?
    var listProducts:[MainModel.Product] = []
    let nibResultCollectionViewCell = "ResultCollectionViewCell"

    @IBOutlet weak var collectionVIew: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Resultados"
        self.navigationController?.navigationBar.backItem?.title = "Atras"
        self.navigationItem.backButtonTitle = "Atras"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        collectionVIew.register(UINib(nibName: nibResultCollectionViewCell, bundle: .main),
                                forCellWithReuseIdentifier: nibResultCollectionViewCell)
        self.interactor?.loadProducts()
    }
}

extension ResultViewController: IResultViewController {
    func loadResults(products: [MainModel.Product]) {
        self.listProducts =  products
        collectionVIew.reloadData()
    }
    
    func goToDetailView(product: MainModel.Product) {
        self.router?.goToDetailView(product: product)
    }
}

extension ResultViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = listProducts[indexPath.row]
        self.goToDetailView(product: product)
    }
}

extension ResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nibResultCollectionViewCell,
                                                      for: indexPath) as? ResultCollectionViewCell
        cell?.labelText.text = listProducts[indexPath.row].title
        cell?.setImage(url: listProducts[indexPath.row].thumbnail!)
        return cell!
    }
}

extension ResultViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20)/2
        return CGSize(width: width, height: width+20)
    }
}

