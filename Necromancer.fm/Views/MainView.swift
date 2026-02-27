//
//  MainView.swift
//  Necromancer.fm
//
//  Created by Kevin Bonilla on 2/26/26.
//

import SwiftUI

struct MainView: View {
    @State private var showingSettings = false

    var body: some View {
        VStack(spacing: 0) {
            // Top banner
            HStack {
                // settings button
                Button {
                    // boolean that makes the settings show up
                    showingSettings = true
                } label: {
                    Image(systemName: "gearshape")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(.ultraThinMaterial, in: Circle())
                }
                .accessibilityLabel("Settings")

                Spacer()

                // TODO: maybe change this name out for a logo or style it somehow
                // app name in header
                Text("Necromancer.fm")
                    .font(.headline)
                    .foregroundStyle(.white)

                Spacer()

                // Right-side placeholder if you want symmetry or another button
                Color.clear
                    .frame(width: 34, height: 34) // matches the size of the settings button
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(
                LinearGradient(
                    colors: [Color.indigo, Color.black.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )

            // Main content
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea(edges: .bottom)

                Text("Main content")
            }
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView()
        }
    }
}

#Preview {
    MainView()
}
