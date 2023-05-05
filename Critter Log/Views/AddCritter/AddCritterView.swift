//
//  AddCritterView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/11/23.
//

import SwiftUI

struct AddCritterView: View {
    
    @EnvironmentObject var addCritterViewModel: AddCritterViewModel
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    @State private var name = ""
    @Binding var addCritterIsShowing: Bool
    
    @State private var hasTimeElasped = false
    
    var body: some View {
        ZStack {
            Constants.Colors.charcoal.color
                .ignoresSafeArea()
            VStack {
                Text("Add Critter")
                    .font(.title2)
                    .padding(.bottom, 0)
                    .foregroundColor(.white)
                Text("To get started all you need is a critter name")
                    .foregroundColor(.white)
                TextField("Name", text: $name)
                    .padding()
                    .background(Constants.Colors.greenLight.color)
                    .onTapGesture {
                        name = ""
                    }
                    .accessibility(identifier: "addCritterTextField")
                
                Button("Add Critter") {
                    
                    if name.isEmpty || name == "Please add a name" {
                        name = "Please add a name"
                    } else {
                        addCritterViewModel.fetchRandomImages(name: name)
                        name = ""
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                            critterViewModel.loadCritters()
                        }
                        addCritterIsShowing.toggle()
                    }
                }
                .padding()
                .background(Constants.Colors.brownDark.color)
                .foregroundColor(.white)
            }
            .padding()
            .background(Constants.Colors.charcoal.color)
        }
    }
}

struct AddCritterView_Previews: PreviewProvider {
    
    static private  var addCritterIsShowing = Binding.constant(false)
    
    static private var addCritterViewModel = AddCritterViewModel()
    
    static var previews: some View {
        AddCritterView(addCritterIsShowing: addCritterIsShowing)
            .environmentObject(AddCritterViewModel())
    }
}
