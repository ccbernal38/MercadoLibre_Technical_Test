//
//  MainPresenterMock.swift
//  MercadoLibre_Technical_TestTests
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//

import Foundation
import XCTest
@testable import MercadoLibre_Technical_Test

class MainPresenterMock: IMainPresenter {
    
    func loadData(data: [MainModel.Category]) {
        XCTAssert(data.count == 2)
    }
    
    func loadProducts(products: [MainModel.Product]) {
        assert(products.count == 2)
    }
    
    func showError() {
        assert(true)
    }
    
}

