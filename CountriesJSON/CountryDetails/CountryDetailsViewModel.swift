//
//  CountryDetailsViewModel.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 15.08.2022.
//

import Foundation

protocol CountryDetailsViewModelProtocol {
    var imageData: Data? { get }
    var description: String { get }
}
