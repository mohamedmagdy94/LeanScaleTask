//
//  NetworkManager.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let config: URLSessionConfiguration
    private let session: URLSession
    
    private init() {
        config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    func request<T: Decodable>(router: NetworkRoutering, completion: @escaping (HTTPHelper.Result<T>) -> ()) {
        do {
            let task = try session.dataTask(with: router.request()) { (data, urlResponse, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        completion(HTTPHelper.Result<T>.failure(error: error))
                        return
                    }
                    
                    guard let statusCode = urlResponse?.getStatusCode(), (200...299).contains(statusCode) else {
                        let errorType: HTTPHelper.NetworkError
                        
                        switch urlResponse?.getStatusCode() {
                        case 404:
                            errorType = .notFound
                        case 422:
                            errorType = .validationError
                        case 500:
                            errorType = .serverError
                        default:
                            errorType = .defaultError
                        }
                        
                        completion(HTTPHelper.Result<T>.failure(error: errorType))
                        return
                    }
                    
                    guard let data = data else {
                        completion(HTTPHelper.Result<T>.failure(error: HTTPHelper.NetworkError.defaultError))
                        return
                    }
                    
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        completion(HTTPHelper.Result.success(data: result))
                    } catch let error {
                        completion(HTTPHelper.Result.failure(error: error))
                    }
                }
            }
            task.resume()
            
        } catch let error {
            completion(HTTPHelper.Result<T>.failure(error: error))
        }
    }
}

extension URLResponse {
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
