//
//  WelcomeViewHeader.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/10/23.
//

import SwiftUI

struct WelcomeViewHeader: View {
    
    @State var addCritterIsShowing = false
    
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
                        Text("Hello")
                    }
                    .presentationDetents([.height(400)])
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
