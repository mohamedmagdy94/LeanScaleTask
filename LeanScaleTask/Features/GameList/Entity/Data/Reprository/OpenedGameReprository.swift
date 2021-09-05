//
//  OpenedGameReprository.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

class OpenedGameReprository{
    private var jsonEncoder = JSONEncoder()
    private var jsonDecoder = JSONDecoder()
    private var userDefaultsService = UserDefaults.standard

    func save(game: Game){
        var openedMovies = [Game]()
        if let openedMoviesEncoded = userDefaultsService.data(forKey: LocalStorageKey.OPENED_MOVIES.rawValue){
            if let openedMoviesDecoded = try? jsonDecoder.decode([Game].self, from: openedMoviesEncoded){
                openedMovies = openedMoviesDecoded
            }
        }
        openedMovies.append(game)
        guard let openedMoviesDecoded = try? jsonEncoder.encode(openedMovies) else{ return }
        userDefaultsService.setValue(openedMoviesDecoded, forKey: LocalStorageKey.OPENED_MOVIES.rawValue)
    }
    
    func getAll()->[Game]{
        var openedMovies = [Game]()
        guard let openedMoviesEncoded = userDefaultsService.data(forKey: LocalStorageKey.OPENED_MOVIES.rawValue) else{ return openedMovies }
        guard let openedMoviesDecoded = try? jsonDecoder.decode([Game].self, from: openedMoviesEncoded) else{ return openedMovies }
        openedMovies = openedMoviesDecoded
        return openedMovies
        
    }
}
