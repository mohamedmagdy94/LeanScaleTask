//
//  GameListNetworkRouter.swift
//  LeanScaleTaskDev
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import Foundation

enum GameListNetworkRouter: NetworkRoutering {
    case getGames(request: GameListRequest)
    
    private var method: HTTPHelper.HTTPMethod {
        switch self {
        case .getGames: return .get
        }
    }
    
    private var encoding: HTTPHelper.HTTPEncoding{
        switch self {
        case .getGames:
            return .query
        }
    }
    
    
    private var path: String {
        switch self {
        case .getGames:
            return "games"
        }
    }
    
    private var headers: [String: Any]{
        return [:]
    }
    
    func request() throws -> URLRequest {
        let urlString = "\(APIConfig.BASE_URL.rawValue)\(path)"
        
        var url: URL?
        
        switch encoding {
        case .body:
            guard let constructedURL = URL(string: urlString) else{  throw HTTPHelper.NetworkError.parseUrlFail }
            url = constructedURL
        case .query:
            guard let constructedURL = buildURLFromQueryItems() else{  throw HTTPHelper.NetworkError.parseUrlFail }
            url = constructedURL
            
        }
        guard let url = url else{  throw HTTPHelper.NetworkError.parseUrlFail }
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        request.httpMethod = method.value
        headers.forEach{ request.addValue("\($0.value)", forHTTPHeaderField: "\($0.key)") }
        
        switch self {
        case .getGames:
            return request
        
        }
    }
    
    private func buildURLFromQueryItems()->URL?{
        switch self {
        case .getGames(let request):
            let urlString = "\(APIConfig.BASE_URL.rawValue)\(path)"
            var urlComponents = URLComponents(string: urlString)
            guard let items = request.dictionary else{ return urlComponents?.url }
            let queryItems = items.map{ URLQueryItem(name: $0.key, value: "\($0.value)") }
            urlComponents?.queryItems = queryItems
            return urlComponents?.url
        }
    }
    
}
