//
//  CritterViewModel.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/16/23.
//

import Foundation
import SwiftUI

class CritterViewModel: ObservableObject {
    
    @Published var critters = [Critter]()
    
    @Published var critterImage: CritterImage?
    
    init() {
        print("critter data init")
    }
    
    // Step 1 : Load the data
    func loadCritters() {
        print("load critters")
        if let fileUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("critters.json") {
            do {
                print(fileUrl)
                let data = try Data(contentsOf: fileUrl)
                let decoder = JSONDecoder()
                self.critters = try decoder.decode([Critter].self, from: data)
            } catch {
                print("Error loading data: \(error)")
            }
        } else {
            print("File not found.")
            createNewFile()
        }
    }
    
    // Step 2: Create the Json file if needed
    func createNewFile() {
        let critters = [Critter]()
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        if let fileUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("critters.json") {
            do {
                let data = try encoder.encode(critters)
                try data.write(to: fileUrl)
                self.critters = critters
            } catch {
                print("Error creating file: \(error)")
            }
        }
        
        print("\(critters.count) is the count")
        if !critters.isEmpty {
            print("\(critters[0].imageUrls)")
        }
        
    }
    
    func delete(at offsets: IndexSet) {
        critters.remove(atOffsets: offsets)
        saveCritters()
    }
    
    func saveCritters() {
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentDirectory.appendingPathComponent("critters.json")
        
        do {
            let encodedPets = try JSONEncoder().encode(critters)
            try encodedPets.write(to: fileURL)
        } catch {
            print("Error writing JSON file: \(error)")
        }
    }
    
    func updateAge(for critter: Critter, newAge: Int) {
        //        print("Old age \(critter.age)")
        //        print("New age \(newAge)")
        //        print("this is the critter id \(critter.id)")
        guard let index = critters.firstIndex(where: { $0.id == critter.id }) else {
            return // Critter not found in the array
        }
        
        critters[index].age = newAge
        saveUpdates()
    }
    
    func displayAge(for critter: Critter, showAge: Bool) {
        //        print("this is the toggle value \(showAge)")
        guard let index = critters.firstIndex(where: { $0.id == critter.id }) else {
            return // Pet not found in the array
        }
        critters[index].showAge = showAge
        saveUpdates()
    }
    
    func displayContact(for critter: Critter, showContact: Bool) {
        print("this is the toggle value \(showContact)")
        guard let index = critters.firstIndex(where: { $0.id == critter.id }) else {
            return // Pet not found in the array
        }
        critters[index].showContact = showContact
        saveUpdates()
    }
    
    func updateContact(for critter: Critter, newName: String, newPhone: String) {
        guard let index = critters.firstIndex(where: { $0.id == critter.id }) else {
            return // Critter not found in the array
        }
        critters[index].contactName = newName
        critters[index].contactPhone = newPhone
        saveUpdates()
    }
    
    func displayEmergencyContact(for critter: Critter, showEmergencyContact: Bool) {
        //        print("this is the toggle value \(showAge)")
        guard let index = critters.firstIndex(where: { $0.id == critter.id }) else {
            return // Pet not found in the array
        }
        critters[index].showEmergencyContact = showEmergencyContact
        saveUpdates()
    }
    
    func saveTask(for critter: Critter, task: String) {
        // check to see which critter to save a task to
        guard let index = critters.firstIndex(where: { $0.id == critter.id }) else {
            return // Critter not found in the array
        }
        
        if critters[index].tasks == nil {
            critters[index].tasks = []
        }
        
        critters[index].tasks!.append(task)
        //        print("this is the count \(critters[index].tasks!.count)")
        saveUpdates()
    }
    
    func displayTask(for critter: Critter, showTask: Bool) {
        let critter = critter
        
        if let tasks = critter.tasks {
            print(tasks.count)
            print(tasks)
        } else {
            print("no tasks")
        }
    }
    
    func deleteTask(at offsets: IndexSet, critter: Critter) {
        let critter = critter
        guard let index = critters.firstIndex(where: { $0.id == critter.id }) else {
            return // Critter not found in the array
        }
        
        critters[index].tasks!.remove(atOffsets: offsets)
        saveUpdates()
    }
    
    func saveUpdates() {
        guard let url = FileManager.default.urls(for: .documentDirectory,
                                                 in: .userDomainMask).first?.appendingPathComponent("critters.json") else {
            fatalError("Failed to find critters.json in main bundle")
        }
        
        do {
            let data = try JSONEncoder().encode(critters)
            try data.write(to: url)
        } catch {
            fatalError("Failed to encode or write pets.json: \(error)")
        }
    }

}
