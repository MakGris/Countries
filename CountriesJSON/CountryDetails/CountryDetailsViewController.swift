//
//  ViewController.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 23.05.2022.
//

import UIKit

protocol CountryDetailsDisplayLogic: AnyObject {
    func displayCountryDetails(viewModel: CountryDetails.ShowDetails.ViewModel)
}

class CountryDetailsViewController: UIViewController {
    
//MARK: IB Outlets
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
//MARK: Public properties
    var country: Country!
    var interactor: CountryDetailsBusinessLogic?
    var router: (NSObjectProtocol & CountryDetailsRoutingLogic & CountryDetailsDataPassing)?
    
//MARK: Override Methods
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passRequest()
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
    private func setup() {
        let viewController = self
        let interactor = CountryDetailsInteractor()
        let presenter = CountryDetailsPresenter()
        let router = CountryDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    private func passRequest() {
        interactor?.provideCountryDetails()
    }
}

extension CountryDetailsViewController: CountryDetailsDisplayLogic {
    func displayCountryDetails(viewModel: CountryDetails.ShowDetails.ViewModel) {
        title = viewModel.countryName
        descriptionLabel.text = viewModel.countryDescription
        flagImage.image = UIImage(data: viewModel.flagImageData)
    }
    
    
}


