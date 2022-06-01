//
//  Country.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import Foundation

struct Country: Decodable {
    let name: Name?
    var currencies: [Currency?]
    let capital: [String]?
    let languages: [String: String]?
    let area: Double?
    let population: Int?
    let flags: Flag?
    var description: String {
        """
Capital: \(capital?[0] ?? "Capital")
Languages: \(convertLanguages())
Area: \(area ?? 0) m²
Population: \(population ?? 0) people
Currency: \(convertCurrencies())
Currency symbol: \(convertSymbols())
"""
    }
    
    init(countryData: [String: Any]) {
        let nameData = countryData["name"] as? [String:Any] ?? [:]
        name = Name(countryData: nameData)
        
        currencies = []
        let currenciesData = countryData["currencies"] as? [String:[String: Any]] ?? [:]
        for key in currenciesData.keys {
            self.currencies.append(Currency(countryData: currenciesData[key] ?? [:]))
        }
        
        capital = countryData["capital"] as? [String]
        
        languages = countryData["languages"] as? [String: String]
        
        area = countryData["area"] as? Double
        
        population = countryData["population"] as? Int
        
        let flagsData = countryData["flags"] as? [String:Any] ?? [:]
        flags = Flag(countryData: flagsData)
    }
    
    static func getCountries(from value: Any) -> [Country] {
        guard let countriesData = value as? [[String:Any]] else { return [] }
        var countries: [Country] = []
        for countryData in countriesData {
            let country = Country(countryData: countryData)
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
        var currenciesNamesString = ""
        var currenciesNamesArray = [String]()
        for currency in currencies {
            let currencyName = currency?.name ?? ""
            currenciesNamesArray.append(currencyName)
            currenciesNamesString = currenciesNamesArray.joined(separator: ", ")
        }
        if currenciesNamesString.isEmpty {
            currenciesNamesString = "language unknown"
        }
        return currenciesNamesString
        
    }
    
    private func convertSymbols() -> String {
        var currenciesSymbolsString = ""
        var currenciesSymbolsArray = [String]()
        for currency in currencies {
            let currencySymbol = currency?.symbol ?? ""
            currenciesSymbolsArray.append(currencySymbol)
            currenciesSymbolsString = currenciesSymbolsArray.joined(separator: ", ")
        }
        if currenciesSymbolsString.isEmpty {
            currenciesSymbolsString = "currency symbol unknown"
        }
        return currenciesSymbolsString
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

