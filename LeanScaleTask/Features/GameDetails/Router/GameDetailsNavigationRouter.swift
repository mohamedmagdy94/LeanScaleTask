//
//  GameDetailsNavigationRouter.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation
import UIKit

class GameDetailsNavigationRouter {
    static func createModule(isMocking: Bool,game: Game)->UIViewController{
        guard let gameDetailsView = UIViewController.create(storyboardName: Storyboard.GameDetails.rawValue, viewControllerID: ViewController.GameDetailsViewController.rawValue) as? GameDetailsViewController else{ return UIViewController() }
        let configurator = GameDetailsConfigurator(game: game, view: gameDetailsView)
        let configuredView = configurator.configModule()
        return configuredView
    }
    
    var screen: UIViewController
    
    init(screen: UIViewController) {
        self.screen = screen
    }
    
    
    
}
