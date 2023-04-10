//
//  ContentView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/9/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var critterData = CritterData()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.red
                    .ignoresSafeArea()
                
                VStack(spacing: 0.0) {
                    WelcomeView().environmentObject(critterData)
                }
                .padding()
                .background(Constants.Colors.grayLight.color)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
