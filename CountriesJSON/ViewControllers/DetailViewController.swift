//
//  ViewController.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var country: Country!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }


}

extension DetailViewController {
    func configure() {
        descriptionLabel.text = country.description
        DispatchQueue.global().async {
            guard let url = URL(string: self.country.flags?.png ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.flagImage.image = UIImage(data: imageData)
            }
        }
    }
}


