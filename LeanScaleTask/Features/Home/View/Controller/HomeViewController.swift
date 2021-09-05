//
//  HomeViewController.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 06/09/2021.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        let gamesListScreen = GameListNavigationRouter.createModule(isMocking: false)
        gamesListScreen.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        let favouritesScreen = FavouriteListNavigationRouter.createModule(isMocking: false)
        favouritesScreen.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        viewControllers = [gamesListScreen,favouritesScreen]
    }

    
    static func create()->UIViewController{
        let view = UIViewController.create(storyboardName: Storyboard.Home.rawValue, viewControllerID: ViewController.HomeViewController.rawValue) ?? UIViewController()
        return view
    }
}
