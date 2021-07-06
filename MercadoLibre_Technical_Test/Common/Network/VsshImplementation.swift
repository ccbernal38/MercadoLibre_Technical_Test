//
//  NetworkImplementation.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 6/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

typealias SuccessCallback = (CommunicationModel.BaseResponse) -> Void
typealias ErrorCallback = (CommunicationModel.BaseError) -> Void


internal class NetworkImplementation: NSObject {
    fileprivate var communicationManager: Session?
    
    private var successCallback: SuccessCallback?
    private var errorCallback: ErrorCallback?
    private var requestData: CommunicationModel.Request
    
    init(_ communicationManager: Session, request: CommunicationModel.Request? = nil) {
        self.communicationManager = communicationManager
        self.requestData = request ?? CommunicationModel.Request(method: .post, url: "")
    }
    
    /**
     * Execute the request
     * - Parameters:
     *      - success: Success callback of the library.
     *      - error: Error callback of the library.
     *      - showError: Show error at current view controller.
     */
    func consume(success: SuccessCallback!, error: ErrorCallback? = nil) {
        self.successCallback = success
        self.errorCallback = error
        
        self.communicationManager?.request(requestData.url,
                                           method: requestData.method,
                                           parameters: requestData.requestBody)
            .responseJSON(){ [self] response in
                switch response.result {
                case .success:
                    if let data = response.value as? [String:Any] {
                        self.successCallback!(CommunicationModel.BaseResponse(data: data))
                    }else{
                        self.successCallback!(CommunicationModel.BaseResponse(data: [:]))
                    }
                case let .failure(error):
                    if let message = error.errorDescription {
                        errorCallback!(CommunicationModel.BaseError(description: message,
                                                                    statusCode: .generalError))
                    }else{
                        errorCallback!(CommunicationModel.BaseError(description: "",
                                                                    statusCode: .generalError))
                    }
                }
            }
        
    }
}

