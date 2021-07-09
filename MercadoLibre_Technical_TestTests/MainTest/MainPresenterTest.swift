//
//  MainPresenterTest.swift
//  MercadoLibre_Technical_TestTests
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//

import UIKit
import XCTest
@testable import MercadoLibre_Technical_Test

class MainPresenterTest: XCTestCase {

    var presenter: IMainPresenter?
    var viewControllerMock: MainViewControllerMock?

    override func setUpWithError() throws {
        viewControllerMock = MainViewControllerMock()
        presenter = MainPresenter(view: viewControllerMock)
        
    }

    override func tearDownWithError() throws {
        presenter = nil
        viewControllerMock = nil
    }

    func testGetCategoriesSuccess() throws {
        let cat = [MainModel.Category(name: "Cat 1", id: "cat01")]
        presenter?.loadData(data: cat)
    }
    
    

}
