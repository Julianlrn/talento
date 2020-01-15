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
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(challenges) { item in
                    UserFeedView()
                    NavigationLink(destination: ChallengeDetailView(challenge: item)) {
                        ChallengeCardView(challenge: item)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal, 16)
            }.navigationBarTitle(Text("Feed"))
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(challenges: challengesData)
    }
}


    

