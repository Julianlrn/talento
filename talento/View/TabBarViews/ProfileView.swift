//
//  ProfileView.swift
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

struct ProfileView: View {
    
        var body: some View {
            NavigationView {
                VStack {
                    
                    Text("Welcome to Profile!")
                }.navigationBarTitle("Profile")
            }
        }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


