//
//  CountriesViewController.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import UIKit

protocol CountriesListViewInputProtocol: AnyObject {
    func reloadData(for section: CountrySectionViewModel)
}

protocol CountriesListViewOutputProtocol: AnyObject {
    init (view: CountriesListViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

class CountriesListViewController: UITableViewController {
// MARK: - Public Properties
    var presenter: CountriesListViewOutputProtocol!
    
//    MARK: Private Properties
    private let configurator: CountriesListConfiguratorInputProtocol = CountriesListConfigurator()
    private var section: SectionRowRepresentable = CountrySectionViewModel()
    
//    MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        configureTableVIewController()
        
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.section.rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = section.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as! CountryCell
        cell.viewModel = cellViewModel
        return cell
    }
    
//    MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(section.rows[indexPath.row].cellHeight)
    }
        
     // MARK: - Navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let detailVC = segue.destination as! CountryDetailsViewController
         let configurator: CountryDetailsConfiguratorInputProtocol = CountryDetailsConfigurator()
         configurator.configure(with: detailVC, and: sender as! Country)
     }
    
    private func configureTableVIewController() {
        tableView.separatorStyle = .none
}
}

// MARK: - CountriesListViewInputProtocol
extension CountriesListViewController: CountriesListViewInputProtocol {
    func reloadData(for section: CountrySectionViewModel) {
        self.section = section
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

