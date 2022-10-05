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

class CountriesListRouter: NSObject, CountriesListRoutingLogic, CountriesListDataPassing {
    
    weak var viewController: CountriesListViewController?
    var dataStore: CountriesListDataStore?
    
//    MARK: Routing
    
    func routeToCountryDetails(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! CountryDetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToCourseDetails(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "CountryDetailsViewController") as! CountryDetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToCourseDetails(source: dataStore!, destination: &destinationDS)
            navigateToCourseDetails(source: viewController!, destination: destinationVC)
        }
    }
    
//    MARK: Navigation
    
    func navigateToCourseDetails(source: CountriesListViewController, destination: CountryDetailsViewController) {
        source.show(destination, sender: nil)
    }
    
//    MARK: Passing data
    
    func passDataToCourseDetails(source: CountriesListDataStore, destination: inout CountryDetailsDataStore) {
        guard let indexPath = viewController?.tableView.indexPathForSelectedRow else { return }
        destination.country = source.countries[indexPath.row]
    }
}
