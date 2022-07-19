//
//  MovieData.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 27.05.2022.
//

import UIKit

struct MovieData: Decodable {
    let results: [Film]
}

struct Film: Decodable {
    let title: String
    //let poster_path: UIImage
    //let vote_average: Double
    //let release_date: String
    let overview: String
}

