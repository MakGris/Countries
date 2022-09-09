//
//  CountryDetailsRouter.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 09.09.2022.
//

import Foundation

@objc protocol CountryDetailsRoutingLogic {
}

protocol CountryDetailsDataPassing {
    var dataStore: CountryDetailsDataStore? { get }
}

class CountryDetailsRouter: NSObject, CountryDetailsRoutingLogic, CountryDetailsDataPassing {
    
    weak var viewController: CountryDetailsViewController?
    var dataStore: CountryDetailsDataStore?
  
}
