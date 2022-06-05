//
//  FlagImageView.swift
//  CountriesJSON
//
//  Created by Maksim Grischenko on 05.06.2022.
//

import UIKit

class FlagImageView: UIImageView {
    
    func fetchImage(from url: String) {
        guard let url = URL(string: url) else {
            image = UIImage(named: "ar")
            return
        }
//        Загрузка из кэша
        if let cachedImage = getCachedImage(from: url) {
            image = cachedImage
            return
        }
        
        
        //        загрузка из сети
        ImageManager.shared.fetchFlagCacheMethod(from: url) { data, response in
            self.image = UIImage(data: data)
            self.saveDataToCache(with: data, and: response)
            
        }
    }
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        let cachedResponse = CachedURLResponse(response: response, data: data)
        guard let responseUrl = response.url else { return }
        let request = URLRequest(url: responseUrl)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
}
