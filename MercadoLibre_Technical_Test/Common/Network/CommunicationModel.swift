//
//  CommunicationModel.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 6/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

class AppSession {
    var isAuthenticated: Bool = false
}

struct CommunicationModel {
    struct Request {
        var method: HTTPMethod
        var url: String
        var isSecureRequest: Bool = false
        var isSecureResponse: Bool = true
        var addSessionId: Bool = false
        var headers: [AnyHashable: Any] = [:]
        var requestBody: [String: Any] = [:]
        
        init(method: HTTPMethod,
             url: String,
             isSecureRequest: Bool = false,
             isSecureResponse: Bool = true,
             addSessionId : Bool = false,
             headers: [AnyHashable: Any] = [:],
             requestBody: [String: Any] = [:]) {
            
            self.method = method
            self.url = url
            self.isSecureRequest = isSecureRequest
            self.isSecureResponse = isSecureResponse
            self.addSessionId = addSessionId
            self.headers = headers
            self.requestBody = requestBody
        }
    }
    
    enum ErrorCode: Int, Codable {
        case success = 0
        case generalError = -1
    }
    
    struct BaseResponse {
        var statusCode: CommunicationModel.ErrorCode?
        var serviceName: String?
        var message: String?
        var response: [String: Any]?
        
        init(data: [String: Any], statusCode :ErrorCode = .success) {
            self.response = data
            self.statusCode = statusCode
            getData(data: data)
        }
        
        func parseResponse<T>(_ type: T.Type) -> T? where T: Codable {
            if let response = response {
                return response.deserialize(type: type)
            }
            return nil
        }
        
        private mutating func getData(data: [AnyHashable: Any]) {
            if let errCode = data["statusCode"] as? String, let statusCode = Int(errCode) {
                self.statusCode = CommunicationModel.ErrorCode(rawValue: statusCode)
            } else {
                self.statusCode = .generalError
            }
            
            if let serviceName = data["serviceName"] as? String {
                self.serviceName = serviceName
            }
            
            if let message = data["message"] as? String {
                self.message = message
            }
        }
    }
    struct BaseError {
        var description:String?
        var statusCode:ErrorCode?
        
        init(description:String = "Error en el sistema, intente mas tarde.", statusCode: ErrorCode) {
            self.description = description
            self.statusCode = statusCode
        }
    }
}
