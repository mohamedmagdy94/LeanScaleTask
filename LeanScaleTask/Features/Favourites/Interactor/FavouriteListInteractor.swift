//
//  FavouriteListInteractor.swift.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 06/09/2021.
//

import Foundation

class FavouriteListInteractor : FavouriteListInteractorProtocol{
   
    var presenter: FavouriteListPresenterOutputProtocol?
    private var reprository: FavouriteGameReprository
    
    init(presenter: FavouriteListPresenterOutputProtocol? = nil, reprository: FavouriteGameReprository) {
        self.presenter = presenter
        self.reprository = reprository
    }
    
    func getFavouriteList() {
        let favourites = reprository.getAll()
        presenter?.onFavouriteListFetched(result: favourites)
    }
    
    func makeItemUnfavourite(game: Game) {
        reprository.delete(game: game)
    }
    
    
}
