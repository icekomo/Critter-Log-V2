//
//  CritterCellView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/11/23.
//

import SwiftUI

struct CritterCellView: View {
    
    let critterName: String
    
    var body: some View {
        HStack {
            Image(systemName: "photo.on.rectangle")
                .padding()
            Text("\(critterName)")
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
        CritterCellView(critterName: "Name")
    }
}
