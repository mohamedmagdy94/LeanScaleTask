//
//  FavouriteListPresenter.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 06/09/2021.
//

import Foundation

class FavouriteListPresenter: FavouriteListPresenterProtocol {
    
    var interactor: FavouriteListInteractorProtocol?
    var router: FavouriteListRouterProtocol?
    var cellsCount: Int
    var cells: [GameListCellViewModel]
    var games: [Game]
    var itemToRemoveIndex: Int?
    
    init(interactor: FavouriteListInteractorProtocol? = nil, router: FavouriteListRouterProtocol? = nil) {
        self.interactor = interactor
        self.router = router
        self.cellsCount = 0
        self.cells = []
        self.games = []
    }
    
    
    func onScreenAppeared() {
        interactor?.getFavouriteList()
    }
    
    func onGameSelected(index: Int) {
        let game = games[index]
        router?.showGameDetails(game: game)
    }
    
    func onUnfavouriteGame(index: Int) {
        itemToRemoveIndex = index
    }
    
    func onDeleteConfirmed() {
        guard let index = itemToRemoveIndex else{ return }
        let game = games[index]
        interactor?.makeItemUnfavourite(game: game)
        interactor?.getFavouriteList()
    }
    
    func onDeleteCanceled() {
        itemToRemoveIndex = nil
    }
    
    func onFavouriteListFetched(result: [Game]) {
        games = result
        cells = result.map{[weak self] in GameListCellViewModel(imageURL: $0.background_image ?? "", title: $0.name ?? "", metacritic: "\($0.metacritic ?? 0)" , categories: "\(self?.convertGameCategoriesToString(with: $0.tags) ?? "")", color:.white) }
    }
    
    private func convertGameCategoriesToString(with tags: [Tag]?)->String{
        guard let tags = tags else{ return "" }
        let tag = tags.map{ $0.name ?? "" }.joined(separator: ", ")
        return tag
    }
}
