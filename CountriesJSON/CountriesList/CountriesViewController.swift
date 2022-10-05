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
    
// MARK: Public Properties
    var interactor: CountriesListBusinessLogic?
    
//    MARK: Private Properties
    private var rows: [CellIdentifiable] = []
    private var fetchedCountries: [Country] = []
    
//    MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureTableVIewController()
        
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.identifier, for: indexPath) as! CountryCell
        cell.viewModel = cellViewModel
        
        return cell
    }
    
//    MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(rows[indexPath.row].height)
    }
     // MARK: - Navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let detailVC = segue.destination as? CountryDetailsViewController else { return }
         guard let indexPath = tableView.indexPathForSelectedRow else { return }
         let country = fetchedCountries[indexPath.row]
//         detailVC.country = country
     }
}

//MARK: Countries List Display Logic
extension CountriesViewController: CountriesListDisplayLogic {
    func displayCourses(viewModel: CountriesList.ShowCountries.ViewModel) {
        rows = viewModel.rows
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    
    
//    private func configureTableVIewController() {
//        tableView.rowHeight = 80
//        tableView.separatorStyle = .none
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
//    }
}
