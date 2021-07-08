//
//  MainModel.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 7/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

struct Generic :Codable {
    var test:String
}
struct MainModel {
    struct Category :Codable {
        var name:String?
        var id: String?
    }
    struct ResponseProduct: Codable{
        var site_id : String?
        var results : [Product]
    }
    
    struct Product : Codable {
        var id : String?
        var site_id : String?
        var title : String?
        var price: Float?
        var currency_id : String?
        var available_quantity: Int?
        var sold_quantity: Int?
        var buying_mode : String?
        var listing_type_id : String?
        var stop_time : String?
        var condition : String?
        var permalink : String?
        var thumbnail : String?
        var thumbnail_id : String?
        var accepts_mercadopago: Bool?
        var installments : Installment?
        var attributes : [Attribute]?
        var original_price: Float?
        var category_id : String?
        var official_store_id: Int?
        var domain_id : String?
        var catalog_product_id : String?
        var catalog_listing: Bool?
        var order_backend: Int?
    }
    
    struct Installment : Codable {
        var quantity : Int?
        var amount : Float?
        var rate : Float?
        var currency_id : String?
    }
    struct Attribute : Codable {
        var name : String?
        var value_name : String?
    }
    
}
