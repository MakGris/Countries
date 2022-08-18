//
//  CountriesViewController.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import UIKit

class CountryListViewController: UITableViewController {
    
//    MARK: Private Properties
    private var viewModel: CountryListViewModelProtocol! {
        didSet {
            viewModel.fetchCountries {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
//    MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CountryListViewModel()
        configureTableVIewController()
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? CountryDetailsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailVC.viewModel = viewModel.detailsViewModel(at: indexPath)
    }


    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath) as! CountryCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


        

//MARK: Private Methods
extension CountryListViewController {
    private func configureTableVIewController() {
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
    }
}
