//
//  GameListNavigationRouter.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import Foundation
import UIKit.UIViewController

class GameListNavigationRouter {
    static func createModule()->UIViewController{
        guard let gameListView = UIViewController.create(storyboardName: Storyboard.GameList.rawValue, viewControllerID: ViewController.GameListViewController.rawValue) else{ return UIViewController() }
        return gameListView
    }
    
    var screen: UIViewController
    
    init(screen: UIViewController) {
        self.screen = screen
    }
    
    func showGameDetails(){
        
    }
    
    
}
