//
//  CountriesListConfigurator.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 05.10.2022.
//

import Foundation

final class CountriesListConfigurator {
    
    static let shared = CountriesListConfigurator()
    
    private init() {}
    
    func configure(with viewController: CountriesListViewController) {
        let viewController = viewController
        let interactor = CountriesListInteractor()
        let presenter = CountriesListPresenter()
        let router = CountriesListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
