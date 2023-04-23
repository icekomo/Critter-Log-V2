//
//  CritterTaskView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/19/23.
//

import SwiftUI

struct CritterTaskTab: View {
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    let critter: Critter
    
    @State var addTaskIsShowing = false
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                
                HStack {
                    Text("Tasks for \(critter.name)")
                        .font(.largeTitle)
                }
                .padding()
                
                if let tasks = critter.tasks {
                    List(tasks, id: \.self) { task in
                        Text(task)
                    }
                }
            }
            .background(Constants.Colors.grayLight.color)
            
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
            }
            .padding(.trailing, 16)
            .padding(.bottom, 16)
            
        }
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
