//
//  CountriesListInteractor.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 29.08.2022.
//

import Foundation

protocol CountriesListInteractorInputProtocol: AnyObject {
    init(presenter: CountriesListInteractorOutputProtocol)
    func fetchCountries()
    func getCountry(at indexPath: IndexPath)
}

protocol CountriesListInteractorOutputProtocol: AnyObject {
    func countriesDidReceive(_ countries: [Country])
    func countryDidReceive(_ country: Country)
}

class CountriesListInteractor: CountriesListInteractorInputProtocol {
    unowned let presenter: CountriesListInteractorOutputProtocol
    
    required init(presenter: CountriesListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchCountries() {
        NetworkManager.shared.fetchCountries { result in
            switch result {
                
            case .success(let countries):
                self.presenter.countriesDidReceive(countries)
                DataManager.shared.setCountries(countries)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCountry(at indexPath: IndexPath) {
        let country = DataManager.shared.getCountry(at: indexPath)
        presenter.countryDidReceive(country)
    }
    
}
