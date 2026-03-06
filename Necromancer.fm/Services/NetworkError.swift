//
//  NetworkError.swift
//  Necromancer.fm
//
//  Shared network error definitions used across services.
//
//  Created by Kevin Bonilla on 3/6/26.
//

import Foundation

public enum NetworkError: Error {
    case badURL
    case requestFailed(Int)
    case decodingFailed(Error)
}
