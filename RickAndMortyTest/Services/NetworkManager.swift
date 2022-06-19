//
//  File.swift
//  RickAndMortyTest
//
//  Created by Daniil Oreshenkov on 11.04.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fecthDate(from url: String?, with comletion: @escaping(RickAndMorty) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { date, _, error in
            guard let date = date else {
                print(error?.localizedDescription ?? "No error Description")
                return
            }
            do {
                let rickAndMorty = try JSONDecoder().decode(RickAndMorty.self, from: date)
                DispatchQueue.main.async {
                    comletion(rickAndMorty)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }

}

class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}
