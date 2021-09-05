//
//  FavouriteListNavigationRouter.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 06/09/2021.
//

import Foundation
import UIKit

class FavouriteListNavigationRouter: FavouriteListRouterProtocol {
    static func createModule(isMocking: Bool)->UIViewController{
        guard let favouriteListView = UIViewController.create(storyboardName: Storyboard.FavouriteList.rawValue, viewControllerID: ViewController.FavouriteListViewController.rawValue) as? FavouriteListViewController else{ return UIViewController() }
        let configurator = FavouriteListConfigurator(view: favouriteListView)
        let configuredView = configurator.configModule()
        return configuredView
    }
    
    var screen: UIViewController
    
    init(screen: UIViewController) {
        self.screen = screen
    }
    
    func showGameDetails(game: Game) {
        let gameDetailsScreen = GameDetailsNavigationRouter.createModule(isMocking: false, game: game)
        self.screen.navigationController?.pushViewController(gameDetailsScreen, animated: true)
    }
    
}

