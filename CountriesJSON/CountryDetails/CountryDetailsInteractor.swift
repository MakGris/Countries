//
//  CountryDetailsInteractor.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 27.08.2022.
//

import Foundation

protocol CountryDetailsInteractorInputProtocol: AnyObject {
    init(presenter: CountryDetailsInteractorOutputProtocol, country: Country)
    func provideCountryDetails()
}

protocol CountryDetailsInteractorOutputProtocol: AnyObject {
    func reciveCountryDetails(with countryData: CountryDetailsData)
}

class CountryDetailsInteractor: CountryDetailsInteractorInputProtocol {
    unowned let presenter: CountryDetailsInteractorOutputProtocol
    private let country: Country
    
    
    required init(presenter: CountryDetailsInteractorOutputProtocol, country: Country) {
        self.presenter = presenter
        self.country = country
    }
    
    func provideCountryDetails() {
        let imageData = ImageManager.shared.fetchImageData(with: URL(string: country.flags?.png ?? ""))
        let countryDetailsData = CountryDetailsData(
            countryName: country.name?.official ?? "",
            countryDescription: country.description,
            imageData: imageData
        )
        
        presenter.reciveCountryDetails(with: countryDetailsData)
        
    }
}




