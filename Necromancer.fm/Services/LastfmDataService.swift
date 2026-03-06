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
    // TODO: unhardcode this later
    private let lastfmUsername: String = "x762-"
    
    init(lastfmAPIKey: String = Secrets.lastfmAPIKey) {
        // init api key on creation
        self.lastfmAPIKey = lastfmAPIKey
        
        // TODO: add an init that gets user's lastfm username and stores it
    }
    
    func getUsersTopArtistInfo() async throws -> [Artist] {
        // build url for our api request
        var urlComponents = URLComponents(string: lastfmAPIurl)!
        
        // updating queryItems with relevent info for API call
        urlComponents.queryItems = [
            URLQueryItem(name: "method", value: "user.gettopartists"),
            URLQueryItem(name: "user", value: lastfmUsername),
            URLQueryItem(name: "period", value: "overall"),
            URLQueryItem(name: "api_key", value: lastfmAPIKey),
            URLQueryItem(name: "format", value: "json")
        ]
        
        // checks if valid url, if not throw error
        guard let url = urlComponents.url else {
            throw NetworkError.badURL
        }
        
        // requesting data
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // throwing error when bad response
        if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
            throw NetworkError.requestFailed(http.statusCode)
        }
        
        // decoding data from our request, if not throw decoding error
        do{
            let topArtistsResponse = try JSONDecoder().decode(TopArtistsResponse.self, from: data)
            let artists = topArtistsResponse.topartists.artist
            return artists
        } catch {
            throw NetworkError.decodingFailed(error)
        }
    }
    
    func getUsersLibraryArtistInfo() async throws -> [Artist] {
        // build url for our api request
        var urlComponents = URLComponents(string: lastfmAPIurl)!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "method", value: "library.getartists"),
            URLQueryItem(name: "user", value: lastfmUsername),
            URLQueryItem(name: "api_key", value: lastfmAPIKey),
            URLQueryItem(name: "format", value: "json")
        ]
            
        // checks if valid url, if not throw error
        guard let url = urlComponents.url else {
            throw NetworkError.badURL
        }
        
        // requesting data
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // throwing error when bad response
        if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
            throw NetworkError.requestFailed(http.statusCode)
        }
        
        // decoding data from our request, if not throw decoding error
        do{
            let libraryArtistsResponse = try JSONDecoder().decode(LibraryArtistsResponse.self, from: data)
            let artists = libraryArtistsResponse.artists.artist
            return artists
        } catch {
            throw NetworkError.decodingFailed(error)
        }
    }
}

