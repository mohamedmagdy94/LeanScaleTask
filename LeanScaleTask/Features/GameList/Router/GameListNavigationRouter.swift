//
//  GameListNavigationRouter.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import Foundation
import UIKit.UIViewController

class GameListNavigationRouter: GameListNavigationRouterProtocol {
    static func createModule(isMocking: Bool)->UIViewController{
        guard let gameListView = UIViewController.create(storyboardName: Storyboard.GameList.rawValue, viewControllerID: ViewController.GameListViewController.rawValue) as? GameListViewController else{ return UIViewController() }
        let configurator = GameListConfigurator(view: gameListView,isMocking: isMocking)
        let configuredView = configurator.configModule()
        return configuredView
    }
    
    var screen: UIViewController
    
    init(screen: UIViewController) {
        self.screen = screen
    }
    
    func showGameDetails(with game: Game) {
        let gameDetailsScreen = GameDetailsNavigationRouter.createModule(isMocking: false)
        self.screen.navigationController?.pushViewController(gameDetailsScreen, animated: true)
    }
    
}
