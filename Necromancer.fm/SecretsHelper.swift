//
//  SecretsHelper.swift
//  Necromancer.fm
//
//  Created by Kevin Bonilla on 3/2/26.
//

import Foundation

// we use an enum here like a namespace
// it cannot be instantiated so it can't be created accidentally
enum Secrets {
    static var lastfmAPIKey: String {
        // guard here only continues if assertion is true
        guard let key = Bundle.main.object(forInfoDictionaryKey: "LASTFM_API_KEY") as? String,
              key.isEmpty == false else {
            assertionFailure("LASTFM_API_KEY not found. Did you add it to Info and apply Secrets.xcconfig?")
            return ""
        }
        return key
    }
}
