//
//  FavouriteListProtocol.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

protocol FavouriteListPresenterInputProtocol{
    func onScreenAppeared()
    func onGameSelected(index: Int)
    func onUnfavouriteGame(index: Int)
    func onDeleteConfirmed()
    var cellsCount: Int{ get }
    var cells: [GameListCellViewModel]{get}
}

protocol FavouriteListPresenterOutputProtocol{
    func onFavouriteListFetched(result:[Game])
}

typealias FavouriteListPresenterProtocol =  FavouriteListPresenterInputProtocol &  FavouriteListPresenterOutputProtocol

protocol FavouriteListInteractorProtocol {
    func getFavouriteList()
    func makeItemUnfavourite(game: Game)
}

protocol FavouriteListViewProtocol {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func reloadItems()
    func confirmDelete()
}

protocol FavouriteListRouterProtocol {
    func showGameDetails(game: Game)
}
