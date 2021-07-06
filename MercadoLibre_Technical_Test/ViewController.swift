//
//  ViewController.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 6/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService.shared.consumeWebService(request: CommunicationModel.Request(method: .get, url: "https://pokeapi.co/api/v2/pokemon/ditto2q"), success: { response in
            print(response)
        }, error: { error in
            print(error)
        })
    }


}

