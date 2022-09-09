//
//  CountryDetailsInteractor.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 08.09.2022.
//

import Foundation

protocol CountryDetailsBusinessLogic {
    func provideCountryDetails()
}

protocol CountryDetailsDataStore {
    var country: Country? {get set}
}

class CountryDetailsInteractor: CountryDetailsBusinessLogic, CountryDetailsDataStore {
    var presenter: CountryDetailsPresentationLogic?
    var worker: CountryDetailsWorker?
    var country: Country?
    
    
    func provideCountryDetails() {
        
        worker = CountryDetailsWorker()
        let imageData = worker?.getImage(from: URL(string: country?.flags?.png ?? ""))
        
        let response = CountryDetails.ShowDetails.Response(
            countryName: country?.name?.official,
            countryDescription: country?.description,
            flagImageData: imageData
        )
        presenter?.presentCountryDetails(response: response)
    }
    
    
    
    
}
