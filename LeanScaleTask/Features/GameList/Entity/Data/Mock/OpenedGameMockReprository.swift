//
//  OpenedGameMockReprository.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

class OpenedGameMockReprository: OpenedGameReprositoryProtocol{
    
    static var openedIds = [3498,5679,4062]
    
    func save(game: Game) {
        OpenedGameMockReprository.openedIds.append(game.id ?? 0)
    }
    
    func getAll() -> [Game] {
        guard let url = Bundle.main.url(forResource: "GameListMockResponse", withExtension: "json"),let data = try? Data(contentsOf: url) else{
            return [Game]()
        }
        let jsonDecoder = JSONDecoder()
        guard let responseDecoded = try? jsonDecoder.decode(GameListResponse.self, from: data) else{
            return [Game]()
        }
        let games = responseDecoded.results?.filter{ OpenedGameMockReprository.openedIds.contains($0.id ?? 0) }
        return games ?? [Game]()
    }
    
    
}
