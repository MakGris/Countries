//
//  ViewController.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
//MARK: IB Outlets
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
//MARK: Public properties
    var country: Country!
    
//MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFlag()
        tuneUI()
    }
}

//MARK: Private Methods
extension DetailViewController {
    private func tuneUI() {
        descriptionLabel.text = country.description
        title = country.name?.official
        self.view.backgroundColor = .systemCyan
        flagImage.layer.masksToBounds = true
        flagImage.layer.borderWidth = 1.5
        flagImage.layer.borderColor = UIColor.white.cgColor
        flagImage.layer.cornerRadius = 10
    }
    private func fetchFlag() {
        NetworkManager.shared.fetchFlag(with: country) { result in
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


