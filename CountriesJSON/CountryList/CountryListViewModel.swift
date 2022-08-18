//
//  CountryListViewModel.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 17.08.2022.
//

import Foundation

protocol CountryListViewModelProtocol {
    var countries: [Country] { get }
    
    func fetchCountries(completion: @escaping () -> Void)
    func numberOfRows () -> Int
    func cellViewModel(at indexPath: IndexPath) -> CountryCellViewModelProtocol
    func detailsViewModel(at indexPath: IndexPath) -> CountryDetailsViewModelProtocol
}

class CountryListViewModel: CountryListViewModelProtocol {
    
    
    var countries: [Country] = []
    
    func fetchCountries(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchCountries { result in
            switch result {
                
            case .success(let countries):
                self.countries = countries
                completion()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfRows() -> Int {
        countries.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CountryCellViewModelProtocol {
        let country = countries[indexPath.row]
        return CoountryCellViewModel(country: country)
    }
    
    func detailsViewModel(at indexPath: IndexPath) -> CountryDetailsViewModelProtocol {
        let country = countries[indexPath.row]
        return CountryDetailsViewModel(country: country)
    }
}
