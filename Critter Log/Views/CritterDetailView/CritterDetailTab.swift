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
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ImageView(critter: critter)
                    NameView(critter: critter)
                    HStack {
                        if critter.showAge == false {
                            AgeView(critter: critter).hidden()
                        } else {
                            AgeView(critter: critter)
                        }
                        
                        if critter.showContact == false {
                            ContactView(critter: critter).hidden()
                        } else {
                            ContactView(critter: critter)
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
            .fontWeight(.heavy)
            .foregroundColor(Color.black)
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
                
            } else {
                Text("no age to show")
            }
        }
        .padding()
        .background(Color.white)
    }
}

struct ContactView: View {
    let critter: Critter
    
    var body: some View {
        ZStack {
            Text("Contact")
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
