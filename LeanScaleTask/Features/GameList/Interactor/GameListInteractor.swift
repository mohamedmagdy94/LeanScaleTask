//
//  GameListInteractor.swift
//  LeanScaleTaskDev
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

class GameListInteractor:GameListInteractorProtocol{
    
    private var gameReprository: GameListReprositoryProtocol
    private var openedGameReprository: OpenedGameReprositoryProtocol
    var presenter: GameListPresenterOutputProtocol?
    
    init(gameReprository: GameListReprositoryProtocol, openedGameReprository: OpenedGameReprositoryProtocol, presenter: GameListPresenterOutputProtocol?) {
        self.gameReprository = gameReprository
        self.openedGameReprository = openedGameReprository
        self.presenter = presenter
    }
    
    func getGames(pageNumber: Int) {
        let request = GameListRequest(page_size: 10, page: pageNumber, key: APIConfig.KEY.rawValue, search: nil)
        fetchGames(with: request)
    }
    
    private func fetchGames(with request: GameListRequest){
        gameReprository.fetchAll(with: request) {[weak self] result in
            switch result{
            case .success(let result):
                self?.handleResponse(with: result)
                break
            case .failure:
                self?.presenter?.onGamesFetched(result: .failure(.SERVER_ERROR))
            }
        }
    }
    
    private func handleResponse(with result: Page<Game>){
        var fetchedResult = result
        let openedGames = openedGameReprository.getAll()
        fetchedResult.data = fetchedResult.data.map{ (game) in
            var gameAfterUpdateStatus = game
            gameAfterUpdateStatus.isOpened = openedGames.contains{ $0.id == game.id }
            return gameAfterUpdateStatus
        }
        presenter?.onGamesFetched(result: .success(fetchedResult))
    }
    
    func onGameOpened(game: Game) {
        openedGameReprository.save(game: game)
    }
    
    func searchForGames(query: String, pageNumber: Int) {
        let request = GameListRequest(page_size: 10, page: pageNumber, key: APIConfig.KEY.rawValue, search: query)
        fetchGames(with: request)
    }
    
    
}
