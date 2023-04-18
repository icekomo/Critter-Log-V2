////
////  CritterData.swift
////  Critter Log
////
////  Created by Josh Gdovin on 4/10/23.
////
//
// import Foundation
// import SwiftUI
//
// class CritterData: ObservableObject {
//    
//    @Published var critters = [Critter]()
//    
//    init() {
//        print("critter data init")
//    }
//    
//    func loadCritters() {
//        print("load critters")
//        if let fileUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("critters.json") {
//            do {
//                let data = try Data(contentsOf: fileUrl)
//                let decoder = JSONDecoder()
//                self.critters = try decoder.decode([Critter].self, from: data)
//            } catch {
//                print("Error loading data: \(error)")
//            }
//        } else {
//            print("File not found.")
//            createNewFile()
//        }
//    }
//    
//    func createNewFile() {
//        var critters = [Critter]()
//        /* For testing */
////        Critter(name: "Fluffy"),
////        var newCritter = Critter(name: "Max")
////        critters.append(newCritter)
//        
//        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyPrinted
//        
//        if let fileUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("critters.json") {
//            do {
//                let data = try encoder.encode(critters)
//                try data.write(to: fileUrl)
//                self.critters = critters
//            } catch {
//                print("Error creating file: \(error)")
//            }
//        }
//        
//        print("\(critters.count) is the count")
//    }
//    
//    func addCritter(name: String, critterURL: String?) {
//        // 1. Get the URL of our JSON file
//        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("critters.json")
//
//        // 2. Load the existing pets from the JSON file, or create an empty array if the file doesn't exist yet
//        var critters = [Critter]()
//        if let data = try? Data(contentsOf: url) {
//            
//            do {
//                critters = try JSONDecoder().decode([Critter].self, from: data)
//            } catch {
//                print("Error writing JSON file: \(error)")
//            }
//            
//        }
//
//        // 3. Create a new critter object with the given data and add it to the array
//        let newCritter = Critter(name: name, critterURL: critterURL)
//        critters.append(newCritter)
//        
//        // 4. Save the updated array back to the JSON file
//        do {
//            let jsonData = try JSONEncoder().encode(critters)
//            try jsonData.write(to: url)
//        } catch {
//            print("Error writing JSON file: \(error)")
//        }
//        
//        print("\(critters.count) is the count")
//    }
//    
//    func delete(at offsets: IndexSet) {
//        critters.remove(atOffsets: offsets)
//        saveCritters()
//    }
//    
//    func saveCritters() {
//        let fileManager = FileManager.default
//        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let fileURL = documentDirectory.appendingPathComponent("critters.json")
//        
//        do {
//            let encodedPets = try JSONEncoder().encode(critters)
//            try encodedPets.write(to: fileURL)
//        } catch {
//            print("Error writing JSON file: \(error)")
//        }
//    }
// }
