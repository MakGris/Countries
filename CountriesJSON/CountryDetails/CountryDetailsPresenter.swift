//
//  CountryDetailsPresenter.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 08.09.2022.
//

import Foundation

protocol CountryDetailsPresentationLogic {
    func presentCountryDetails(response: CountryDetails.ShowDetails.Response)
}

class CountryDetailsPresenter: CountryDetailsPresentationLogic {
    
    weak var viewController: CountryDetailsDisplayLogic?
    
    func presentCountryDetails(response: CountryDetails.ShowDetails.Response) {
        
        let viewModel = CountryDetails.ShowDetails.ViewModel(
            countryName: response.countryName ?? "",
            countryDescription: response.countryDescription ?? "",
            flagImageData: response.flagImageData ?? Data()
        )
        viewController?.displayCountryDetails(viewModel: viewModel)
    }
}
