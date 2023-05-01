//
//  AddCritterViewModel.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/17/23.
//

import Foundation

class AddCritterViewModel: ObservableObject {
    
//    @Published var critterImage: Critter?
    
    var critterPhotos: [String] = []
    
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
        var newCritter = Critter(name: name)
        newCritter.imageUrls.append(contentsOf: critterPhotos)
        critters.append(newCritter)
        
        print("\(newCritter.imageUrls.count) is the urls count")
        
        // 4. Save the updated array back to the JSON file
        do {
            let jsonData = try JSONEncoder().encode(critters)
            try jsonData.write(to: url)
        } catch {
            print("Error writing JSON file: \(error)")
        }
    }
    
    func fetchRandomImages(name: String) {
        
        // Set the API endpoint URL
        let apiEndpoint = "https://dog.ceo/api/breeds/image/random/5"
        
        // Create a URL object from the API endpoint string
        guard let url = URL(string: apiEndpoint) else {
            print("Error: Invalid API endpoint URL")
            return
        }
        
        // Create a URL session object
        let session = URLSession.shared
        
        // Create a data task to fetch the data from the API
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Error: No data received from the API")
                return
            }
            
            do {
                // Decode the JSON response into a Swift object
                let response = try JSONDecoder().decode(DogAPIResponse.self, from: data)
                
                // Update the imageUrls array with the new image URLs
                DispatchQueue.main.async {
                    self.critterPhotos = response.message
                    print(self.critterPhotos)
                    
                    self.addCritter(name: name)
                    
                }
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }
        
        // Start the data task
        task.resume()
    }
    
    struct DogAPIResponse: Decodable {
        let message: [String]
        let status: String
    }
    
}
