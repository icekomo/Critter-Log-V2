//
//  ContentView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/9/23.
//

import SwiftUI

struct ContentView: View {

    let critterViewModel = CritterViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack(spacing: 0.0) {
                    CritterView().environmentObject(critterViewModel)
                }
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
