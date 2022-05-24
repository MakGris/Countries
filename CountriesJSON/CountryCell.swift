//
//  CountryCell.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 24.05.2022.
//

import UIKit

class CountryCell: UITableViewCell {
    @IBOutlet var flagImageOutlet: UIImageView!
    @IBOutlet var countryNameLabel: UILabel!
    
    
    func configure(with country: Country) {
        countryNameLabel.text = country.name?.official
        DispatchQueue.global().async {
            guard let url = URL(string: country.flags?.png ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.flagImageOutlet.image = UIImage(data: imageData)
            }
        }
    }
}
