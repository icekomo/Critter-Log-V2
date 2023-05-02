//
//  CritterCellView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/11/23.
//

import SwiftUI

struct CritterCellView: View {
    let critter: Critter
    
    var body: some View {
        HStack {
//            Image("TestDog")
            AsyncImage(url: URL(string: critter.imageUrls[0]))
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(50)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color("BrownLight"), lineWidth: 4)
                )
                .padding()
                .accessibility(identifier: "critterListImage")
            
            Text("\(critter.name)")
                .font(.headline)
            Spacer()
            
            Image(systemName: "chevron.forward")
                .padding()
                .padding(.vertical, 15)
        }
        .background(.white)
        .padding()
        
    }
}

struct CritterCellView_Previews: PreviewProvider {

    static var previews: some View {
        HStack {
            Image(systemName: "photo.on.rectangle")
            Text("Critter Name")
            Image(systemName: "chevron.forward")
                .padding()
                .padding(.vertical, 15)
        }
    }
}
