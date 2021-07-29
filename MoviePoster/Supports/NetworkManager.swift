//
//  NetworkManager.swift
//  MoviePoster
//
//  Created by Елена Дранкина on 07.05.2021.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init () {}
    
    func fetchData(from url: String?, with complition: @escaping ([Movie]) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                DispatchQueue.main.async {
                    complition(movies)
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
    
    func fetchImage(from url: URL, complition: @escaping(Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            
            guard url == response.url else { return }
            DispatchQueue.main.async {
                complition(data, response)
            }
        }.resume()
    }
}
