//
//  Country.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import Foundation

struct Country: Decodable {
    let name: Name?
    let currencies: [String: Currency]?
    let capital: [String]?
    let languages: [String: String]?
    let area: Double?
    let population: Int?
    let flags: Flag?
    var description: String {
        """
Capital: \(capital?[0] ?? "")
Languages: \(String(describing: languages?.values))
Area: \(area ?? 0) m²
Population: \(population ?? 0)
Currency:
"""
    }
}

struct Name: Decodable {
    let official: String?
}

struct Currency: Decodable {
    let name: String?
    let symbol: String?
}

struct Flag: Decodable {
    let png: String?
    let svg: String?
}
