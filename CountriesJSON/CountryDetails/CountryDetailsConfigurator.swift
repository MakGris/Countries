//
//  CountryDetailsConfigurator.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 27.08.2022.
//

import Foundation

protocol CountryDetailsConfiguratorInputProtocol {
    func configure(with view: CountryDetailsViewController, and course: Country)
}

class CountryDetailsConfigurator: CountryDetailsConfiguratorInputProtocol {
    func configure(with view: CountryDetailsViewController, and country: Country) {
        let presenter = CountryDetailsPresenter(view: view)
        let interactor = CountryDetailsInteractor(presenter: presenter, country: country)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
    
    
}
