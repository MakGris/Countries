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
class CountriesListViewController: UITableViewController {
    
// MARK: Public Properties
    
    var interactor: CountriesListBusinessLogic?
    var router: (NSObjectProtocol & CountriesListRoutingLogic & CountriesListDataPassing)?
    
//    MARK: Private Properties
    
    private var rows: [CellIdentifiable] = []
    
//    MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CountriesListConfigurator.shared.configure(with: self)
        getCountries()
    }
//    MARK: Private Methods
    
    private func getCountries() {
        interactor?.fetchCountries()
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
         if let scene = segue.identifier {
             let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
             if let router = router, router.responds(to: selector) {
                 router.perform(selector, with: segue)
             }
         }
     }
}

//MARK: Countries List Display Logic

extension CountriesListViewController: CountriesListDisplayLogic {
    func displayCourses(viewModel: CountriesList.ShowCountries.ViewModel) {
        rows = viewModel.rows
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
