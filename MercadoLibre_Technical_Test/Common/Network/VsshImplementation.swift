//
//  NetworkImplementation.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 6/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

typealias SuccessCallback = (Codable) -> Void
typealias ErrorCallback = (CommunicationModel.BaseError) -> Void
typealias AnyClass<T> = T.Type

internal class NetworkImplementation: NSObject {
    fileprivate var communicationManager: Session?
    
    private var successCallback: SuccessCallback?
    private var errorCallback: ErrorCallback?
    private var requestData: CommunicationModel.Request
    private var type : Codable.Type
    
    init<T:Codable>(_ communicationManager: Session, request: CommunicationModel.Request? = nil, type:T.Type) {
        self.communicationManager = communicationManager
        self.type = type
        self.requestData = request ?? CommunicationModel.Request(method: .post, url:  "")
    }
    
    /**
     * Execute the request
     * - Parameters:
     *      - success: Success callback of the library.
     *      - error: Error callback of the library.
     *      - showError: Show error at current view controller.
     */
    func consume<T:Codable>(success: SuccessCallback!, error: ErrorCallback? = nil, type:T.Type) {
        self.successCallback = success
        self.errorCallback = error
        
        self.communicationManager?.request(requestData.url,
                                           method: requestData.method,
                                           parameters: requestData.requestBody)
            .responseDecodable(of: type){ response in
                switch response.result {
                case let .success(value):
                    self.successCallback!(value)
                case let .failure(error):
                    if let message = error.errorDescription {
                        self.errorCallback!(CommunicationModel.BaseError(description: message,
                                                                         statusCode: .generalError))
                    }else{
                        self.errorCallback!(CommunicationModel.BaseError(description: "",
                                                                         statusCode: .generalError))
                    }
                }
            }
    }
    
}

