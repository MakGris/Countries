//
//  CountryCellViewModel.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 28.08.2022.
//

import Foundation

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
}

protocol SectionRowRepresentable {
    var rows: [CellIdentifiable] { get set }
}

class CountryCellViewModel: CellIdentifiable {
    let countryName: String
    let imageURL: String
    
    var cellIdentifier: String {
        "country"
    }
    
    var cellHeight: Double {
        80
    }
    
    init(country: Country) {
        countryName = country.name?.official ?? "no name"
        imageURL = country.flags?.png ?? ""
    }
    
    
}

class CountrySectionViewModel: SectionRowRepresentable {
    var rows: [CellIdentifiable] = []
}
