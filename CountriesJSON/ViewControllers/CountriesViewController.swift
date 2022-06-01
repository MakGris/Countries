//
//  CountriesViewController.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import UIKit
import Alamofire

class CountriesViewController: UITableViewController {
    
//    MARK: Private Properties
    private let urlString = "https://restcountries.com/v3.1/all"
    private var fetchedCountries: [Country] = []
    private var spinnerView: UIActivityIndicatorView?
    
    
//    MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableVIewController()
        fetchCountriesWithAlamoFire()
        
        
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedCountries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath) as! CountryCell
        let country = fetchedCountries[indexPath.row]
        cell.configureCell(with: country)
        return cell
    }
        
     // MARK: - Navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let detailVC = segue.destination as? DetailViewController else { return }
         guard let indexPath = tableView.indexPathForSelectedRow else { return }
         let country = fetchedCountries[indexPath.row]
         detailVC.country = country
     }
}

//MARK: Private Methods
extension CountriesViewController {
    private func configureTableVIewController() {
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        spinnerView = showSpinner(in: navigationController?.view ?? tableView)
        title = "Countries App"
    }
    private func fetchCountriesWithAlamoFire() {
        NetworkManager.shared.fetchWithAlamoFire { result in
            switch result {
                
            case .success(let countries):
                self.fetchedCountries = countries
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.spinnerView?.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
}
