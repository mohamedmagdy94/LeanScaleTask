//
//  GameListProtocol.swift
//  LeanScaleTaskDev
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

protocol GameListPresenterInputProtocol{
    func onScreenAppeared()
    var cellsCount:Int { get }
    var cells: [GameListCellViewModel]{get}
    func onSearchRequested(query: String)
    func onGameSelected(index: Int)
    func getNextPage()
}

protocol GameListPresenterOutputProtocol{
    func onGamesFetched(result: Result<Page<Game>,GameListError>)
    func updateGame(game: Game)
}

typealias GameListPresenterProtocol = GameListPresenterInputProtocol & GameListPresenterOutputProtocol

protocol GameListInteractorProtocol {
    func getGames(pageNumber: Int)
    func onGameOpened(game: Game)
    func searchForGames(query: String,pageNumber: Int)
}

protocol GameListNavigationRouterProtocol {
    func showGameDetails(with game: Game)
}

protocol GameListViewProtocol {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func reloadList()
    func focusOnItem(with index: Int)
}
