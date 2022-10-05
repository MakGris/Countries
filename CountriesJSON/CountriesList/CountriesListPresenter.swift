//
//  CountriesListPresenter.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 30.09.2022.
//

protocol CountriesListPresentationLogic {
    func presentCountries(response: CountriesList.ShowCountries.Response)
}

class CountriesListPresenter: CountriesListPresentationLogic {
    
    weak var viewController: CountriesListDisplayLogic?
    
    func presentCountries(response: CountriesList.ShowCountries.Response) {
        var rows: [CountryCellViewModel] = []
        response.countries.forEach { country in
            rows.append(CountryCellViewModel(country: country))
        }
        
        let viewModel = CountriesList.ShowCountries.ViewModel(rows: rows)
        viewController?.displayCourses(viewModel: viewModel)
    }
    
    
}
