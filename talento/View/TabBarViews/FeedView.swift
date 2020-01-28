//
//  FeedView.swift
//  talento
//
//  Created by Julian Lorenz on 08.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    
   @ObservedObject var challenges = ChallengeData()
    
    var body: some View {
        if challenges.challengeData.count != 0 {
        return AnyView(
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(challenges.challengeData) { item in
                    //if{
                    UserFeedView()
                    NavigationLink(destination: ChallengeDetailView(imageLoader: ImageLoader(urlString: item.image), challenge: item)) {
                       ChallengeCardView(challenge: item, imageLoader: ImageLoader(urlString: item.image))
                    }
                    .buttonStyle(PlainButtonStyle())
                //}
                }
                .padding(.horizontal, 16)
            }.navigationBarTitle(Text("Feed"))
        })
        }
        else {
            return AnyView(
                VStack{
                    Text("Loading")
                    Spacer()
                }.padding(.top, 120)
            )
        }
    }
}

/*struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(challenges: challenges)
    }
}*/


    

