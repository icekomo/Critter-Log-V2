//
//  AddCritterView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/11/23.
//

import SwiftUI

struct AddCritterView: View {
    @EnvironmentObject var critterData: CritterData
    
    @State private var name = ""
    
    @Binding var addCritterIsShowing: Bool
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                Text("Add Critter")
                    .font(.title2)
                    .padding(.bottom, 10)
                Text("To get started all you need is a critter name")
                TextField("Name", text: $name)
                    .padding()
                    .background(Constants.Colors.grayLight.color)
                
                Button("Add Critter") {
                    CritterData().addCritter(name: name)
                    
                    print(CritterData().critters)
                    name = ""
                    critterData.loadCritters()
                    addCritterIsShowing.toggle()
                }
                .padding()
                .background(Constants.Colors.brownDark.color)
                .foregroundColor(.white)
            }
            .padding()
            .background(Color.white)
        }
    }
}

struct AddCritterView_Previews: PreviewProvider {
    
    static private  var addCritterIsShowing = Binding.constant(false)
    static var previews: some View {
        AddCritterView(addCritterIsShowing: addCritterIsShowing)
    }
}
