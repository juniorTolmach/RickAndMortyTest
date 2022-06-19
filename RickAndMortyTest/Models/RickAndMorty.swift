//
//  RickAndMorty.swift
//  RickAndMortyTest
//
//  Created by Daniil Oreshenkov on 11.04.2022.
//

import Foundation

enum Link: String {
    case rickAndMorty = "https://rickandmortyapi.com/api/character"
}

struct RickAndMorty: Decodable{
    let info: Info
    let results: [Character]
}

struct Info: Decodable{
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Decodable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let url: String
    
    var description: String {
        """
        Name: \(name)
        Status: \(status)
        Species: \(species)
        Gender: \(gender)
        Origin: \(origin.name)
        Location: \(location.name)
        """
    }
}

struct Location: Decodable {
    let name: String
}
