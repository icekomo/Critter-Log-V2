//
//  CritterDetailsView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/19/23.
//

import SwiftUI

struct CritterDetailsView: View {
    
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    @AppStorage("CritterCurrentTab") var selectedTab = 1
    
    let critter: Critter
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            Group {
                CritterDetailTab(critter: critter).environmentObject(critterViewModel)
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Critter")
                    }
                    .tag(1)
                
                CritterTaskTab(critter: critter).environmentObject(critterViewModel)
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Tasks")
                    }
                    .tag(2)
                    .badge(critter.tasks?.count != nil ? critter.tasks!.count : 0)
                
                CritterOptionsTab(critter: critter).environmentObject(critterViewModel)
                    .tabItem {
                        Image(systemName: "option")
                        Text("Options")
                    }
                    .tag(3)
                    
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Constants.Colors.charcoal.color, for: .tabBar)
        }
        .accentColor(Constants.Colors.brownLight.color)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct CritterDetailsView_Previews: PreviewProvider {
    
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    static var previews: some View {
        CritterDetailsView(critter: Critter.exampleCritterData[0]).environmentObject(CritterViewModel())
    }
}
