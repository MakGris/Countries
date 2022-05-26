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
Languages:\(convertLanguages())
Area: \(area ?? 0) m²
Population: \(population ?? 0) people
Currency: \(convertCurrencies())
Currency symbol: \(convertSymbols())
"""
    }
    
    private func convertLanguages() -> String {
        if let languages = languages {
            let languagesArray = Array(languages.values)
            let languagesString = languagesArray.joined(separator:", ")
            return languagesString
        } else {
            return "language unknown"
        }

    }
    
    private func convertCurrencies() -> String {
        var currenciesString = ""
        if let currencies = currencies {
            for value in currencies.values {
                var currenciesArray = [String]()
                let currency = value.name
                currenciesArray.append(currency ?? "")
                currenciesString = currenciesArray.joined(separator: ", ")
            }
        } else {
            currenciesString = "currency unknown"
        }
        return currenciesString
    }
    private func convertSymbols() -> String {
        var symbolsString = ""
        if let currencies = currencies {
            for value in currencies.values {
                var symbolsArray = [String]()
                let symbol = value.symbol
                symbolsArray.append(symbol ?? "")
                symbolsString = symbolsArray.joined(separator: ", ")
            }
        } else {
            symbolsString = "currency symbol unknown"
        }
        return symbolsString
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

