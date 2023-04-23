//
//  CritterOptionsView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/19/23.
//

import SwiftUI

struct CritterOptionsTab: View {
    
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    let critter: Critter
    
    var body: some View {
        ZStack {
            List {
                CritterAge(critter: critter).environmentObject(critterViewModel)
                Text("hello3")
                Text("hello2")
            }
        }
        .background(Constants.Colors.grayLight.color)
    }
}

struct CritterAge: View {
    
    @State private var showAge = true
    @State var ageOptionIsShowing = false
    @EnvironmentObject var critterViewModel: CritterViewModel
    
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
                Toggle("", isOn: $showAge)
                    .onChange(of: showAge) { _ in
                        critterViewModel.displayAge(for: critter, showAge: showAge)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Constants.Colors.brownDark.color))
                    
            }
            
        }
    }
}

struct CritterOptionsTab_Previews: PreviewProvider {
    
    static var previews: some View {
        CritterOptionsTab(critter: Critter.exampleCritterData[0]).environmentObject(CritterViewModel())
    }
}
