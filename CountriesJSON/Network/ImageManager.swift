//
//  ImageManager.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 08.09.2022.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchFlagData(from url: URL?, completion: @escaping (Data) -> Void) {
        DispatchQueue.main.async {
            guard let url = url else { return }
            if let imageData = try? Data(contentsOf: url) {
                completion(imageData)
            } else { return }
    }
    }
    func fetchImageData(from url: URL?) -> Data? {
        var flagData = Data()
        fetchFlagData(from: url) { data in
            flagData = data
        }
        return flagData
    }

}
