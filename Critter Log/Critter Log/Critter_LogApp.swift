//
//  Critter_LogApp.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/9/23.
//

import SwiftUI

@main
struct Critter_LogApp: App {
    @StateObject var launchScreenManager = LaunchScreenManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                
                if launchScreenManager.state != .completed {
                    LaunchScreenView()
                }
            }
            .environmentObject(launchScreenManager)
           
        }
    }
}
