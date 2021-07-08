//
//  MainInteractor.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 7/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IMainInteractor: class {
    var parameters: [String: Any]? { get set }
    func getCategories()
    func handlerResponseGetCategories(value: [MainModel.Category])
    func searchProducts(value:String)
}

class MainInteractor: IMainInteractor {
    var presenter: IMainPresenter?
    var manager: IMainManager?
    var parameters: [String: Any]?
    
    init(presenter: IMainPresenter, manager: IMainManager) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func getCategories() {
        self.manager?.getCategories(success: { response in
            if let data = response as? [MainModel.Category]{
                self.handlerResponseGetCategories(value: data)
            }
        }, error: { error in
            print(error)
        })
    }
    
    func handlerResponseGetCategories(value: [MainModel.Category]) {
        self.presenter?.loadData(data: value)
    }
    
    func searchProducts(value: String) {
        let newValue = value.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        manager?.searchProducts(value: newValue,
                                success: { response in
                                    if let data = response as? MainModel.ResponseProduct{
                                        self.presenter?.loadProducts(products: data.results)
                                    }
                                }, error: { error in
                                    print(error)
                                })
    }
}
