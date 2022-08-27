//
//  CountryDetailPresenter.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 27.08.2022.
//

import Foundation

struct CountryDetailsData {
    let countryName: String
    let countryDescription: String
    let imageData: Data?
}

class CountryDetailsPresenter: CountryDetailsViewOutputProtocol {
    unowned let view: CountryDetailsViewInputProtocol
    var interactor: CountryDetailsInteractorInputProtocol!
    
    required init(view: CountryDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideCountryDetails()
    }
}

//MARK: - CoutryDetailsInteractorOutputProtocol

extension CountryDetailsPresenter: CountryDetailsInteractorOutputProtocol {
    func reciveCountryDetails(with countryData: CountryDetailsData) {
        view.displayCountryName(with: countryData.countryName)
        view.displayDescription(with: countryData.countryDescription)
        
        guard let imageData = countryData.imageData else { return }
        view.displayImage(with: imageData)
    }
    
    
}
