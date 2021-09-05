//
//  GameDetailsConfigurator.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

struct GameDetailsConfigurator {
    
    var view: GameDetailsViewController
    var isMocking: Bool
    var game: Game
    
    init(game: Game,view: GameDetailsViewController,isMocking: Bool = false) {
        self.view = view
        self.isMocking = isMocking
        self.game = game
    }
    
    func configModule() -> GameDetailsViewController {
        let interactor = GameDetailsInteractor(gameReprository: GameReprository(), favouriteGamesReprository: FavouriteGameReprository(), game: game)
        let presenter = GameDetailsPresenter(interactor: interactor, view: view)
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
}
