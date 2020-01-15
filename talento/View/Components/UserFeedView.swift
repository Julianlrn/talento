//
//  AuthorView.swift
//  talento
//
//  Created by Gökay Inan on 03.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct UserFeedView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    HStack {
                        Text("michael0301")
                            .font(.system(size: 14, weight: .bold))
                        Text("has participated")
                            .font(.system(size: 14, weight: .light))
                    }
                    Text("3 hours ago")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                }
                Spacer()
            }
        }
        .padding(.top, 16)
    }
}

struct UserFeedView_Previews: PreviewProvider {
    static var previews: some View {
        UserFeedView()
            .previewLayout(.sizeThatFits)
    }
}
