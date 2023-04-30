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
                
                if var contactName = critter.contactName {
                    TextField("\(contactName)", text: $contactName)
                        .padding()
                        .background(Constants.Colors.greenLight.color)
                        .onTapGesture {
                            contactName = ""
                        }
                } else {
                    TextField("Contact Name", text: $contactName)
                        .padding()
                        .background(Constants.Colors.greenLight.color)
                        .onTapGesture {
                            contactName = ""
                        }
                }
                if var contactPhone = critter.contactPhone {
                    TextField("\(contactPhone)", text: $contactPhone)
                        .padding()
                        .background(Constants.Colors.greenLight.color)
                        .onTapGesture {
                            contactPhone = ""
                        }
                } else {
                    TextField("Phone Number", text: $contactPhone)
                        .padding()
                        .background(Constants.Colors.greenLight.color)
                        .onTapGesture {
                            contactPhone = ""
                        }
                }
                
                Button("Update Contact") {
                    
                    if contactName.isEmpty || contactName == "Please add an age" {
                        contactName = "Please add an age"
                    } else {
                        critterViewModel.updateContact(for: critter, newName: contactName, newPhone: contactPhone)
                        contactName = ""
                        contactPhone = ""
                        
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
    
    static private var critter = Critter(name: "bob"
                                         // url: "something"
//                                         urls: [URL(string: "google.com")!]
    )
    
    static var previews: some View {
        ContactOptionView(critter: critter, contactOptionIsShowing: contactOptionIsShowing)
    }
}
