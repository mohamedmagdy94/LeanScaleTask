//
//  GameListRequest.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import Foundation

struct GameListRequest: Codable{
    var page_size: Int
    var page: Int
    var key: String
    var search: String?
}
