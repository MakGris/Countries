//
//  CountryListConfigurator.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 29.08.2022.
//

import Foundation

protocol CountriesListConfiguratorInputProtocol {
    func configure(with viewcontroller: CountriesListViewController)
}

class CountriesListConfigurator: CountriesListConfiguratorInputProtocol {
    func configure(with viewcontroller: CountriesListViewController) {
        let presenter = CountriesListPresenter(view: viewcontroller)
        let interactor = CountriesListInteractor(presenter: presenter)
        let router = CountriesListRouter(viewController: viewcontroller)
        
        viewcontroller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
    }
    
    
}
