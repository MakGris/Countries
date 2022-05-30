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
//    init(countryData: [String: Any]) {
//    name = countryData["name"] as? Name
//    currencies = countryData["currencies"] as? [String: Currency]
//    capital = countryData["capital"] as? [String]
//    languages = countryData["languages"] as? [String: String]
//    area = countryData["area"] as? Double
//    population = countryData["population"] as? Int
//    flags = countryData["flags"] as? Flag
//    }
    
    static func getCountries(from value: Any) -> [Country] {
        guard let countriesData = value as? [[String:Any]] else { return [] }
        var countries: [Country] = []
        for countryData in countriesData {
            let nameFromJson = Name(countryData: countryData)
            let currencyFromJson = Currency(countryData: countryData)
            let flagFromJson = Flag(countryData: countryData)
            let country = Country(
                name: countryData["name"] as? Name,
                currencies: countryData["currencies"] as? [String: Currency],
                capital: countryData["capital"] as? [String],
                languages: countryData["languages"] as? [String: String],
                area: countryData["area"] as? Double,
                population: countryData["population"] as? Int,
                flags: countryData["flags"] as? Flag)
            countries.append(country)
        }
        return countries
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
    
    init(countryData: [String: Any]) {
        official = countryData["official"] as? String

    }
    }
    


struct Currency: Decodable {
    let name: String?
    let symbol: String?
    
    init(countryData: [String: Any]) {
        name = countryData["name"] as? String
        symbol = countryData["symbol"] as? String
    }
}

struct Flag: Decodable {
    let png: String?
    let svg: String?
    init(countryData: [String: Any]) {
        png = countryData["png"] as? String
        svg = countryData["svg"] as? String
    }
}

