//
//  CountryDetailsModels.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 08.09.2022.
//

import Foundation

enum CountryDetails {
    
    enum ShowDetails {
       
        struct Response {
            let countryName: String?
            let countryDescription: String?
            let flagImageData: Data?
        }
        
        struct ViewModel {
            let countryName: String
            let countryDescription: String
            let flagImageData: Data
        }
    }
}
