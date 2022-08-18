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
    var viewModel: CountryCellViewModelProtocol! {
        didSet {
            countryNameLabel.text = viewModel.countryName
            guard let imageData = viewModel.imageData else { return }
            flagImage.image = UIImage(data: imageData)
        }
    }
}
