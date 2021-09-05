//
//  GameDetailsInteractor.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

class GameDetailsInteractor: GameDetailsInteractorProtocol {
    
    private var gameReprository: GameReprositoryProtocol
    private var favouriteGamesReprository: FavouriteGameReprositoryProtcol
    var presenter: GameDetailsPresenterOutputProtocol?
    var game: Game
    var gameDetails: GameDetailsResponse?

    init(gameReprository: GameReprositoryProtocol, favouriteGamesReprository: FavouriteGameReprositoryProtcol, presenter: GameDetailsPresenterOutputProtocol? = nil,game: Game) {
        self.gameReprository = gameReprository
        self.favouriteGamesReprository = favouriteGamesReprository
        self.presenter = presenter
        self.game = game
    }
    
    func getGameDetails() {
        let request = GameDetailsRequest(id: "\(game.id ?? 0)", key: APIConfig.KEY.rawValue)
        gameReprository.fetch(with: request) {[weak self] result in
            switch result{
            case .success(let response):
                self?.gameDetails = response
                self?.presenter?.onGameDetailsFetched(result: .success(response))
            case .failure:
                self?.presenter?.onGameDetailsFetched(result: .failure(.SERVER_ERROR))
            }
        }
    }
    
    func makeItemFavourite() {
        favouriteGamesReprository.save(game: game)
    }
    
    
}
