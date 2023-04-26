//
//  CritterDetailView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/19/23.
//

import SwiftUI

struct CritterDetailTab: View {
    @EnvironmentObject var critterViewModel: CritterViewModel
    let critter: Critter
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                ScrollView {
                    
                    VStack {
                        
                        ImageView(critter: critter)
                        NameView(critter: critter)
                        HStack {
                            if critter.showAge == false {
                                AgeView(critter: critter).hidden()
                            } else {
//                                Text("Width: \(geometry.size.width)")
//                                Text("Height: \(geometry.size.height)")
                                AgeView(critter: critter)
//                                    .position(x: geomerty.size.width / 2)
                            }
                            
                            if critter.showContact == false {
                                ContactView(critter: critter).hidden()
                            } else {
                                ContactView(critter: critter)
//                                    .position(x: geomerty.size.width / 2)
                            }
                            
                        }
                        VStack {
                            if critter.showEmergencyContact == false {
                                EmergencyContactView(critter: critter).hidden()
                            } else {
                                EmergencyContactView(critter: critter)
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            .background(Constants.Colors.greenLight.color)
        }
    }
}

struct CritterDetailTab_Previews: PreviewProvider {
    static var previews: some View {
        CritterDetailTab(critter: Critter.exampleCritterData[0]).environmentObject(CritterViewModel())
    }
}

struct ImageView: View {
    let critter: Critter
    var body: some View {
        Image("TestDog")
            .resizable()
    }
}

struct NameView: View {
    let critter: Critter
    var body: some View {
        Text("\(critter.name)")
        
            .font(.system(size: 50))
            .fontWeight(.light)
            .foregroundColor(Constants.Colors.charcoal.color)
            .padding(.bottom)
    }
}

struct AgeView: View {
    let critter: Critter
    
    var body: some View {
        ZStack {
            if let showAge = critter.age {
                VStack {
                    Text("Age:")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                    Text(String(showAge))
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(Constants.Colors.brownLight.color)
                }
                .frame(width: 60, height: 60)
                .padding()
                .background(Constants.Colors.charcoal.color)
                .cornerRadius(70)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.white, lineWidth: 4)
                )
                
            } else {
                VStack {
                    Text("Update")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                    Text("Age")
                        .font(.headline)
                        .fontWeight(.black)
                        .foregroundColor(Constants.Colors.brownLight.color)
                }
                .frame(width: 60, height: 60)
                .padding()
                .background(Constants.Colors.charcoal.color)
                .cornerRadius(70)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.white, lineWidth: 4)
                )
            }
        }
        .padding()
//        .background(Color.white)
    }
}

struct ContactView: View {
    let critter: Critter
    
    var body: some View {
        ZStack {
            VStack{
//                Text("\(critter.contactName)")
                
//                if
//                
//                Link(destination: URL(string: "tel:\(critter.contactPhone)")!) {
//                            Text("Call")
//                        }
            }
            
        }
        .padding()
        .background(Color.white)
    }
}

struct EmergencyContactView: View {
    let critter: Critter
    
    var body: some View {
        ZStack {
            Text("Emergency")
        }
        .padding()
        .background(Color.white)
    }
}
