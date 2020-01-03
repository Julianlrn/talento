//
//  FeedView.swift
//  talento
//
//  Created by Julian Lorenz on 08.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    
    var challenges: [Challenge] = challengesData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Feed")
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top, 16)
                ForEach(challenges) { item in
                    AuthorView()
                    ChallengeCardView(challenge: item)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(challenges: challengesData)
    }
}


    

