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

class NetworkManager {
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
                    DispatchQueue.main.async {
                        completionHandler(.success(imageData))
                    }
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
//    Метод для кэша картинок
    
}

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchFlagCacheMethod(from url: URL, completionHandler: @escaping(Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "no error description")
                return
            }
            guard url == response.url else { return }
            DispatchQueue.main.async {
                completionHandler(data, response)
            }

        }.resume()
    }
}

