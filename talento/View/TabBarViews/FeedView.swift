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
            VStack(spacing: 24) {
                ForEach(challenges) { item in
                    ChallengeCardView(challenge: item)
                }
            }
            .padding(.bottom, 32)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(challenges: challengesData)
    }
}


    

