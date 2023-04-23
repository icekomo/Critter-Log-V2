//
//  WelcomeView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/10/23.
//

import SwiftUI

struct CritterView: View {
    
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    var body: some View {
        
        NavigationStack {
            VStack {
                CritterViewHeader().environmentObject(critterViewModel)
                Spacer()
                
                if critterViewModel.critters.isEmpty {
                    
                    Image("Welcome-logo")
                        .resizable()
                        .scaledToFit()
                        .padding(50.0)
                } else {
                    
                    VStack(spacing: 0) {
                        Text("Critters")
                            .font(.largeTitle)
                        List {
                            ForEach(critterViewModel.critters, id: \.name) { critter in
                                
                                ZStack(alignment: .leading) {
                                    NavigationLink( destination: CritterDetailsView(critter: critter).environmentObject(critterViewModel)) {
                                        EmptyView()
                                    }
                                    .opacity(0)
                                    CritterCellView(critter: critter)
                                }
                            }
                            .onDelete(perform: critterViewModel.delete)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: -5, trailing: 0))
                            .listRowSeparator(.hidden)
                            .padding(.vertical, -5)
                            .background(Constants.Colors.grayLight.color)
    
                        }
                        .listStyle(PlainListStyle())
                    }
                }
                
                Spacer()
                
            }
            .background(Constants.Colors.grayLight.color)
            .onAppear {
                critterViewModel.loadCritters()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        let critterViewModel = CritterViewModel()
        CritterView()
            .environmentObject(critterViewModel)
    }
}
