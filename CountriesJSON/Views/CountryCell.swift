//
//  CountryCell.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 24.05.2022.
//

import UIKit

class CountryCell: UITableViewCell {
    
//    MARK: IB Outlets
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var countryNameLabel: UILabel!
    
//MARK: Methods
    func configureCell(with country: Country) {
        flagImage.layer.cornerRadius = 10
        countryNameLabel.text = country.name?.official
        NetworkManager.shared.fetchFlagAlamoFire(with: country) { result in
            switch result {
                
            case .success(let imageData):
                DispatchQueue.main.async {
                    self.flagImage.image = UIImage(data: imageData)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
