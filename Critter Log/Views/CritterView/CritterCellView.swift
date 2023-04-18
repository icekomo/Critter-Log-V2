//
//  CritterCellView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/11/23.
//

import SwiftUI

struct CritterCellView: View {
    
//    let critterName: String
    
    let critter: Critter
    
    var body: some View {
        HStack {
            // grab a random image
//            if let critterImage = viewModel.critterImage {
//
//                // check to see if there is a image value
//                if critter.critterURL != nil {
//                    Image(critter.critterURL!)
//             }
                // else {
//                    RemoteImage(url: critterImage.url)
// .padding(.leading)
//                }
            
//            } else {
//                Image(systemName: "photo.on.rectangle")
//                    .padding()
//            }
        
//            if let critterURL = critter.critterURL {
//                Image(critterURL)
//                  .padding()
//            } else {
//                Image(systemName: "photo.on.rectangle")
//                  .padding()
//            }
            
            Text("\(critter.name)")
            Spacer()
            Image(systemName: "chevron.forward")
                .padding()
                .padding(.vertical, 15)
        }
//        .onAppear {
//            viewModel.fetchCatImage()
//        }
        .background(.white)
        .padding()
        
    }
}

struct CritterCellView_Previews: PreviewProvider {

    static var previews: some View {
//        CritterCellView(critter: Critter)
        
        HStack {
            Image(systemName: "photo.on.rectangle")
            Text("Critter Name")
            Image(systemName: "chevron.forward")
                .padding()
                .padding(.vertical, 15)
        }
    }
}
