//
//  CountriesListInteractor.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 30.09.2022.
//

import Foundation

protocol CountriesListBusinessLogic {
    func fetchCourses()
}

protocol CountriesListDataStore {
    var countries: [Country] { get }
}

class CountriesListInteractor: CountriesListBusinessLogic, CountriesListDataStore {
    var presenter: CountriesListPresentationLogic?
    var countries: [Country] = []
    
    func fetchCourses() {
        NetworkManager.shared.fetchCountries { [self] result in
            switch result {
                
            case .success(let fetchedCountries):
                self.countries = fetchedCountries
                let response = CountriesList.ShowCountries.Response(countries: countries)
                self.presenter?.presentCourses(response: response)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
