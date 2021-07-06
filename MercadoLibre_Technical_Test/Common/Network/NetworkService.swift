//
//  NetworkService.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 6/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()

    fileprivate var helper: NetworkImplementation?
    fileprivate var network:Session?
    /**
     * Using the implementation to consume an service.
     *
     * - Parameters:
     *      - request: Request data.
     *      - success: Success callback of the service.
     *      - error: Error callback of the service.
     *      - showError: If this value is true, the error of the service will be showed at the current view controller.
     */
    func consumeWebService(request: CommunicationModel.Request,
                           success: @escaping SuccessCallback, error: ErrorCallback? = nil) {
        let communicationManager = getNetwork()
        
        self.helper = NetworkImplementation(communicationManager!, request: request)
        self.helper?.consume(success: success, error: error)
    }
        
    private func getNetwork() -> Session? {
        if (self.network == nil) {
            self.network = AF
        }
        return self.network
    }
}
