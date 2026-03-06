//
//  LastfmArtistModels.swift
//  Necromancer.fm
//
//  Created by Kevin Bonilla on 3/6/26.
//

import Foundation

struct TopArtistsResponse: Decodable {
    let topartists: TopArtists
}

struct TopArtists: Decodable {
    let artist: [Artist]
    let attr: TopArtistsAttributes

    private enum CodingKeys: String, CodingKey {
        case artist
        case attr = "@attr"
    }
}

struct TopArtistsAttributes: Decodable {
    let user: String
    let totalPages: String
    let page: String
    let perPage: String
    let total: String
}

struct Artist: Decodable {
    let name: String
    let playcount: String
    let url: String
    let image: [ArtistImage]
}

struct ArtistImage: Decodable {
    let text: String
    let size: String

    private enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}
