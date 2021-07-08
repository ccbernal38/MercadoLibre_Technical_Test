//
//  Extensions.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 6/07/21.
//

import Foundation
import UIKit

class BaseViewController:UIViewController {
    var loadingView : UIView? 

    func showAlert(title:String, message:String, completion: ((UIAlertAction) -> Void)? = nil) {
        navigate(type: .present, module: GeneralRoute.alert(title, message, completion))
    }
    func showLoading() {
        let onView = self.view
        let spinnerView = UIView.init(frame: onView!.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.8)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView!.addSubview(spinnerView)
        }
        
        loadingView = spinnerView
    }
    
    func removeLoading() {
        DispatchQueue.main.async {
            self.loadingView?.removeFromSuperview()
            self.loadingView = nil
        }
    }

}

extension UITableView{
    func getTableViewCell<T>(_ tableView: UITableView, type: T.Type) -> T where T: UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: type)) as! T
    }
}

extension UIView {
    
    @IBInspectable
    var bornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
