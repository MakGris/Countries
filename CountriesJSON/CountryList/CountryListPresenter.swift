//
//  CountryListPresenter.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 29.08.2022.
//

import Foundation

class CountriesListPresenter: CountriesListViewOutputProtocol {
    unowned let view: CountriesListViewInputProtocol
    var interactor: CountriesListInteractorInputProtocol!
    var router: CountriesListRouterInputController!
    
    
    
    required init(view: CountriesListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchCountries()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        interactor.getCountry(at: indexPath)
    }
}

extension CountriesListPresenter: CountriesListInteractorOutputProtocol {
    
    func countriesDidReceive(_ countries: [Country]) {
        let section = CountrySectionViewModel()
        
        countries.forEach { country in
            let cellViewModel = CountryCellViewModel(country: country)
            section.rows.append(cellViewModel)
        }
        view.reloadData(for: section)
    }
    
    func countryDidReceive(_ country: Country) {
        router.openCountriesDetailsViewController(with: country)
    }
    
    
}
