//
//  CritterData.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/10/23.
//

import Foundation
import SwiftUI

class CritterData: ObservableObject {
    @Published var critters = [Critter]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let fileUrl = Bundle.main.url(forResource: "critters", withExtension: "json") {
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
    
    func createNewFile() {
        let critters = [Critter]()
//            Critter(name: "Fluffy"),
//            Critter(name: "Max")
        
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
    }
}
