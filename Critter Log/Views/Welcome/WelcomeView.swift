//
//  WelcomeView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/10/23.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var critterData: CritterData
    var body: some View {
        VStack {
            WelcomeViewHeader()
            Spacer()
            
            if critterData.critters.isEmpty {
                Image("Welcome-logo")
                    .resizable()
                    .scaledToFit()
                    .padding(40.0)
            } else {
                List {
                    ForEach(critterData.critters, id: \.name) { critter in
                        Text("\(critter.name)")
                    }
                }
            }
            
            Spacer()
            
        }
        .background(Color("GrayLight"))
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
