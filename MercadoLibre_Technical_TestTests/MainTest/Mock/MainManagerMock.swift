//
//  MainManagerTest.swift
//  MercadoLibre_Technical_TestTests
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//

import UIKit
@testable import MercadoLibre_Technical_Test

class MainManagerMock: IMainManager {
    
    var isError:Bool = false
    
    func getCategories(success: @escaping SuccessCallback, error: @escaping ErrorCallback) {
        if isError {
            let errorData = CommunicationModel.BaseError(statusCode: .generalError)
            error(errorData)
        }else{
            let cat1 = MainModel.Category(name: "Cat 1", id: "id01")
            let cat2 = MainModel.Category(name: "Cat 2", id: "id02")
            let categories = [cat1, cat2]
            success(categories)
        }
    }
    
    func searchProducts(value: String, success: @escaping SuccessCallback, error: @escaping ErrorCallback) {
        if isError {
            let errorData = CommunicationModel.BaseError(statusCode: .generalError)
            error(errorData)
        }else{
            let prod1 = MainModel.Product(id: "id01", site_id: "", title: "Prod 1", price: 1000, currency_id: "", available_quantity: 10, sold_quantity: 10, buying_mode: "", listing_type_id: "", stop_time: "", condition: "", permalink: "", thumbnail: "", thumbnail_id: "", accepts_mercadopago: true, installments: nil, attributes: [], original_price: 1000, category_id: "", official_store_id: 12, domain_id: "12", catalog_product_id: "", catalog_listing: true, order_backend: 1)
            let prod2 = MainModel.Product(id: "id02", site_id: "", title: "Prod 2", price: 2000, currency_id: "", available_quantity: 10, sold_quantity: 10, buying_mode: "", listing_type_id: "", stop_time: "", condition: "", permalink: "", thumbnail: "", thumbnail_id: "", accepts_mercadopago: true, installments: nil, attributes: [], original_price: 2000, category_id: "", official_store_id: 12, domain_id: "12", catalog_product_id: "", catalog_listing: true, order_backend: 1)
            let products = [prod1, prod2]
            let response = MainModel.ResponseProduct(site_id: "site", results: products)
            success(response)
        }
    }
    
    func searchProductsByCategory(id: String, success: @escaping SuccessCallback, error: @escaping ErrorCallback) {
        if isError {
            let errorData = CommunicationModel.BaseError(statusCode: .generalError)
            error(errorData)
        }else{
            let prod1 = MainModel.Product(id: "id01", site_id: "", title: "Prod 1", price: 1000, currency_id: "", available_quantity: 10, sold_quantity: 10, buying_mode: "", listing_type_id: "", stop_time: "", condition: "", permalink: "", thumbnail: "", thumbnail_id: "", accepts_mercadopago: true, installments: nil, attributes: [], original_price: 1000, category_id: "", official_store_id: 12, domain_id: "12", catalog_product_id: "", catalog_listing: true, order_backend: 1)
            let prod2 = MainModel.Product(id: "id02", site_id: "", title: "Prod 2", price: 2000, currency_id: "", available_quantity: 10, sold_quantity: 10, buying_mode: "", listing_type_id: "", stop_time: "", condition: "", permalink: "", thumbnail: "", thumbnail_id: "", accepts_mercadopago: true, installments: nil, attributes: [], original_price: 2000, category_id: "", official_store_id: 12, domain_id: "12", catalog_product_id: "", catalog_listing: true, order_backend: 1)
            let products = [prod1, prod2]
            let response = MainModel.ResponseProduct(site_id: "site", results: products)
            success(response)
        }

    }
    
    func setIsError(_ isError:Bool){
        self.isError = isError
    }
    

}
