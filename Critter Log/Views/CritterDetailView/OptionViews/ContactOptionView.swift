//
//  ContactOptionView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/25/23.
//

import SwiftUI

struct ContactOptionView: View {
    
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    var critter: Critter
    
    @State private var contactName = ""
    @State private var contactPhone = ""
    
    @Binding var contactOptionIsShowing: Bool
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                Text("Critter Contact")
                    .font(.title2)
                    .padding(.bottom, 2)
                Text("Please update the contact information for\(critter.name)")
                TextField("Contact Name", text: $contactName)
                    .padding()
                    .background(Constants.Colors.greenLight.color)
                    .onTapGesture {
                        contactName = ""
                    }
                
                TextField("Phone Number", text: $contactPhone)
                    .padding()
                    .background(Constants.Colors.greenLight.color)
                    .onTapGesture {
                        contactPhone = ""
                    }
                
                Button("Update Age") {
                    
                    if contactName.isEmpty || contactName == "Please add an age" {
                        contactName = "Please add an age"
                    } else {
//                        let ageInt = Int(age) ?? 0
//                        print("This is the new age \(ageInt)")
//                        critterViewModel.updateAge(for: critter, newAge: ageInt)
                        contactName = ""
                        
                        contactOptionIsShowing.toggle()
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

struct ContactOptionView_Previews: PreviewProvider {
    static private  var contactOptionIsShowing = Binding.constant(false)
    
    static private var critter = Critter(name: "bob", url: "google")
    
    static var previews: some View {
        ContactOptionView(critter: critter, contactOptionIsShowing: contactOptionIsShowing)
    }
}
