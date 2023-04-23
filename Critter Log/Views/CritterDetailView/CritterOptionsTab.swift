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
            
            VStack {
                Text("Critter Options")
                    .font(.largeTitle)
                List {
                    CritterAge(critter: critter).environmentObject(critterViewModel)
                        .listRowSeparator(.hidden)
                    CritterContact(critter: critter).environmentObject(critterViewModel)
                        .listRowSeparator(.hidden)
                    Text("hello2")
                }
                .listStyle(PlainListStyle())
                .padding()
               
//                .listRowInsets(EdgeInsets(top: 0, lead ing: 0, bottom: 40, trailing: 0))
//                .listRowSeparator(.hidden)
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
            Button("Update Age") {
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

struct CritterContact: View {
    @State private var showContact = true
    @State var contactOptionIsShowing = false
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    let critter: Critter
    var body: some View {
        HStack {
            
            Button("Update Contact") {
                contactOptionIsShowing = true
            }
            .sheet(isPresented: $contactOptionIsShowing) {
                AgeOptionView(critter: critter, ageOptionIsShowing: $contactOptionIsShowing)
                    .presentationDetents([.height(200)])
                    .presentationBackground(.ultraThinMaterial)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("Show contact")
                Toggle("", isOn: $showContact)
                    .onChange(of: showContact) { _ in
                        critterViewModel.displayContact(for: critter, showContact: showContact)
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
