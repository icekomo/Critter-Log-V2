//
//  WelcomeViewHeader.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/10/23.
//

import SwiftUI

struct CritterViewHeader: View {
    
    @State var addCritterIsShowing = false
   
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    var addCritterViewModel = AddCritterViewModel()
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Button {
                    addCritterIsShowing = true
                    print("buton tapped")
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black)
                }
                .accessibility(identifier: "addCritterButton")
                .sheet(isPresented: $addCritterIsShowing) {

                    AddCritterView(addCritterViewModel: addCritterViewModel,
                                   addCritterIsShowing: $addCritterIsShowing).environmentObject(critterViewModel)
                    .presentationDetents([.height(200)])
                    .presentationBackground(.ultraThinMaterial)
                }
            }
        }
        .overlay(
            Image("Logo-Header")
        )
        .padding()
        .background(Color.white)
    }
}

struct WelcomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        CritterViewHeader()
    }
}
