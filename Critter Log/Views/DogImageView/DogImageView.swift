//
//  DogImageView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/30/23.
//

import SwiftUI

struct DogImageView: View {
    let url: String
        
        var body: some View {
//            WebImage(url: URL(string: url))
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .padding()
            
            AsyncImage(url: URL(string: "https://hips.hearstapps.com/hmg-prod/images/little-cute-maltipoo-puppy-royalty-free-image-1652926025.jpg?crop=0.444xw:1.00xh;0.129xw,0&resize=980:*"))
                .frame(width: 200, height: 200)
            
        }
}

struct DogImageView_Previews: PreviewProvider {
    
    static var staticURL = "https://hips.hearstapps.com/hmg-prod/images/little-cute-maltipoo-puppy-royalty-free-image-1652926025.jpg?crop=0.444xw:1.00xh;0.129xw,0&resize=980:*"
    
    static var previews: some View {
        DogImageView(url: staticURL)
    }
}
