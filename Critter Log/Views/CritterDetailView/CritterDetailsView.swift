//
//  CritterDetailsView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/19/23.
//

import SwiftUI

struct CritterDetailsView: View {
    
    @AppStorage("CritterCurrentTab") var selectedTab = 1
    
    let critter: Critter
    
    var body: some View {
//        Text("\(critter.name)")
        TabView(selection: $selectedTab) {
            
            Group {
                CritterDetailTab(critter: critter)
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Details")
                    }
                    .tag(1)
                
                CritterTaskTab(critter: critter)
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Tasks")
                    }
                    .tag(2)
                
                CritterOptionsTab(critter: critter)
                    .tabItem {
                        Image(systemName: "option")
                        Text("Options")
                    }
                    .tag(3)
                
//                CritterDetailTab(critter: critter)
//                    .tabItem {
//                        Label("Critter", systemImage: "eyes.inverse")
//                    }
//                    .tag(1)
//
//                CritterTaskTab(critter: critter)
//                    .tabItem {
//                        Label("Critter", systemImage: "eyes.inverse")
//                    }
//                    .tag(2)
//
//                CritterOptionsTab(critter: critter)
//                    .tabItem {
//                        Image("doctor")
//                            .resizable()
//                            .scaledToFit()
//                            .foregroundColor(.blue)
//
//                        Label("Doctor", systemImage: "house")
//                    }
//                    .badge(critter.vet != nil ? 1 : 0)
//                    .tag(3)
            }
            
        }
    }
}

struct CritterDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        CritterDetailsView(critter: Critter.exampleCritterData[0])
    }
}
