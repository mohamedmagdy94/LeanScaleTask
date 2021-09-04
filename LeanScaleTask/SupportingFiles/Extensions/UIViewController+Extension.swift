//
//  UIViewController+Extension.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import Foundation
import UIKit

extension UIViewController {
    static func create(storyboardName: String,viewControllerID: String)->UIViewController?{
        let targetStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        let destinationVC = targetStoryboard.instantiateViewController(withIdentifier: viewControllerID)
        return destinationVC
    }
    
    
}
