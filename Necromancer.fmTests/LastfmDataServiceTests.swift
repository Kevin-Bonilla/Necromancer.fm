//
//  LastfmDataServiceTests.swift
//  Necromancer.fmTests
//
//  Created by Kevin Bonilla on 3/6/26.
//

import Testing
@testable import Necromancer_fm

@MainActor
struct LastfmDataServiceTests {

    @Test("getUsersTopArtistInfo runs without throwing")
    func testGetUsersTopArtistInfo() async throws {
        // Initialize the service on the main actor. If the initializer requires an API key, provide a test key or empty string.
        let lastfmDataService = LastfmDataService()
        
        // calling getUsersArtistInfo and asserting our results
        let result = try await lastfmDataService.getUsersTopArtistInfo()

        // Assert the static type is [Artist]
        #expect(type(of: result) == [Artist].self)
        // Assert we received at least one artist
        #expect(!result.isEmpty)
    }
    
    @Test("getUsersLibraryArtistInfo runs without throwing")
    func testGetUsersLibraryArtistInfo() async throws {
        // Initialize the service on the main actor. If the initializer requires an API key, provide a test key or empty string.
        let lastfmDataService = LastfmDataService()
        
        // calling getUsersArtistInfo and asserting our results
        let result = try await lastfmDataService.getUsersLibraryArtistInfo()

        // Assert the static type is [Artist]
        #expect(type(of: result) == [Artist].self)
        // Assert we received at least one artist
        #expect(!result.isEmpty)
    }

}
