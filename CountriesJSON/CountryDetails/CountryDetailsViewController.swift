//
//  ViewController.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    
//MARK: IB Outlets
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
//MARK: Public properties
    var country: Country!
    var viewModel: CountryDetailsViewModelProtocol!
    
//MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CountryDetailsViewModel(country: country)
        tuneUI()
    }
}

//MARK: Private Methods
extension CountryDetailsViewController {
    private func tuneUI() {
        descriptionLabel.text = viewModel.description
        title = viewModel.countryName
        guard let imageData = viewModel.imageData else { return }
        flagImage.image = UIImage(data: imageData)
        self.view.backgroundColor = .systemCyan
        flagImage.layer.masksToBounds = true
        flagImage.layer.borderWidth = 1.5
        flagImage.layer.borderColor = UIColor.white.cgColor
        flagImage.layer.cornerRadius = 10
    }
}


