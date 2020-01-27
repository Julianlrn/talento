//
//  MediaEntryPictureView.swift
//  talento
//
//  Created by Julian Preissing  on 27.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct MediaEntryPictureView: View {
    let entry: entry
    init(entry:entry){
        self.entry = entry
        self.imageLoader = ImageLoader(urlString: entry.image)
        }
    @ObservedObject var imageLoader: ImageLoader
    var body: some View {
        Image(uiImage: imageLoader.data != nil ? UIImage(data: imageLoader.data!)! : UIImage())
        
    }
}