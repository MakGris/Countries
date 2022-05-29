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
    
//    MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableVIewController()
        fetchWithAlamoFire()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedCountries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath) as! CountryCell
        let country = fetchedCountries[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = country.name?.official
        cell.contentConfiguration = content
//        cell.configureCell(with: country)
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
//        fetchWithAlamoFire()
//        NetworkManager.shared.fetchCountries { result in
//            switch result {
//            case .success(let countries):
//                self.fetchedCountries = countries
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    func fetchWithAlamoFire() {
        AF.request(urlString)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                    
                case .success(let value):
                    self.fetchedCountries = Country.getCountries(from: value)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
