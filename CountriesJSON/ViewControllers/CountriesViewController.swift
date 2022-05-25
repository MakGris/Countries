//
//  CountriesViewController.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import UIKit

class CountriesViewController: UITableViewController {
    
    private let url = "https://restcountries.com/v3.1/all"
    private var fetchedCountries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCountries()
        tableView.rowHeight = 80
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedCountries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath) as! CountryCell
        let country = fetchedCountries[indexPath.row]
        cell.configure(with: country)
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
    private func fetchCountries() {
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
