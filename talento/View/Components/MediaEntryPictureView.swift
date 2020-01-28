//
//  MediaEntryPictureView.swift
//  talento
//
//  Created by Julian Preissing  on 27.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct MediaEntryPictureView: View {

    @ObservedObject var userList = UserList()

    let entry: entry

    init(entry:entry){
        self.entry = entry
        self.imageLoader = ImageLoader(urlString: entry.image)
    }

    let entry: entry
    init(entry:entry){
        self.entry = entry
        self.imageLoader = ImageLoader(urlString: entry.image)
    }

    @ObservedObject var imageLoader: ImageLoader
    var body: some View {
        /*Image(uiImage: imageLoader.data != nil ? UIImage(data: imageLoader.data!)! : UIImage())
            .resizable()
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)*/

        GeometryReader { geo in
            Image(uiImage: self.imageLoader.data != nil ? UIImage(data: self.imageLoader.data!)! : UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: geo.size.width)
        }
    }
}
