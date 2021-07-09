//
//  MainInteractorTest.swift
//  MercadoLibre_Technical_TestTests
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//

import XCTest
@testable import MercadoLibre_Technical_Test

class MainInteractorTest: XCTestCase {

    var presenterMock: MainPresenterMock?
    var managerMock: MainManagerMock?
    var interactor: IMainInteractor?

    override func setUpWithError() throws {
        presenterMock = MainPresenterMock()
        managerMock = MainManagerMock()
        interactor = MainInteractor(presenter: presenterMock!,
                                    manager: managerMock!)
    }

    override func tearDownWithError() throws {
        presenterMock = nil
        managerMock = nil
    }

    func testGetCategoriesSuccess() throws {
        managerMock?.setIsError(false)
        interactor?.getCategories()
    }
    
    func testGetCategoriesFailure() throws {
        managerMock?.setIsError(true)
        interactor?.getCategories()
    }

    func testSearchProductsSuccess() throws {
        managerMock?.setIsError(false)
        interactor?.searchProducts(value: "Prod")
    }
    
    func testSearchProductsFailure() throws {
        managerMock?.setIsError(true)
        interactor?.searchProducts(value: "Prod")
    }

    func testSearchProductByCategorySuccess() throws {
        managerMock?.setIsError(false)
        interactor?.searchProductByCategory(id: "01")
    }
    
    func testSearchProductByCategoryFailure() throws {
        managerMock?.setIsError(true)
        interactor?.searchProductByCategory(id: "01")
    }

}
