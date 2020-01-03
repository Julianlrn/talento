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
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()
                    .colorMultiply(Color.init(red:0.96, green:0.11, blue:0.34, opacity: 1))
                    .overlay (
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("Michael 0301")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(Color.white)
                            }
                            HStack {
                                Text("keep it simple.")
                                    .font(.system(size: 24, weight: .light))
                                    .foregroundColor(Color.white)
                            }
                        }
                        .padding(.top, 150)
                        .padding(.trailing, 120)
                    )
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


