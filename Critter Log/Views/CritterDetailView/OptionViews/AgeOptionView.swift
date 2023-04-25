//
//  AddAgeView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/19/23.
//

import SwiftUI

struct AgeOptionView: View {
    
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    var critter: Critter
    
    @State private var age = ""
    
    @Binding var ageOptionIsShowing: Bool
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                Text("Critter Age")
                    .font(.title2)
                    .padding(.bottom, 10)
                Text("Please update the age of \(critter.name)")
                TextField("Age", text: $age)
                    .padding()
                    .background(Constants.Colors.greenLight.color)
                    .onTapGesture {
                        age = ""
                    }
                
                Button("Update Age") {
                    
                    if age.isEmpty || age == "Please add an age" {
                        age = "Please add an age"
                    } else {
                        let ageInt = Int(age) ?? 0
                        print("This is the new age \(ageInt)")
                        critterViewModel.updateAge(for: critter, newAge: ageInt)
//                        age = ""
                        
                        ageOptionIsShowing.toggle()
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

struct AgeOptionView_Previews: PreviewProvider {
    
    static private  var ageOptionIsShowing = Binding.constant(false)
    
    static private var critter = Critter(name: "bob", url: "google")
    
    static var previews: some View {
        AgeOptionView(critter: critter, ageOptionIsShowing: ageOptionIsShowing)
    }
}
