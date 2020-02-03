//
//  AuthorView.swift
//  talento
//
//  Created by Gökay Inan on 03.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct UserFeedView: View {
    
    let profileUserUser: User
    
    init(user:User){
        self.profileUserUser = user
    
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ProfilePictureView(currentUser: profileUserUser)
                    .clipped()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(profileUserUser.name)")
                            .font(.system(size: 14, weight: .bold))
                        Text("has participated")
                            .font(.system(size: 14, weight: .light))
                    }
                    
                }
                Spacer()
            }
        }
        .padding(.top, 16)
    }
}
