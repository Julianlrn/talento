//
//  ImageLoader.swift
//  talento
//
//  Created by Julian Preissing  on 15.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//
import Foundation
import Combine

@available(iOS 13.0.0, *)
class ImageLoader: ObservableObject {
    @Published var data:Data?

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
