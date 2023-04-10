//
//  ContentView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/9/23.
//

import SwiftUI

struct ContentView: View {
    
    let lightGrey: Constants.Colors = .grayLight
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .background(Constants.Colors.grayLight.color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
