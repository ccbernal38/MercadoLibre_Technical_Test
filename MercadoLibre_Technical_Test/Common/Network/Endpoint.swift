//
//  Endpoint.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 6/07/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation

enum Endpoint : String {
    case categories = "categories"
    case searchProduct = "/search?q="
    case searchProductByCategory = "/search?category="
}
