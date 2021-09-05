//
//  UIView+Extension.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation
import UIKit

protocol Loadable {
    func showLoading()
    func hideLoading()
    func showError(message: String)
}

extension UIView: Loadable{}

extension Loadable where Self: UIView{
    
    func showLoading(){
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.gray)
        activityIndicator.alpha = 1.0
        self.addSubview(activityIndicator)
        activityIndicator.center = self.center
        activityIndicator.restorationIdentifier = "activityIndicator"
        activityIndicator.startAnimating()
    }
    
    func hideLoading(){
        if let activityIndicator = (self.subviews.first{ $0.restorationIdentifier == "activityIndicator" } as? UIActivityIndicatorView){
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    
    func showError(message: String){
        let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.present(alert, animated: true)

    }
}
