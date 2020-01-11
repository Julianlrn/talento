//
//  ChallengeDetailView.swift
//  talento
//
//  Created by Julian Lorenz on 12.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import Foundation
import SwiftUI
import FBSDKLoginKit
import Firebase
import FirebaseUI
import SlidingTabView



struct ChallengeDetailView: View {
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("BackButton") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
            }
    }
    
    
   
    
    var body: some View {
        VStack(){
            Text("hallo")
        }.border(Color.black)
            //.navigationBarItems(leading: btnBack)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                HStack {
                    btnBack
                    Button(action: {
                        print("General")
                    }) {
                            Text("General")
                                .fontWeight(.semibold)
                                .font(.title)
                        .foregroundColor(.black)
                    }
                    Button(action: {
                        print("Ranking")
                    }) {
                            Text("Ranking")
                                .fontWeight(.semibold)
                                .font(.title)
                        .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        print("Rate")
                    }) {
                            Text("Rate")
                                .fontWeight(.semibold)
                                .font(.title)
                        .foregroundColor(.black)
                    }
                }
                //.padding(.horizontal, 32)
            )
        
        
          //  .animation(.none)

    }
}

struct ChallengeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDetailView()
    }
}


    


