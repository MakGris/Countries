//
//  CountriesListRouter.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 03.10.2022.
//

import UIKit

@objc protocol CountriesListRoutingLogic {
    func routeToCountryDetails(segue: UIStoryboardSegue?)
}

protocol CountriesListDataPassing {
    var dataStore: CountriesListDataStore? { get }
}

class CountriesListRouter: CountriesListRoutingLogic, CountriesListDataPassing {
    
    weak var viewController: CountriesViewController?
    var dataStore: CountriesListDataStore?
    
    
    func routeToCountryDetails(segue: UIStoryboardSegue?) {
        <#code#>
    }
}
