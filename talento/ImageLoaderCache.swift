//
//  ImageLoaderCache.swift
//  talento
//
//  Created by Julian Preissing  on 27.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import Foundation

var sharedCache = ImageLoaderCache()

class ImageLoaderCache{
    var cache: [String:Data] = [:]
    
    func addToCache(key: String, data: Data){
        cache[key]=data
    }
    
    func getFromCache(key: String) -> Data?{
        return cache[key]
    }
}
