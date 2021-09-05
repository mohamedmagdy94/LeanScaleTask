//
//  GameReprository.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

protocol GameReprositoryProtocol {
    func fetch(with request: GameDetailsRequest,onFetch: @escaping (Result<GameDetailsResponse,HTTPHelper.NetworkError>)->Void)
}

class GameReprository: GameReprositoryProtocol{
 
    func fetch(with request: GameDetailsRequest,onFetch: @escaping (Result<GameDetailsResponse,HTTPHelper.NetworkError>)->Void){
        let request = GameDetailsNetworkRouter.getGameDetails(request: request)
        NetworkManager.shared.request(router: request) { (result: HTTPHelper.Result<GameDetailsResponse>) in
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
