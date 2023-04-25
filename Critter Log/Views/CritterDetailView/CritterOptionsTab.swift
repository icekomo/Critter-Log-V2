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
                    .padding()
                    .foregroundColor(Constants.Colors.charcoal.color)

                List {
                    
                    CritterAge(critter: critter).environmentObject(critterViewModel)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Constants.Colors.greenLight.color)
                    CritterContact(critter: critter).environmentObject(critterViewModel)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Constants.Colors.greenLight.color)
                    Text("hello2")
                }
                .listStyle(PlainListStyle())
            }
        }
        .background(Constants.Colors.greenLight.color)
    }
}

struct CritterAge: View {
    
    @State private var showAge = true
    @State var ageOptionIsShowing = false
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    let critter: Critter
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text("Age")
                .font(.headline)
                .padding(5)
                .background(Constants.Colors.charcoal.color)
                .foregroundColor(.white)
            HStack {
                VStack {
                    HStack {
                        Text("\(critter.name)'s age:")
                            .padding(EdgeInsets(top: 8, leading: 10, bottom: 5, trailing: 0))
                            .foregroundColor(Constants.Colors.charcoal.color)
                            .font(.system(size: 16))
                        if let critterAge = critter.age {
                            
                            Text("\(String(critterAge))")
                                .foregroundColor(.white)
                                .frame(width: 10, height: 10)
                                .padding(8)
                                .background(Constants.Colors.charcoal.color)
                                .cornerRadius(30)
                        } else {
                            Text("0")
                                .foregroundColor(.white)
                                .frame(width: 10, height: 10)
                                .padding(8)
                                .background(Constants.Colors.charcoal.color)
                                .cornerRadius(30)
                        }
                    }
                    
                    Button {
                        ageOptionIsShowing = true
                    } label: {
                        HStack {
                            Text("Update Age")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            Image(systemName: "chevron.right")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                        }
                        .padding(8)
                        .background(Constants.Colors.brownDark.color)
                        .cornerRadius(6)
                        
                    }
                    .sheet(isPresented: $ageOptionIsShowing) {
                        AgeOptionView(critter: critter, ageOptionIsShowing: $ageOptionIsShowing)
                            .presentationDetents([.height(200)])
                            .presentationBackground(.ultraThinMaterial)
                    }
                }
                
                Spacer()
                VStack(alignment: .center) {
                    
                    if showAge == true {
                        Text("Hide")
                            .foregroundColor(.white)
                    } else {
                        Text("Show")
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Toggle("", isOn: $showAge)
                            .onChange(of: showAge) { _ in
                                critterViewModel.displayAge(for: critter, showAge: showAge)
                            }
                            .toggleStyle(SwitchToggleStyle(tint: Constants.Colors.brownDark.color))
                    }
                    .padding(.horizontal)
                }
                .frame(width: 80)
                .padding()
                .background(Constants.Colors.charcoal.color)
                
            }
            .background(.white)
        }
    }
}

struct CritterContact: View {
    @State private var showContact = true
    @State var contactOptionIsShowing = false
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    let critter: Critter
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Contact")
                .font(.headline)
                .padding(5)
                .background(Constants.Colors.charcoal.color)
                .foregroundColor(.white)
            
            HStack {
                VStack {
                    HStack {
                        VStack(alignment: .leading){
                            if let contactName = critter.contactName {
                                Text("\(contactName)")
                                    .foregroundColor(Constants.Colors.charcoal.color)
                                    .font(.system(size: 16))
                            } else {
                                Text("Add Name")
                                    .foregroundColor(Constants.Colors.charcoal.color)
                                    .font(.system(size: 16))
                            }
                            
                            if let contactPhone = critter.contactPhone {
                                Text("\(contactPhone)")
                                    .foregroundColor(Constants.Colors.charcoal.color)
                                    .font(.system(size: 16))
                            } else {
                                Text("Add Phone Number")
                                    .foregroundColor(Constants.Colors.charcoal.color)
                                    .font(.system(size: 16))
                            }
                        }
                        .padding(EdgeInsets(top: 8, leading: 10, bottom: 0, trailing: 0))
                        
                    }
                    
                    Button {
                        contactOptionIsShowing = true
                    } label: {
                        HStack {
                            Text("Update Age")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            Image(systemName: "chevron.right")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                        }
                        .padding(8)
                        .background(Constants.Colors.brownDark.color)
                        .cornerRadius(6)
                        
                    }
                    .sheet(isPresented: $contactOptionIsShowing) {
                        AgeOptionView(critter: critter, ageOptionIsShowing: $contactOptionIsShowing)
                            .presentationDetents([.height(200)])
                            .presentationBackground(.ultraThinMaterial)
                    }
                }
                
                Spacer()
                VStack(alignment: .center) {
                    
                    if showContact == true {
                        Text("Hide")
                            .foregroundColor(.white)
                    } else {
                        Text("Show")
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Toggle("", isOn: $showContact)
                            .onChange(of: showContact) { _ in
                                critterViewModel.displayContact(for: critter, showContact: showContact)
                            }
                            .toggleStyle(SwitchToggleStyle(tint: Constants.Colors.brownDark.color))
                    }
                    .padding(.horizontal)
                }
                .frame(width: 80)
                .padding()
                .background(Constants.Colors.charcoal.color)
                
            }
            .background(.white)
            
            //        HStack {
            //
            //            Button("Update Contact") {
            //                contactOptionIsShowing = true
            //            }
            //            .sheet(isPresented: $contactOptionIsShowing) {
            //                AgeOptionView(critter: critter, ageOptionIsShowing: $contactOptionIsShowing)
            //                    .presentationDetents([.height(200)])
            //                    .presentationBackground(.ultraThinMaterial)
            //            }
            //            Spacer()
            //            VStack(alignment: .trailing) {
            //                Text("Show contact")
            //                Toggle("", isOn: $showContact)
            //                    .onChange(of: showContact) { _ in
            //                        critterViewModel.displayContact(for: critter, showContact: showContact)
            //                    }
            //                    .toggleStyle(SwitchToggleStyle(tint: Constants.Colors.brownDark.color))
            //            }
            //        }
            //        .padding()
            //        .background(.white)
        }
    }
}

struct CritterOptionsTab_Previews: PreviewProvider {
    
    static var previews: some View {
        CritterOptionsTab(critter: Critter.exampleCritterData[0]).environmentObject(CritterViewModel())
    }
}
