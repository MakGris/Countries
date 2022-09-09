//
//  CountryDetailsWorker.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 08.09.2022.
//

import Foundation

class CountryDetailsWorker {
    func getImage(from url: URL?) -> Data? {
        ImageManager.shared.fetchImageData(from: url)
    }
}
