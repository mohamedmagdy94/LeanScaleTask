//
//  GameDetailsProtocol.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

protocol GameDetailsPresenterInputProtocol{
    var describtionLinesNumber:Int { get }
    var isDescribtionExpanded:Bool { get }
    func onScreenAppeared()
    func onFavouriteItemRequest()
    func openWebsite()
    func openReddit()
    func toggleRead()
}

protocol GameDetailsPresenterOutputProtocol{
    func onGameDetailsFetched(result: Result<GameDetailsResponse,GameListError>)
}

typealias GameDetailsPresenterProtocol = GameDetailsPresenterInputProtocol & GameDetailsPresenterOutputProtocol

protocol GameDetailsInteractorProtocol {
    func getGameDetails()
    func makeItemFavourite()
}

protocol GameDetailsViewProtocol {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func reloadData(viewModel: GameDetailsViewModel)
    func openURL(url: String)
    func toggleDescription()
}
