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
            WelcomeViewHeader().environmentObject(critterData)
            Spacer()
            
            if critterData.critters.isEmpty {
                
                Image("Welcome-logo")
                    .resizable()
                    .scaledToFit()
                    .padding(50.0)
            } else {
                
                VStack(spacing: 0) {
                    Text("Critters")
                        .font(.largeTitle)
                    List {
                        ForEach(critterData.critters, id: \.name) { critter in
                            CritterCellView(critterName: critter.name)
                        }
                        .onDelete(perform: critterData.delete)
                        .listRowInsets(EdgeInsets(top:0, leading:0, bottom:-5, trailing: 0))
                        .listRowSeparator(.hidden)
                        .padding(.vertical, -5)
                        .background(Constants.Colors.grayLight.color)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            
            Spacer()
            
        }
        .background(Constants.Colors.grayLight.color)
        .onAppear {
            critterData.loadCritters()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        let critterData = CritterData()
        WelcomeView()
            .environmentObject(critterData)
    }
}
