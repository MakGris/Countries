//
//  CountriesViewController.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import UIKit
protocol CountriesListDisplayLogic: AnyObject {
    func displayCourses(viewModel: CountriesList.ShowCountries.ViewModel)
}
class CountriesViewController: UITableViewController {
    
//    MARK: Private Properties
    private var fetchedCountries: [Country] = []
    
//    MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableVIewController()
        
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
         guard let detailVC = segue.destination as? CountryDetailsViewController else { return }
         guard let indexPath = tableView.indexPathForSelectedRow else { return }
         let country = fetchedCountries[indexPath.row]
         detailVC.country = country
     }
}

//MARK: Private Methods
extension CountriesViewController: CountriesListDisplayLogic {
    func displayCourses(viewModel: CountriesList.ShowCountries.ViewModel) {
        <#code#>
    }
    
    
    
    
    private func configureTableVIewController() {
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        NetworkManager.shared.fetchCountries { result in
            switch result {
            case .success(let countries):
                self.fetchedCountries = countries
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
