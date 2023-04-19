//
//  CritterDetailView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/19/23.
//

import SwiftUI

struct CritterDetailTab: View {
    let critter: Critter
    
    var body: some View {
        AgeView(critter: critter)
    }
}

struct CritterDetailTab_Previews: PreviewProvider {
    static var previews: some View {
        CritterDetailTab(critter: Critter.exampleCritterData[0])
    }
}


struct AgeView: View {
    let critter: Critter
    
    var body: some View {
        if let showAge = critter.age {
            Text("\(showAge)")
        } else {
            Text("no age to show")
        }
        
    }
}
