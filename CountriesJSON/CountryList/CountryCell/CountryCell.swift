//
//  CountryCell.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 24.05.2022.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}

class CountryCell: UITableViewCell, CellModelRepresentable {
    var viewModel: CellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
//    MARK: IB Outlets
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var countryNameLabel: UILabel!
    
//MARK: Methods
    private func updateViews() {
        guard let viewModel = viewModel as? CountryCellViewModel else { return }
        countryNameLabel.text = viewModel.countryName
        if let imageData = ImageManager.shared.fetchImageData(with: URL(string: viewModel.imageURL)) {
            flagImage.image = UIImage(data: imageData)
        }
        
        
    }
    
//    func configureCell(with country: Country) {
//        countryNameLabel.text = country.name?.official
//        NetworkManager.shared.fetchFlag(with: country) { result in
//            switch result {
//            case .success(let imageData):
//                DispatchQueue.main.async {
//                    self.flagImage.image = UIImage(data: imageData)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
}
