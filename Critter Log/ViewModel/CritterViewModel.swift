//
//  CritterViewModel.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/16/23.
//

import Foundation
import SwiftUI

class CritterViewModel: ObservableObject {
    
    @Published var critterImage: CritterImage?
    @Published var critters = [Critter]()
    
    init() {
        print("critter data init")
    }
    
    // Step 1 : Load the data
    func loadCritters() {
        print("load critters")
        if let fileUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("critters.json") {
            do {
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
    
    func fetchCatImage() {
        let apiKey = "live_4Yiy8D3sx9pvMiK276lStGhlfQt01bDOB19JHnJ8jTkrcJ9AkHAbfrH152IhzfXJ"
        let urlString = "https://api.thedogapi.com/v1/images/search?api_key=\(apiKey)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let critterImage = try decoder.decode([CritterImage].self, from: data)
                DispatchQueue.main.async {
                    self.critterImage = critterImage.first
                }
            } catch let error {
                print("error here")
                print(error)
                print(error.localizedDescription)
            }
        }.resume()
    }
}
