//
//  GameListConfigurator.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

struct GameListConfigurator {
    
    var view: GameListViewController
    var isMocking: Bool
    
    init(view: GameListViewController,isMocking: Bool = false) {
        self.view = view
        self.isMocking = isMocking
    }
    
    func configModule() -> GameListViewController {
        let gameReprository: GameListReprositoryProtocol = isMocking ? GameMockReprository() : GameListReprository()
        let openedGameReprository: OpenedGameReprositoryProtocol = isMocking ? OpenedGameMockReprository() : OpenedGameReprository()
        let interactor = GameListInteractor(gameReprository: gameReprository, openedGameReprository: openedGameReprository, presenter: nil)
        let router = GameListNavigationRouter(screen: view)
        let presenter = GameListPresenter(interactor: interactor, view: view, router: router)
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
}
