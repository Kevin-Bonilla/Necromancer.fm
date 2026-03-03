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
    
    init(lastfmAPIKey: String = Secrets.lastfmAPIKey) {
        // init api key on creation
        self.lastfmAPIKey = lastfmAPIKey
    }
    
    func getUsersArtistInfo(){
        
    }
}
