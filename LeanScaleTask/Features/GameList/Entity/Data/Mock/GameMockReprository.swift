//
//  GameMockReprository.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

class GameMockReprository: GameListReprositoryProtocol{
    
    func fetchAll(with request: GameListRequest, onFetch: @escaping (Result<Page<Game>, HTTPHelper.NetworkError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "GameListMockResponse", withExtension: "json"),let data = try? Data(contentsOf: url) else{
            onFetch(.failure(.serverError))
            return
        }
        let jsonDecoder = JSONDecoder()
        guard let responseDecoded = try? jsonDecoder.decode(GameListResponse.self, from: data) else{
            onFetch(.failure(.serverError))
            return
        }
        let page = Page<Game>(data: responseDecoded.results ?? [Game](), isRemote: true, hasMore: true)
        onFetch(.success(page))
    }
    
    
}
