//
//  NetworkManager.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 25.05.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case badURL
    case invalidData
    case decodeError
}

struct NetworkManager {
    static let shared = NetworkManager()
    private let urlString = "https://restcountries.com/v3.1/all"
    
    private init () {}

    
    func fetchFlagAlamoFire(
        with country: Country,
        completionHandler: @escaping(Result <Data, NetworkError>) -> Void
    ) {
        AF.request(country.flags?.png ?? "")
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                    
                case .success(let value):
                    let imageData = value
                    completionHandler(.success(imageData))
                case .failure:
                    completionHandler(.failure(.invalidData))
                }
            }
    }
    func fetchWithAlamoFire(
        completionHandler: @escaping(Result <[Country], NetworkError>) -> Void)
    {
        AF.request(urlString)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let countries = Country.getCountries(from: value)
                    DispatchQueue.main.async {
                        completionHandler(.success(countries))
                    }
                case .failure:
                    completionHandler(.failure(.decodeError))
                }
            }
    }
}
