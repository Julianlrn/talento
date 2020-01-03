//
//  ChallengesView.swift
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


struct ChallengeView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Welcome to Challenges!")
            }.navigationBarTitle("Challenges")
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}


    

