//
//  GameDetailsPresenter.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

class GameDetailsPresenter: GameDetailsPresenterProtocol{
    
    var describtionLinesNumber: Int
    var isDescribtionExpanded: Bool
    var interactor: GameDetailsInteractorProtocol?
    var view: GameDetailsViewProtocol?
    private var gameDetailsResponse: GameDetailsResponse?

    init(interactor: GameDetailsInteractorProtocol? = nil, view: GameDetailsViewProtocol? = nil) {
        self.describtionLinesNumber = 3
        self.isDescribtionExpanded = false
        self.interactor = interactor
        self.view = view
    }
    
    func onScreenAppeared() {
        interactor?.getGameDetails()
        view?.showLoading()
    }
    
    func toggleRead() {
        isDescribtionExpanded = !isDescribtionExpanded
        describtionLinesNumber = isDescribtionExpanded ? 0 : 3
        view?.toggleDescription()
    }
    
    func onFavouriteItemRequest() {
        interactor?.makeItemFavourite()
    }
    
    func openWebsite() {
        guard let gameDetails = gameDetailsResponse,let websiteURL = gameDetails.metacritic_url else{ return }
        view?.openURL(url: websiteURL)
    }
    
    func openReddit() {
        guard let gameDetails = gameDetailsResponse,let redditURL = gameDetails.reddit_url else{ return }
        view?.openURL(url: redditURL)
    }
    
    func onGameDetailsFetched(result: Result<GameDetailsResponse, GameListError>) {
        view?.hideLoading()
        switch result {
        case .success(let response):
            self.gameDetailsResponse = response
            let viewModel = GameDetailsViewModel(imageURL: response.background_image ?? "", gameName: response.name ?? "", gameDescription: response.description_raw ?? "")
            self.view?.reloadData(viewModel: viewModel)
        case .failure:
            view?.showError(message: "Server Error")
        }
    }
    
    
}
