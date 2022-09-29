//
//  CountriesListModels.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 29.09.2022.
//

import Foundation

typealias CountryCellViewModel = CountriesList.ShowCountries.ViewModel.CountryCellViewModel

protocol CellIdentifiable {
    var identifier: String { get }
    var height: Double { get }
}

enum CountriesList {
    
    enum ShowCountries {
        struct Response {
            let countries: [Country]
        }
        
        struct ViewModel {
            struct CountryCellViewModel: CellIdentifiable {
                let name: String
                let imageURL: String
                
                var identifier: String {
                    "country"
                }
                
                var height: Double {
                    80
                }
                
                init(country: Country) {
                    name = country.name?.official ?? ""
                    imageURL = country.flags?.png ?? ""
                }
                
                
            }
            let rows: [CountryCellViewModel]
        }
    }
}
