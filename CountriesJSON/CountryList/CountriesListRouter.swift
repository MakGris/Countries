//
//  CountryListRouter.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 29.08.2022.
//

import Foundation

protocol CountriesListRouterInputController {
    init(viewController: CountriesListViewController)
    func openCountriesDetailsViewController(with country: Country)
}

class CountriesListRouter: CountriesListRouterInputController {
    unowned let viewController: CountriesListViewController
    required init(viewController: CountriesListViewController) {
        self.viewController = viewController
    }
    
    func openCountriesDetailsViewController(with country: Country) {
        viewController.performSegue(withIdentifier: "ShowDetails", sender: country)
    }
    
    
}
