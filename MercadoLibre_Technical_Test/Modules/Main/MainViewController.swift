//
//  MainViewController.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 7/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IMainViewController: class {
	var router: IMainRouter? { get set }
    func getCategories()
    func loadData(data:[MainModel.Category])
    func goToViewDetails(products: [MainModel.Product])
    func showError()
}

class MainViewController: BaseViewController {
	var interactor: IMainInteractor?
	var router: IMainRouter?
    var listCategories:[MainModel.Category]? = []
    let nibMainCollectionViewCell = "MainCollectionViewCell"

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionCategories: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchBar.layer.borderWidth = 0
        searchBar.layer.borderColor = UIColor.blue.cgColor
        collectionCategories.register(UINib(nibName: nibMainCollectionViewCell, bundle: .main),
                                        forCellWithReuseIdentifier: nibMainCollectionViewCell)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        getCategories()
    }
    
    /** Hide Keyboard*/
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
//MARK: - IMainViewController

extension MainViewController: IMainViewController {
    func getCategories() {
        self.interactor?.getCategories()
    }
    
    func loadData(data: [MainModel.Category]) {
        self.listCategories = data
        collectionCategories.reloadData()
    }
    
    func goToViewDetails(products: [MainModel.Product]) {
        self.removeLoading()
        self.router?.goToViewResults(products: products)
    }
    
    func showError() {
        self.removeLoading()
        self.router?.showError(title:"Alerta", message:"Error en el sistema, intente mas tarde")
    }
}
//MARK: - UICollectionViewDelegate

extension MainViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = self.listCategories![indexPath.row]

        showAlert(title: category.id!, message: category.name!)
    }
}
//MARK: - UICollectionViewDataSource

extension MainViewController:UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCategories!.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nibMainCollectionViewCell,
                                                      for: indexPath) as? MainCollectionViewCell
        let category = self.listCategories![indexPath.row]
        cell?.setup(data: category)
        cell?.callbackClick = { cat in
            self.showLoading()
            self.interactor?.searchProductByCategory(id: cat.id!)
        }
        return cell!
    }
}
//MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width)
        return CGSize(width: width, height: 40)
    }
}
//MARK: - UISearchBarDelegate

extension MainViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let value = searchBar.text!
        if value != "" {
            self.showLoading()
            self.interactor?.searchProducts(value: value)
            self.dismissKeyboard()
        }
    }
}
