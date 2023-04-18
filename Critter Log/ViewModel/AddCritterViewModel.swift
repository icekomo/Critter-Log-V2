//
//  AddCritterViewModel.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/17/23.
//

import Foundation

struct AddCritterViewModel {

    func addCritter(name: String) {
        // 1. Get the URL of our JSON file
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("critters.json")
        
        // 2. Load the existing pets from the JSON file, or create an empty array if the file doesn't exist yet
        var critters = [Critter]()
        if let data = try? Data(contentsOf: url) {
//            print("There is a file already!")
            do {
                critters = try JSONDecoder().decode([Critter].self, from: data)
            } catch {
                print("Error writing JSON file: \(error)")
            }
        }
        
        // 3. Create a new critter object with the given data and add it to the array
        let newCritter = Critter(name: name)
        critters.append(newCritter)
        
        // 4. Save the updated array back to the JSON file
        do {
            let jsonData = try JSONEncoder().encode(critters)
            try jsonData.write(to: url)
        } catch {
            print("Error writing JSON file: \(error)")
        }
        
        print("\(critters.count) is the count")
    }
}
