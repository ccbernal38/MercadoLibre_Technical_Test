//
//  MainViewControllerMock.swift
//  MercadoLibre_Technical_TestTests
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//

import UIKit
@testable import MercadoLibre_Technical_Test

class MainViewControllerMock: IMainViewController {
    var router: IMainRouter?
    
    func getCategories() {
        
    }
    
    func loadData(data: [MainModel.Category]) {
        assert(data.count == 1)
    }
    
    func goToViewDetails(products: [MainModel.Product]) {
        
    }
    
    func showError() {
        
    }
    
}
