//
//  Extensions.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 6/07/21.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title:String, message:String, completion: ((UIAlertAction) -> Void)? = nil) {
        navigate(type: .present, module: GeneralRoute.alert(title, message, completion))
    }
}

extension UITableView{
    func getTableViewCell<T>(_ tableView: UITableView, type: T.Type) -> T where T: UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: type)) as! T
    }
}
