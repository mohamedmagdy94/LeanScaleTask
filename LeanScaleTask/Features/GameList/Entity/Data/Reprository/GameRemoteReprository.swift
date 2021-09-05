//
//  GameRemoteReprository.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import Foundation

protocol GameRemoteReprositoryProtocol {
    func fetchAll(with request: GameListRequest,onFetch: @escaping (Result<GameListResponse,HTTPHelper.NetworkError>)->Void)
}


class GameRemoteReprository: GameRemoteReprositoryProtocol {
    
    func fetchAll(with request: GameListRequest,onFetch: @escaping (Result<GameListResponse,HTTPHelper.NetworkError>)->Void){
        let request = GameListNetworkRouter.getGames(request: request)
        NetworkManager.shared.request(router: request) { (result: HTTPHelper.Result<GameListResponse>) in
            switch result{
            case .success(let data):
                onFetch(.success(data))
            case .failure(let error):
                let networkError = error as? HTTPHelper.NetworkError ?? HTTPHelper.NetworkError.serverError
                onFetch(.failure(networkError))
            }
        }
    }
    
}
