//
//  CritterTaskView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/19/23.
//

import SwiftUI

struct CritterTaskTab: View {
    let critter: Critter
    
    var body: some View {
        Text("Critter Tasks")
    }
}

struct CritterTaskTav_Previews: PreviewProvider {
    static var previews: some View {
        CritterTaskTab(critter: Critter.exampleCritterData[0])
    }
}
