//
//  PersonEntity.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 30.05.2022.
//

import Foundation

struct PersonEntity: Decodable {
    let birthday: String
    let known_for_department: String
    let name: String
    let biography: String
    let place_of_birth: String
    let profile_path: String
}
