//
//  WelcomeViewHeader.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/10/23.
//

import SwiftUI

struct WelcomeViewHeader: View {
    
    @State var addCritterIsShowing = false
    @State private var name = ""
    @EnvironmentObject var critterData: CritterData
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Button(action: {
                    addCritterIsShowing = true
                    print("buton tapped")
                }) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black)
                }
                .accessibility(identifier: "addCritterButton")
                .sheet(isPresented: $addCritterIsShowing) {
                    VStack {
                        Form {
                            TextField("Name", text: $name)
                            
                            Button("Add Pet") {
                                CritterData().addCritter(name: name)

                                print(CritterData().critters)
                                name = ""
                                critterData.loadCritters()
                                addCritterIsShowing.toggle()
                            }
                        }
                    }
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
        WelcomeViewHeader()
    }
}
