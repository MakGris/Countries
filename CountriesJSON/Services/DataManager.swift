//
//  DataManager.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 29.08.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private var countries: [Country] = []
    
    private init() {}
    
    func setCountries(_ countries: [Country]) {
        self.countries = countries
    }
    
    func getCountry(at indexPath: IndexPath) -> Country {
        countries[indexPath.row]
    }
}
