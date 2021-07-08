//
//  MainManager.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 7/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation

protocol IMainManager: class {
    
    func getCategories(success: @escaping SuccessCallback, error: @escaping ErrorCallback)
    func searchProducts(value: String, success: @escaping SuccessCallback, error: @escaping ErrorCallback)
    
}

class MainManager: IMainManager {
    func getCategories(success: @escaping SuccessCallback, error: @escaping ErrorCallback) {
        NetworkService.shared.consumeWebService(request: CommunicationModel.Request(method: .get,
                                                                                    url: Endpoint.categories.rawValue),
                                                type: [MainModel.Category].self,
                                                success: { response in
                                                    success(response)
                                                }, error: { errorData in
                                                    error(errorData)
                                                })
    }
    
    func searchProducts(value: String, success: @escaping SuccessCallback, error: @escaping ErrorCallback) {
        let url = Endpoint.searchProduct.rawValue + value
        let request = CommunicationModel.Request(method: .get,
                                                 url: url)
        NetworkService.shared.consumeWebService(request: request,
                                                type: MainModel.ResponseProduct.self,
                                                success: { response in
                                                    success(response)
                                                }, error: { errorData in
                                                    error(errorData)
                                                })
    }
}
