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
Capital: \(capital?[0] ?? "Capital")
Languages:\(languages?.values.description ?? "")
Area: \(area ?? 0) m²
Population: \(population ?? 0)
Currency: \(currencies?.values.description ?? "")
"""
    }
    private func convert() -> [String] {
        if let languages = languages {
            let languagesArray = Array(languages.values)
            return languagesArray
        } else {
            return ["language unknown"]
        }
        

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

