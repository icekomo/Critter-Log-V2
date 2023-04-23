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
//        Text("\(critter.name)")
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
                
                CritterOptionsTab(critter: critter).environmentObject(critterViewModel)
                    .tabItem {
                        Image(systemName: "option")
                        Text("Options")
                    }
                    .tag(3)
            }
        }
        .background(Constants.Colors.grayLight.color)
    }
}

struct CritterDetailsView_Previews: PreviewProvider {
    
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    static var previews: some View {
        CritterDetailsView(critter: Critter.exampleCritterData[0])
    }
}
