//
//  SettingsView.swift
//  Necromancer.fm
//
//  Created by Kevin Bonilla on 2/26/26.
//

import SwiftUI

struct SettingsView: View {
    @State var isSpotifyLinked: Bool = false;
    @State var isAppleMusicLinked: Bool = false;
    @State var isLastfmLinked: Bool = false;
    
    var body: some View {
        List {
            Section(header: Text("General")) {
                
            }
            
            Section(header: Text("Accounts")) {
                // TODO: prob need to change the images for when an account is linked vs unlinked
                // TODO: make some functionality here to link accounts when clicked
                
                Label(isSpotifyLinked ? "Spotify Account" : "Link Spotify", systemImage: "arrow.2.circlepath.circle")
                
                Label(isLastfmLinked ? "Last.fm Account" : "Link Last.fm", systemImage: "arrow.2.circlepath.circle")
                
                Label(isAppleMusicLinked ? "Apple Music Account" : "Link Apple Music", systemImage: "arrow.2.circlepath.circle")
            }
            
            Section("About") {
                Label("Version", systemImage: "info.circle")
            }
        }
    }
}

#Preview {
    SettingsView()
}
