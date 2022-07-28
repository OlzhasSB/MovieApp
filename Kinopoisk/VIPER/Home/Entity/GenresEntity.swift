////
////  GenresEntity.swift
////  Kinopoisk
////
////  Created by Olzhas Seiilkhanov on 30.05.2022.
////

import Foundation

struct Genre: Decodable {
    let id: Int
    let name: String
}

struct GenresEntity: Decodable {
    let genres: [Genre]
}


