//
//  AddCritterView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/11/23.
//

import SwiftUI

struct AddCritterView: View {
    
    var addCritterViewModel: AddCritterViewModel
    
    @EnvironmentObject var critterViewModel: CritterViewModel
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
                    .onTapGesture {
                        name = ""
                    }
                
                Button("Add Critter") {
                    
                    if name.isEmpty || name == "Please add a name" {
                        name = "Please add a name"
                    } else {
                        addCritterViewModel.addCritter(name: name)
                        print(critterViewModel.critters.count)
                        // add random image to critter
                        name = ""
                        critterViewModel.loadCritters()
                        addCritterIsShowing.toggle()
                    }
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
    
    static private var addCritterViewModel = AddCritterViewModel()
    
    static var previews: some View {
        AddCritterView(addCritterViewModel: addCritterViewModel, addCritterIsShowing: addCritterIsShowing)
    }
}
