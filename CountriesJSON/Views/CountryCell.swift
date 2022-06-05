//
//  CountryCell.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 24.05.2022.
//

import UIKit

class CountryCell: UITableViewCell {
    
//    MARK: IB Outlets
    @IBOutlet var flagImage: FlagImageView!
    @IBOutlet var countryNameLabel: UILabel!
    
//MARK: Methods
    func configureCell(with country: Country) {
        flagImage.layer.cornerRadius = 10
        countryNameLabel.text = country.name?.official
//        присвоение картинки из кэша или из сети
        flagImage.fetchImage(from: country.flags?.png ?? "")
        
//        метод для присвоения картинки с помощью alamofire
//        NetworkManager.shared.fetchFlagAlamoFire(with: country) { result in
//            switch result {
//
//            case .success(let imageData):
//                    self.flagImage.image = UIImage(data: imageData)
//
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}
