//
//  NetworkManager.swift
//  HeroElegantTransitions
//
//  Created by Yury Popov on 21.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let movieURL = "https://simplifiedcoding.net/demos/marvel/"
    
    func fetchData(completion: @escaping (_ movies: [Movie])->()) {
        guard let url = URL(string: movieURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movies = try decoder.decode([Movie].self, from: data)
                completion(movies)
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}
