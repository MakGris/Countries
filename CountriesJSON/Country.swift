//
//  Country.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import Foundation

struct Country: Decodable {
    let name: Name
    let currencies: [String: Currency]
    let capital: [String]
    let languages: [String: String]
    let area: Int
    let population: Int
    let flags: Flag
    var description: String {
        """
Capital: \(capital[0])
Languages: \(languages.values)
Area: \(area) m²
Population: \(population)
Currency: \(getCurrency())
"""
    }
    
    private func getCurrency() -> [String] {
        var currencyNames = [String]()
        for currency in currencies {
            let currencyName = currency.value.name
            currencyNames.append(currencyName)

        }
        return currencyNames
    }
}

struct Name: Decodable {
    let official: String
}

struct Currency: Decodable {
    let name: String
    let symbol: String
}

struct Flag: Decodable {
    let png: String
    let svg: String
}
