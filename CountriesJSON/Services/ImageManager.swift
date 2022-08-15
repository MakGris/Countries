//
//  ImageManager.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 15.08.2022.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init () {}
    
    func fetchFlagImage(from url: URL?) -> Data? {
        guard let url = url else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}
