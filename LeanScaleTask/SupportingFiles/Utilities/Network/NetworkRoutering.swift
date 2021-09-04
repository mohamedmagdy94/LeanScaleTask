//
//  NetworkRoutering.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import Foundation

protocol NetworkRoutering{
    func request() throws -> URLRequest
}
