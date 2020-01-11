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
        NavigationView{
            VStack{
                NavigationLink(destination:ChallengeDetailView()){
                Text("Eintrag")
                
                }
                AnyView(login().frame(width: 100, height: 50))
            }.navigationBarTitle("Feed")
            .edgesIgnoringSafeArea(.all)
            
            
        }

    }
   
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}


    

