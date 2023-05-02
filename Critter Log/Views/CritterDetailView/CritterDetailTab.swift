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
//        GeometryReader { geometry in
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
                        
                        Spacer()
                    }
                }
            }
            .background(Constants.Colors.greenLight.color)
//        }
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
        ZStack {
            AsyncImage(url: URL(string: critter.imageUrls[0])) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    // Since the AsyncImagePhase enum isn't frozen,
                    // we need to add this currently unused fallback
                    // to handle any new cases that might be added
                    // in the future:
                    EmptyView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .clipped()
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
            if let conatctName = critter.contactName {
                HStack {
                    VStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color.white)
                    }
                    .padding()
                    .background(Constants.Colors.brownDark.color)
                    .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text("Contact")
                            .font(.headline)
                            .fontWeight(.medium)
                        Text("\(conatctName)")
                            .font(.subheadline)
                    }
                }
            } else {
                
                HStack {
                    VStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(Constants.Colors.green.color)
                    }
                    .padding()
                    .background(Constants.Colors.greenLight.color)
                    .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text("Contact")
                            .font(.headline)
                            .fontWeight(.medium)
                        Text("Add a contact")
                            .font(.subheadline)
                    }
                }
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
