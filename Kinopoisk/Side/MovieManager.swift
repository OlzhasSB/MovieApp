//
//  MovieManager.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 27.05.2022.
//

import Foundation

protocol MovieManagerDelegate {
    func didUpdateMovies(movieList: MovieData)
}

struct MovieManager {
    
    var delegate: MovieManagerDelegate?
    
    func performRequest() {
        if let movieURL = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=e516e695b99f3043f08979ed2241b3db") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: movieURL) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let movieList = self.parseJSON(movieData: safeData) {
                        self.delegate?.didUpdateMovies(movieList: movieList)
                    }
                    
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(movieData: Data) -> MovieData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MovieData.self, from: movieData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
