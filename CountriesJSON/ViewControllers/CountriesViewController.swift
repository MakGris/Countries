//
//  CountriesViewController.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import UIKit

class CountriesViewController: UITableViewController {
    
    let url = "https://restcountries.com/v3.1/all"
    var countries: [Country] = []
    var image: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCountries()
        tableView.rowHeight = 80
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath) as! CountryCell
        let country = countries[indexPath.row]
        cell.configure(with: country)
        return cell
    }
        
        
        
       
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
extension CountriesViewController {
    func fetchCountries() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self.countries = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}
