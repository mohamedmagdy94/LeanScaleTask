//
//  GameListLocalReprository.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

class GameListLocalReprository{
    
    private var jsonEncoder = JSONEncoder()
    private var jsonDecoder = JSONDecoder()
    private var userDefaultsService = UserDefaults.standard
    
    func save(models: [Game]){
        guard let modelsEncoded = try? jsonEncoder.encode(models) else{ return }
        userDefaultsService.setValue(modelsEncoded, forKey: LocalStorageKey.CACHED_MOVIES.rawValue)
    }
    
    func fetchAll()->[Game]?{
        guard let cachedMoviesEncoded = userDefaultsService.data(forKey: LocalStorageKey.CACHED_MOVIES.rawValue) else{ return nil }
        let cachedMoviesDecoded = try? jsonDecoder.decode([Game].self, from: cachedMoviesEncoded)
        return cachedMoviesDecoded
        
    }
    
}
