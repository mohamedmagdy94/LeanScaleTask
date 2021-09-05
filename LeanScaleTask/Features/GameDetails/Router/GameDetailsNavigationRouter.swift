//
//  GameDetailsNavigationRouter.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation
import UIKit

class GameDetailsNavigationRouter {
    static func createModule(isMocking: Bool)->UIViewController{
        guard let gameDetailsView = UIViewController.create(storyboardName: Storyboard.GameDetails.rawValue, viewControllerID: ViewController.GameDetailsViewController.rawValue) as? GameDetailsViewController else{ return UIViewController() }
        return gameDetailsView
    }
    
    var screen: UIViewController
    
    init(screen: UIViewController) {
        self.screen = screen
    }
    
    
    
}
