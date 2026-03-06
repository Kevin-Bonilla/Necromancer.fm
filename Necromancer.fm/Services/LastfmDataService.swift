//
//  LastfmDataService.swift
//  Necromancer.fm
//
// service where we are going to call the Lastfm API to get the users artist info.
//
//  Created by Kevin Bonilla on 3/2/26.
//

import Foundation

struct LastfmDataService {
    private let lastfmAPIKey: String
    private let lastfmAPIurl: String = "https://ws.audioscrobbler.com/2.0/"
    
    init(lastfmAPIKey: String = Secrets.lastfmAPIKey) {
        // init api key on creation
        self.lastfmAPIKey = lastfmAPIKey
    }
    
    func getUsersArtistInfo() async throws {
        // build url for our api request
        var urlComponents = URLComponents(string: lastfmAPIurl)!
        urlComponents.queryItems = [
            URLQueryItem(name: "method", value: "user.gettopartists"),
            URLQueryItem(name: "user", value: "x762-"), // TODO: unhardcode this user later
            URLQueryItem(name: "api_key", value: lastfmAPIKey),
            URLQueryItem(name: "format", value: "json")
        ]
            
        guard let url = urlComponents.url else {
            throw NetworkError.badURL
        }
        
        // requesting data
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // throwing error when bad response
        if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
            throw NetworkError.requestFailed(http.statusCode)
        }
        // TODO: decode `data` into your expected model type
        
        // TODO: delete this later was just using for testing purposes to see the json
        let rawJson = String(data: data, encoding: .utf8)
        print(rawJson)
    }
}

