//
//  CritterTaskView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/19/23.
//

import SwiftUI

struct CritterTaskTab: View {
    @EnvironmentObject var critterViewModel: CritterViewModel
    @State var addTaskIsShowing = false
    let critter: Critter
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                
                if let tasks = critter.tasks {
                    
                    HStack {
                        Text("Tasks for \(critter.name)")
                            .font(.largeTitle)
                            .foregroundColor(Constants.Colors.charcoal.color)
                    }
                    .padding()
                    
                    List {
                        ForEach(tasks, id: \.self) { task in
                            Text(task)
                                .cornerRadius(0)
                        }
                        .onDelete(perform: { indexSet in
                            critterViewModel.deleteTask(at: indexSet, critter: critter)
                        })
                    }
                    .listStyle(PlainListStyle())
                    .padding()
                } else {
                    VStack {
                        HStack {
                            Spacer()
                        }
                        Spacer()
                        Image("Logo-Header")
                            .resizable()
                            .frame(width: 48, height: 38)
                            .foregroundColor(.black)
                        Text("Please add a task for \(critter.name)!")
                            .foregroundColor(Constants.Colors.charcoal.color)
                        Spacer()
                    }
                }
            }
            .background(Constants.Colors.greenLight.color)
            
            HStack {
                Button {
                    addTaskIsShowing = true
                } label: {
                    Image(systemName: "plus")
                }
                .frame(width: 20, height: 20)
                .font(.system(size: 28))
                .padding()
                .background(Constants.Colors.brownDark.color)
                .foregroundColor(.white)
                .cornerRadius(70)
                .sheet(isPresented: $addTaskIsShowing) {
                    AddTaskView(critter: critter, addTaskIsShowing: $addTaskIsShowing)
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
        .background(Constants.Colors.greenLight.color)
        .onAppear {
            critterViewModel.displayTask(for: critter, showTask: false)
        }
    }
}

struct CritterTaskTav_Previews: PreviewProvider {
    static var previews: some View {
        CritterTaskTab(critter: Critter.exampleCritterData[0]).environmentObject(CritterViewModel())
    }
}
