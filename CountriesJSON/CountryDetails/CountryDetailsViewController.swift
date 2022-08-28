//
//  ViewController.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import UIKit
protocol CountryDetailsViewInputProtocol: AnyObject {
    func displayCountryName(with title: String)
    func displayDescription(with title: String)
    func displayImage(with imageData: Data)
}

protocol CountryDetailsViewOutputProtocol: AnyObject {
    init(view: CountryDetailsViewInputProtocol)
    func showDetails()
}


class CountryDetailsViewController: UIViewController {
    
//MARK: IB Outlets
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
//MARK: Public properties
    var country: Country!
    var presenter: CountryDetailsViewOutputProtocol!

//MARK: Private properties
    private let configurator: CountryDetailsConfiguratorInputProtocol = CountryDetailsConfigurator()
    
//MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self, and: country)
        presenter.showDetails()
        tuneUI()
    }
}

//MARK: Private Methods
extension CountryDetailsViewController {
    private func tuneUI() {
        self.view.backgroundColor = .systemCyan
        flagImage.layer.masksToBounds = true
        flagImage.layer.borderWidth = 1.5
        flagImage.layer.borderColor = UIColor.white.cgColor
        flagImage.layer.cornerRadius = 10
    }
}
//MARK: - Extension CountryDetailsViewProtocol

extension CountryDetailsViewController: CountryDetailsViewInputProtocol {
    func displayCountryName(with title: String) {
        self.title = title
    }
    
    func displayDescription(with title: String) {
        descriptionLabel.text = title
    }
    
    func displayImage(with imageData: Data) {
        flagImage.image = UIImage(data: imageData)
    }
    
    
}

