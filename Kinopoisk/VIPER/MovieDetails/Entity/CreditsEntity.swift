//
//  CreditsEntity.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 30.05.2022.
//

import Foundation

struct Actor: Decodable {
    let id: Int
}

struct CreditsEntity: Decodable {
    let cast: [Actor]
}
