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
    
    var challenges: [Challenge] = challengesData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Challenges")
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top, 16)
                ForEach(challenges) { item in
                    ChallengeCardView(challenge: item)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView(challenges: challengesData)
    }
}


    

