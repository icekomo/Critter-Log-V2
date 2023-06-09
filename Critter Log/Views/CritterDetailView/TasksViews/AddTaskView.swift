//
//  AddTaskView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/23/23.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var critterViewModel: CritterViewModel
    
    var critter: Critter
    
    @State private var task = ""
    
    @Binding var addTaskIsShowing: Bool
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                Text("Add Task")
                    .font(.title2)
                    .padding(.bottom, 0)
                    .foregroundColor(Constants.Colors.charcoal.color)
                Text("Please add a task for \(critter.name)")
                    .foregroundColor(Constants.Colors.charcoal.color)
                TextField("Task", text: $task)
                    .padding()
                    .background(Constants.Colors.greenLight.color)
                    .onTapGesture {
                        task = ""
                    }
                
                Button("Add Task") {
                    
                    if task.isEmpty || task == "Please add a task" {
                        task = "Please add a task"
                    } else {
                        critterViewModel.saveTask(for: critter, task: task)
                        task = ""
                        addTaskIsShowing.toggle()
                    }
                }
                .padding()
                .background(Constants.Colors.brownDark.color)
                .foregroundColor(.white)
            }
            .padding()
            .background(.white)
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static private  var addTaskIsShowing = Binding.constant(false)
    
    static private var critter = Critter(name: "bob"
                                        // url: "something"
//                                         urls: [URL(string: "https://www.google.com/")!]
    )
    
    static var previews: some View {
        AddTaskView(critter: critter, addTaskIsShowing: addTaskIsShowing)
    }
}
