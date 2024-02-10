//
//  ModelData.swift
//  Landmarks
//
//  Created by tom montgomery on 1/23/24.
//

import Foundation

@Observable
class ModelData {
    
    // get's run on app boot (when outside the class)
    // now that it's in a class, we need to instantiate it with an EO
    var landmarks: [Landmark] = load("landmarkData.json")
    
    // now lets load our hikes
    var hikes: [Hike] = load("hikeData.json")
    
    // computed categories dictionary - category names as keys.
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: {$0.category.rawValue}
        )
    }
}



// generic function - could pass in any decodable type and return that type (not just json... although we are using the jsondecoder)
func load<T: Decodable>(_ filename: String) -> T {
    print("Calling the LOAD function")
    let data: Data
    
    // this will be of type URL
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        // if we get a file handle great.  if not, abort!
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        // if we can shove it into a byte buffer spectacular.  if not, abort!
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        // if it's well formed JSON bussin'.  if not, abort!
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
