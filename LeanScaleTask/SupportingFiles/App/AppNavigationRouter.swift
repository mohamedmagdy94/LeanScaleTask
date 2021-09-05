//
//  AppNavigationRouter.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import Foundation
import UIKit

class AppNavigationRouter{
    static func createModule()->UINavigationController{
        let firstScreen = GameListNavigationRouter.createModule(isMocking: false)
        let navigationController = UINavigationController(rootViewController: firstScreen)
        return navigationController
    }
}
