//
//  CountryCellViewModel.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 17.08.2022.
//

import Foundation

protocol CountryCellViewModelProtocol {
    var countryName: String { get }
    var imageData: Data? { get }
    
    init(country: Country)
}

class CoountryCellViewModel: CountryCellViewModelProtocol {
    var countryName: String {
        country.name?.official ?? ""
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchFlagImage(from: URL(string: country.flags?.png ?? ""))
    }
    
    private let country: Country
    
    required init(country: Country) {
        self.country = country
    }
    
    
}
