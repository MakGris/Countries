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
    
//    MARK: IB Outlets
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var countryNameLabel: UILabel!
    
// MARK: Public Properties
    var viewModel: CellIdentifiable? {
        didSet {
            updateView()
        }
    }
    
//MARK: Methods
//    func updateView() {
//        guard let viewModel = viewModel as? CountryCellViewModel else { return }
//        countryNameLabel.text = viewModel.name
//        if let imageData = ImageManager.shared.fetchImageData(from: URL(string: viewModel.imageURL)) {
//            flagImage.image = UIImage(data: imageData)
//        }
//    }
    
    func updateView() {
        guard let viewModel = viewModel as? CountryCellViewModel else { return }
        countryNameLabel.text = viewModel.name
        NetworkManager.shared.fetchFlag(from: URL(string: viewModel.imageURL)) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.flagImage.image = UIImage(data: data)
                }
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
}
