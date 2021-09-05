//
//  GameListPresenter.swift
//  LeanScaleTaskDev
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

class GameListPresenter: GameListPresenterProtocol{
    
    var interactor: GameListInteractorProtocol?
    var router: GameListNavigationRouterProtocol?
    var view: GameListViewProtocol?
    var cells: [GameListCellViewModel]
    var cellsCount: Int
    private var pageSize: Int
    private var pageNumber: Int
    private var searchQuery: String?
    private var openedGames: [Game]
    private var page: Page<Game>?
    
    init(interactor: GameListInteractorProtocol? = nil, view: GameListViewProtocol? = nil,router: GameListNavigationRouterProtocol? = nil) {
        self.interactor = interactor
        self.view = view
        self.router = router
        self.cells = []
        self.cellsCount = 0
        self.pageSize = 10
        self.pageNumber = 1
        self.page = nil
        self.openedGames = []
    }
    
    func onScreenAppeared() {
        interactor?.getGames(pageNumber: 1)
    }
    
    func getNextPage() {
        guard let page = page else{ return }
        if page.hasMore{
            pageNumber += 1
            view?.showLoading()
            guard let query = searchQuery else{
                interactor?.getGames(pageNumber: pageNumber)
                return
            }
            interactor?.searchForGames(query: query, pageNumber: pageNumber)
        }else{
            view?.showError(message: "No More Items Available")
        }
    }
    
    func onSearchRequested(query: String) {
        if query == ""{
            pageNumber = 1
            cells = []
            searchQuery = nil
            page = nil
            interactor?.getGames(pageNumber: pageNumber)
        }else if query.count > 3{
            pageNumber = 1
            searchQuery = query
            page = nil
            interactor?.searchForGames(query: query, pageNumber: pageNumber)
        }
    }
    
    func onGameSelected(index: Int) {
        guard let page = page else{ return }
        let selectedGame = page.data[index]
        interactor?.onGameOpened(game: selectedGame)
        router?.showGames(with: selectedGame)
    }
    
    func onOpenedGamesFetched(games: [Game]) {
        self.openedGames = games
        view?.reloadList()
    }
    
    func onGamesFetched(result: Result<Page<Game>, GameListError>) {
        switch result {
        case .success(let result):
            handleFetchGamesSuccess(with: result)
        case .failure(let error):
            handleFetchGamesError(with: error)
        }
    }
    
    private func handleFetchGamesSuccess(with result: Page<Game>){
        guard let page = page else{
            self.page = result
            view?.reloadList()
            return
        }
        var fetchedGames = result
        let lastItemIndex = page.data.count
        fetchedGames.data = page.data + fetchedGames.data
        view?.focusOnItem(with: lastItemIndex)
        
    }
    
    private func handleFetchGamesError(with error: GameListError){
        switch error {
        case .SERVER_ERROR:
            view?.showError(message: "Server Error")
        case .WRONG_SEARCH_QUERY:
            break
        }
    }
}
