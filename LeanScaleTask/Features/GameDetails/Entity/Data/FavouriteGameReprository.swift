//
//  FavouriteGameReprository.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

protocol FavouriteGameReprositoryProtcol {
    func save(game: Game)
    func getAll()->[Game]
    func delete(game: Game)
}

class FavouriteGameReprository: FavouriteGameReprositoryProtcol{
    private var jsonEncoder = JSONEncoder()
    private var jsonDecoder = JSONDecoder()
    private var userDefaultsService = UserDefaults.standard

    func save(game: Game){
        var favouriteGames = [Game]()
        if let favouriteGamesEncoded = userDefaultsService.data(forKey: LocalStorageKey.FAVOURITE_GAMES.rawValue){
            if let favouriteGamesDecoded = try? jsonDecoder.decode([Game].self, from: favouriteGamesEncoded){
                favouriteGames = favouriteGamesDecoded
            }
        }
        favouriteGames.append(game)
        guard let favouriteGamesDecoded = try? jsonEncoder.encode(favouriteGames) else{ return }
        userDefaultsService.setValue(favouriteGamesDecoded, forKey: LocalStorageKey.FAVOURITE_GAMES.rawValue)
    }
    
    func getAll()->[Game]{
        var favouriteGames = [Game]()
        guard let favouriteGamesEncoded = userDefaultsService.data(forKey: LocalStorageKey.FAVOURITE_GAMES.rawValue) else{ return favouriteGames }
        guard let favouriteGamesDecoded = try? jsonDecoder.decode([Game].self, from: favouriteGamesEncoded) else{ return favouriteGames }
        favouriteGames = favouriteGamesDecoded
        return favouriteGames
    }
    
    func delete(game: Game) {
        var favouriteGames = [Game]()
        if let favouriteGamesEncoded = userDefaultsService.data(forKey: LocalStorageKey.FAVOURITE_GAMES.rawValue){
            if let favouriteGamesDecoded = try? jsonDecoder.decode([Game].self, from: favouriteGamesEncoded){
                favouriteGames = favouriteGamesDecoded
            }
        }
        favouriteGames = favouriteGames.filter{ $0.id != game.id } 
        guard let favouriteGamesDecoded = try? jsonEncoder.encode(favouriteGames) else{ return }
        userDefaultsService.setValue(favouriteGamesDecoded, forKey: LocalStorageKey.FAVOURITE_GAMES.rawValue)
    }
    
}
