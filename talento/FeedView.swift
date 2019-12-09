//
//  FeedView.swift
//  talento
//
//  Created by Julian Lorenz on 08.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import SwiftUI
import FBSDKLoginKit
import Firebase
import FirebaseUI




struct FeedView: View {
    
    var body: some View {
        VStack {
            Text("Hello")
            AnyView(login().frame(width: 100, height: 50))
        }

    }
   
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}


    

