//
//  NetworkManager.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 25.05.2022.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case badURL
    case invalidData
    case decodeError
}

struct NetworkManager {
    static let shared = NetworkManager()
    private let urlString = "https://restcountries.com/v3.1/all"
    
    private init () {}

    func fetchCountries(completionHandler: @escaping(Result <[Country], NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completionHandler(.failure(.invalidData))
                return
            }

            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(countries))
                }
            } catch let error {
                print(error)
                completionHandler(.failure(.decodeError))
            }

        }.resume()
    }
    func fetchFlag(with country: Country, completionHandler: @escaping(Result <Data, NetworkError>) -> Void ) {
        DispatchQueue.global().async {
            guard let url = URL(string: country.flags?.png ?? "") else {
                completionHandler(.failure(.badURL))
                return
                
            }
            if let imageData = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    completionHandler(.success(imageData))
                }
            } else {
                completionHandler(.failure(.invalidData))
                return
            }
        }
    }
    func fetchCountriesAlamoFire() {
        
    }
}
