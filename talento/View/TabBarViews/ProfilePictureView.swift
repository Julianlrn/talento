//
//  ProfilePictureView.swift
//  talento
//
//  Created by Julian Preissing ;) on 27.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//
import SwiftUI
import Firebase


struct ProfilePictureView: View {
    
    
    static var currentUser = UserList().getCurrentUser()
    
    init(currentUser:User){
        ProfilePictureView.self.currentUser = currentUser
        //print("currentUserPicURL: " + currentUser.image)
        self.imageLoader = ImageLoader(urlString: currentUser.image)
        }
    @ObservedObject var imageLoader: ImageLoader
    var body: some View {
        Image(uiImage: imageLoader.data != nil ? UIImage(data: imageLoader.data!)! : UIImage())
        .resizable()
        .aspectRatio(contentMode: .fill) 
    }
}
