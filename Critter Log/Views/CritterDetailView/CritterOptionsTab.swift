//
//  CritterOptionsView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/19/23.
//

import SwiftUI

struct CritterOptionsTab: View {

    let critter: Critter
    
    var body: some View {
        List {
            CritterAge(critter: critter)
            Text("hello3")
            Text("hello2")
        }
    }
}

struct CritterAge: View {
    
    @State private var showAge = true
    @State var ageOptionIsShowing = false
    
    let critter: Critter
    
    var body: some View {
        HStack {
            
            Button("Add Age") {
                ageOptionIsShowing = true
            }
            .sheet(isPresented: $ageOptionIsShowing) {
                AgeOptionView(critter: critter, ageOptionIsShowing: $ageOptionIsShowing)
                .presentationDetents([.height(200)])
                .presentationBackground(.ultraThinMaterial)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("Show age")
                Toggle(isOn: $showAge) {}
            }
            
        }
    }
}

struct CritterOptionsTab_Previews: PreviewProvider {
    static var previews: some View {
        CritterOptionsTab(critter: Critter.exampleCritterData[0])
    }
}
