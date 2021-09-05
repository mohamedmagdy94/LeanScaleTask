//
//  FavouriteListConfigurator.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 06/09/2021.
//

import Foundation

struct FavouriteListConfigurator {
    
    var view: FavouriteListViewController
    var isMocking: Bool
    
    init(view: FavouriteListViewController,isMocking: Bool = false) {
        self.view = view
        self.isMocking = isMocking
    }
    
    func configModule() -> FavouriteListViewController {
        let interactor = FavouriteListInteractor(presenter: nil, reprository: FavouriteGameReprository())
        let router = FavouriteListNavigationRouter(screen: view)
        let presenter = FavouriteListPresenter(interactor: interactor, router: router, view: view)
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
}
