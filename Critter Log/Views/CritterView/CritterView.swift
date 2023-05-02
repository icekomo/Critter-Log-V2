//
//  WelcomeView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/10/23.
//

import SwiftUI

struct CritterView: View {
    
    @StateObject var addCritterViewModel = AddCritterViewModel()
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    @State var addCritterIsShowing = false
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    Spacer()
                    if critterViewModel.critters.isEmpty {
                        Image("Welcome-logo")
                            .resizable()
                            .scaledToFit()
                            .padding(50.0)
                    } else {
                        VStack(spacing: 0) {
                            HStack {
                                Text("Critters")
                                    .font(.largeTitle)
                                Image("Logo-Header")
                                    .resizable()
                                    .frame(width: 48, height: 38)
                                    .foregroundColor(.black)
                            }
                            .padding(.top, 40)
                            
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
                                .background(Constants.Colors.greenLight.color)
                                
                            }
                            .listStyle(PlainListStyle())
                        }
                    }
                    Spacer()
                }
                .background(Constants.Colors.greenLight.color)
                .navigationTitle("Critter Log")
                .toolbarBackground(Color.white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .onAppear {
                    critterViewModel.loadCritters()
                }

                HStack {
                    Button {
                        addCritterIsShowing = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .frame(width: 20, height: 20)
                    .font(.system(size: 28))
                    .padding()
                    .background(Constants.Colors.brownDark.color)
                    .foregroundColor(.white)
                    .cornerRadius(70)
                    .accessibility(identifier: "addCritterButton")
                    .sheet(isPresented: $addCritterIsShowing) {
                        
                        AddCritterView(addCritterIsShowing: $addCritterIsShowing)
                            .environmentObject(critterViewModel)
                            .environmentObject(addCritterViewModel)
                            .presentationDetents([.height(200)])
                            .presentationBackground(.ultraThinMaterial)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 70)
                            .stroke(Color.white, lineWidth: 3)
                        )
                }
                .padding(.trailing, 16)
                .padding(.bottom, 16)
            }
            .tint(Color.black)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        CritterView()
            .environmentObject(CritterViewModel())
    }
}
