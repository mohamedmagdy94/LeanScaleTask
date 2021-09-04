//
//  HTTPHelpers.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import Foundation

enum HTTPHelper{
    
    enum HTTPMethod {
        case get
        case post
        case put
        case delete
        
        var value: String {
            switch self {
            case .get: return "GET"
            case .post: return "POST"
            case .put: return "PUT"
            case .delete: return "DELETE"
            }
        }
    }
    
    enum HTTPEncoding{
        case body
        case query
    }
    
    enum NetworkError: Error {
        case parseUrlFail
        case notFound
        case validationError
        case serverError
        case defaultError
        
        var errorDescription: String? {
            switch self {
            case .parseUrlFail:
                return "Cannot initial URL object."
            case .notFound:
                return "Not Found"
            case .validationError:
                return "Validation Errors"
            case .serverError:
                return "Internal Server Error"
            case .defaultError:
                return "Something went wrong."
            }
        }
    }
    
    enum Result<T> {
        case success(data: T)
        case failure(error: Error)
    }
    
}

