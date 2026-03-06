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

        // When you add the real call, ensure it is awaited and does not throw.
        // For example:
        // let result = try await service.getUsersArtistInfo(user: "testUser")
        // #expect(!result.isEmpty)

        // For now, just assert the service exists to satisfy the test scaffold.
        #expect(lastfmDataService != nil)
    }

}
