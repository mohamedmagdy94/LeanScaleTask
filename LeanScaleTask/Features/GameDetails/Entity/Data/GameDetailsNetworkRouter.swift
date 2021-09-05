//
//  GameDetailsNetworkRouter.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

enum GameDetailsNetworkRouter: NetworkRoutering {
    case getGameDetails(request: GameDetailsRequest)
    
    private var method: HTTPHelper.HTTPMethod {
        switch self {
        case .getGameDetails: return .get
        }
    }
    
    private var encoding: HTTPHelper.HTTPEncoding{
        switch self {
        case .getGameDetails:
            return .body
        }
    }
    
    
    private var path: String {
        switch self {
        case .getGameDetails(let requestBody):
            return "games/\(requestBody.id)"
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
        case .getGameDetails:
            return request
        
        }
    }
    
    private func buildURLFromQueryItems()->URL?{
        switch self {
        case .getGameDetails(let request):
            let urlString = "\(APIConfig.BASE_URL.rawValue)\(path)"
            var urlComponents = URLComponents(string: urlString)
            guard let items = request.dictionary else{ return urlComponents?.url }
            let queryItems = items.map{ URLQueryItem(name: $0.key, value: "\($0.value)") }
            urlComponents?.queryItems = queryItems
            return urlComponents?.url
        }
    }
    
}
