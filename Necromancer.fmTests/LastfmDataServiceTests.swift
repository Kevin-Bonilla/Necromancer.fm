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

    @Test("getUsersArtistInfo runs without throwing")
    func testGetUsersArtistInfo() async throws {
        // Initialize the service on the main actor. If the initializer requires an API key, provide a test key or empty string.
        let lastfmDataService = LastfmDataService()
        
        // calling getUsersArtistInfo and asserting our results
        let result = try await lastfmDataService.getUsersArtistInfo()

        // Assert the static type is [Artist]
        #expect(type(of: result) == [Artist].self)
        // Assert we received at least one artist
        #expect(!result.isEmpty)
    }

}
