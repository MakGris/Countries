//
//  CountryDetailsViewModel.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 15.08.2022.
//

import Foundation

protocol CountryDetailsViewModelProtocol {
    var countryName: String { get }
    var imageData: Data? { get }
    var description: String { get }
    
    init(country: Country)
}

class CountryDetailsViewModel: CountryDetailsViewModelProtocol {
    var countryName: String {
        country.name?.official ?? ""
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchFlagImage(from: URL(string: country.flags?.png ?? ""))
    }
    
    var description: String {
        country.description
    }
    
    private let country: Country
    
    required init(country: Country) {
        self.country = country
    }
    
    
}
