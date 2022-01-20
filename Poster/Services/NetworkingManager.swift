//
//  NetworkingManager.swift
//  Poster
//
//  Created by Александр Панин on 20.01.2022.
//

import Foundation

enum Link: String, CaseIterable {
    case kitsuApi = "https://kitsu.io/api/edge/anime?filter[text]=tokyo"
    case rickAndMortyApi = "https://rickandmortyapi.com/api/character"
}

enum ErrorNetwork: Error {
    case errorURL
    case errorData
    case errorDecoding
}

class NetworkingManager {
    static var shared = NetworkingManager()
    private init() {}
    
    func fetchImage(url: String?, complition: @escaping(Result<Data, ErrorNetwork>) -> Void) {
        
        guard let url = URL(string: url ?? "") else {
            complition(.failure(.errorURL))
            return
        }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                complition(.failure(.errorData))
                return
            }
            DispatchQueue.main.async {
                complition(.success(imageData))
            }
        }
    }
    
    func fetchData(url: String?, complition: @escaping(Result<Posters, ErrorNetwork>) -> Void) {
        
        guard let url = URL(string: url ?? "") else {
            complition(.failure(.errorURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                complition(.failure(.errorData))
                return
            }
            do {
                let model = try JSONDecoder().decode(Posters.self, from: data)
                DispatchQueue.main.async {
                    complition(.success(model))
                }
            } catch {
                complition(.failure(.errorDecoding))
            }
        }.resume()
    }
}
