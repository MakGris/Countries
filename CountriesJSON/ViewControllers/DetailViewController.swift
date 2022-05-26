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
        configureDetailController()
    }
}

//MARK: Private Methods
extension DetailViewController {
    private func configureDetailController() {
        descriptionLabel.text = country.description
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


