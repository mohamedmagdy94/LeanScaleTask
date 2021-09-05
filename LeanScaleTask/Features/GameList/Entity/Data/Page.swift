//
//  Page.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

struct Page<T>{
    var data: [T]
    var isRemote: Bool
    var hasMore: Bool
}
