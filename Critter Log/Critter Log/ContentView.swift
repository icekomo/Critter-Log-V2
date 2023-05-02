//
//  ContentView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/9/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var launchScreenManger: LaunchScreenManager
    
    @StateObject var critterViewModel = CritterViewModel()
    
    var body: some View {

            NavigationStack {
                ZStack {
                    Color.white
                        .ignoresSafeArea()
                    
                    VStack(spacing: 0.0) {
                        
                        CritterView()
                            .environmentObject(critterViewModel)
                    }
                    .background(Constants.Colors.greenLight.color)
                }
            }
            .onAppear {
                DispatchQueue
                    .main
                    .asyncAfter(deadline: .now() + 3) {
                        launchScreenManger.dismiss()
                    }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CritterViewModel())
            .environmentObject(LaunchScreenManager())
    }
}
