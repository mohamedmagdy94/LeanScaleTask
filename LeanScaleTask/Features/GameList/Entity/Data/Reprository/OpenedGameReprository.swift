//
//  OpenedGameReprository.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

protocol OpenedGameReprositoryProtocol {
    func save(game: Game)
    func getAll()->[Game]
}

class OpenedGameReprository: OpenedGameReprositoryProtocol{
    private var jsonEncoder = JSONEncoder()
    private var jsonDecoder = JSONDecoder()
    private var userDefaultsService = UserDefaults.standard

    func save(game: Game){
        var openedGames = [Game]()
        if let openedGamesEncoded = userDefaultsService.data(forKey: LocalStorageKey.OPENED_GAMES.rawValue){
            if let openedGamesDecoded = try? jsonDecoder.decode([Game].self, from: openedGamesEncoded){
                openedGames = openedGamesDecoded
            }
        }
        openedGames.append(game)
        guard let openedGamesDecoded = try? jsonEncoder.encode(openedGames) else{ return }
        userDefaultsService.setValue(openedGamesDecoded, forKey: LocalStorageKey.OPENED_GAMES.rawValue)
    }
    
    func getAll()->[Game]{
        var openedGames = [Game]()
        guard let openedGamesEncoded = userDefaultsService.data(forKey: LocalStorageKey.OPENED_GAMES.rawValue) else{ return openedGames }
        guard let openedGamesDecoded = try? jsonDecoder.decode([Game].self, from: openedGamesEncoded) else{ return openedGames }
        openedGames = openedGamesDecoded
        return openedGames
        
    }
}
