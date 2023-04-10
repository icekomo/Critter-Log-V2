//
//  WelcomeView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/10/23.
//

import SwiftUI

struct WelcomeView: View {
    
//    let color: Constants.Colors = .grayLight
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
        }
        .background(Color("GrayLight"))
        .frame(width: 200.0, height: 200.0)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
