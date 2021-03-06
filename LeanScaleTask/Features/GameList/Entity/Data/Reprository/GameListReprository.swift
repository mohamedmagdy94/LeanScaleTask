//
//  GameListReprository.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

protocol GameListReprositoryProtocol {
    func fetchAll(with request: GameListRequest,onFetch: @escaping (Result<Page<Game>,HTTPHelper.NetworkError>)->Void)
}

class GameListReprository: GameListReprositoryProtocol{
    
    private var remoteReprository: GameRemoteReprository
    private var gameListLocalReprository: GameListLocalReprository
    
    init() {
        self.remoteReprository = GameRemoteReprository()
        self.gameListLocalReprository = GameListLocalReprository()
    }
    
    func fetchAll(with request: GameListRequest,onFetch: @escaping (Result<Page<Game>,HTTPHelper.NetworkError>)->Void){
        
        let isFirstPage = request.page == 1
        let isNotSearch = request.search == nil
        
        if isFirstPage && isNotSearch{
            if let cachedGames = gameListLocalReprository.fetchAll(){
                let cachedPage = Page(data: cachedGames, isRemote: false, hasMore: false)
                onFetch(.success(cachedPage))
            }
        }
        
        remoteReprository.fetchAll(with: request) {[weak self] result in
            switch result{
            case .success(let data):
                let page = Page(data: data.results ?? [Game](), isRemote: true, hasMore: data.next != nil)
                onFetch(.success(page))
                if isFirstPage && isNotSearch{
                    self?.gameListLocalReprository.save(models: data.results ?? [Game]())
                }
            case .failure(let error):
                onFetch(.failure(error))
            }
        }
    }
    
    
}
